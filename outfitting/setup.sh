#!/usr/bin/env bash
################
# OUTFITTING my Ubuntu
# This works hand-in-glove with 1-basic-setup, but my intent was to make it
# canonical to put non-essential scripts that get a new Ubuntu to my liking
# in the outfitting directory.
#
# I need to rethink whether "outfitting" makes sense or whether I need a
# different way to separate the essential from the nonessential.
################

if [ "$1" == "--all" ]
then
  echo "Nothing changes for now."
  #Because sudo apt install is fine to rerun
else
  echo "Nothing changes for now."

#  echo "I believe everything in outfitting/setup.sh has been installed, "
#  echo "  so I have nothing to install from outfitting/setup.sh."
fi

sudo apt install pidgin
echo "TODO: Python script to read a list of things already installed and "
echo "  save us time of attempting."
#Why Python? because list manipulation in bash is horrid.

sudo apt install redshift
sudo apt install chromium
sudo apt install vlc
sudo apt install bluefish
sudo apt install lynx
sudo apt install p7zip-full
