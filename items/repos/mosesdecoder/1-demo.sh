################################################################################
# MOSES DECODER DEMO
#http://www.statmt.org/moses/?n=Development.GetStarted
#http://www.statmt.org/moses/?n=Moses.CodeGuide
################################################################################

cd ~/code/mosesdecoder/

if [ "$1" == "--all" ] 
then
  wget http://www.statmt.org/moses/download/sample-models.tgz
  tar xzf sample-models.tgz
fi

cd sample-models

cd ~/code/mosesdecoder/sample-models
~/code/mosesdecoder/bin/moses -f phrase-model/moses.ini < phrase-model/in > out

echo "Now for Philip messing around."
echo "I actually don't know the max value for -v."
~/code/mosesdecoder/bin/moses -f phrase-model/moses.ini -v 5 < phrase-model/in.pjr > pjr.out 2>moses-output.txt

echo "Let's explore these files a little bit."
mkdir -p temp
gunzip ~/code/mosesdecoder/sample-models/lm/europarl.srilm.gz ./temp
grep and ./temp/*
more ~/code/mosesdecoder/sample-models/phrase-model/moses.ini
