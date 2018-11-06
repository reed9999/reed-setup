################################################################################
# MOSES DECODER SETUP
#http://www.statmt.org/moses/?n=Development.GetStarted
#http://www.statmt.org/moses/?n=Moses.CodeGuide
################################################################################

cd ~/code/mosesdecoder/

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
if [ "$1" == "--all" ] 
then
  echo "--all was passed so I will install all."
  sudo apt-get install build-essential git-core pkg-config automake libtool wget zlib1g-dev python-dev libbz2-dev
  sudo apt-get install libsoap-lite-perl
  make -f contrib/Makefiles/install-dependencies.gmake
  ./compile.sh

  ./bjam -j4 --with-boost=opt
fi

attempt_regression_tests () {
  git submodule init
  git submodule update

  REGTESTS_SEEM_BROKEN=TRUE

  if [ $REGTESTS_SEEM_BROKEN != TRUE ] && [ `./run-regtests.sh` ] 
  then
    #see link below.
    echo "Did an error occur on run-regtests.sh?"
    git show-ref
    git checkout -t -b regtest origin/regtest
    #but still broken.
  fi

  #See coderwall link at bottom for more tshoot ideas.

}


REGTESTS_SEEM_BROKENGLOB=TRUE
if [ $REGTESTS_SEEM_BROKENGLOB != TRUE ] && [ `./run-regtests.sh` ] 
then
  echo $REGTESTS_SEEM_BROKENGLOB
  echo "You don't understand how to do if/then."
fi

#see Development.GetStarted link above

echo "Well, git submodule regtest never seems to install."
echo "So, I can't figure out if the regression tests ever were installed or \
  if non-developers are supposed to run them but never mind... "
echo "Proceed as though regression tests passed, whether or not they were found."

cd ~/code/mosesdecoder/
if [ "$1" == "--all" ] 
then
  wget http://www.statmt.org/moses/download/sample-models.tgz
  tar xzf sample-models.tgz
fi

cd sample-models

cd ~/code/mosesdecoder/sample-models
~/code/mosesdecoder/bin/moses -f phrase-model/moses.ini < phrase-model/in > out


# Other helpful links
# https://coderwall.com/p/zcozuq/git-error-pathspec-develop-did-not-match-any-file-s-known-to-git
