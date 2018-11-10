################################################################################
# MOSES - BASELINE
#http://www.statmt.org/moses/?n=Moses.Baseline
################################################################################

cd ~/code/mosesdecoder/

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
if [ "$1" == "--all" ] 
then
  echo "--all was passed so I will install all."
  cd ~/code
  git clone https://github.com/moses-smt/giza-pp.git
  cd giza-pp
  make
fi

cd ~/code
mkdir -p mosesdecoder/tools

cp giza-pp/GIZA++-v2/GIZA++ giza-pp/GIZA++-v2/snt2cooc.out \
   giza-pp/mkcls-v2/mkcls mosesdecoder/tools

cd mosesdecoder

cd scripts/training
~/code/mosesdecoder/scripts/training/train-model.perl -external-bin-dir $HOME/code/mosesdecoder/tools
# ERROR: use --corpus to specify corpus at /home/philip/code/mosesdecoder/scripts/training/train-model.perl line 499.

