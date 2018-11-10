#!/bin/bash
#
# 5 TRANSLATION
# How many things from http://fosmt.org/ can I build myself?
########################################

date '+%Y/%m/%d_%H:%M:%S' >> diskspace-before-5-translation.txt
df -vH >> diskspace-before-5-translation.txt

declare -A git_urls

if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  ## Not from fosmt but in a class by itself: OpenNMT
  openNMT/setup.sh


  # # translation/01-apertium-matxin.sh
  # 3 should be OpenLogos
  # 4 anusaaraka

  # # translation/05-mosesdecoder.sh
  # 6 phramer
  # Deprecated list at the bottom.

  git_urls=(
    [mosesdecoder]=https://github.com/moses-smt/mosesdecoder.git  \
    [joshua]=https://github.com/joshua-decoder/joshua
    [nematus]=https://github.com/EdinburghNLP/nematus
  ) 

else
  #TODO learn how to append to an associative array
  git_urls=(
    [nematus]=https://github.com/EdinburghNLP/nematus
  ) 

fi

for short_name in "${!git_urls[@]}"
do
  cd ~/code
	echo "Now cloning $short_name."
  url="${git_urls[$short_name]}"
  git clone $url

  cd $short_name
	echo "Now building $short_name."
  cd $short_name
  ./autogen.sh
  ./configure
  make
  make install
  cd ~/code

  #if it exists
  ~/u/translation/$short_name/setup.sh  
done

  # Marie is deprecated
  # Anusaaraka is deprecated.
  # # [anusaaraka]=https://bitbucket.org/anusaaraka/anusaaraka.git \
