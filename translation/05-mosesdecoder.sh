
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

  #As per:
  #http://www.statmt.org/moses/?n=Development.GetStarted
  ./bjam -j4 --with-boost=opt
  #Note that you'll still need a word aligner; this is not built automatically
fi

if [ ./run-regtests.sh ] 
then
  #see link below.
  echo "Did an error occur on run-regtests.sh?"
  git show-ref
  git checkout -t -b regtest origin/regtest
  #but still broken.
fi

# https://coderwall.com/p/zcozuq/git-error-pathspec-develop-did-not-match-any-file-s-known-to-git



###e258caca31a0dea3e4403fc13303bba95c832ea1 refs/tags/mmt-mvp-v0.12.0
###366411ae8c96b412cf890fc7486208d43bbdb8af refs/tags/mmt-mvp-v0.12.1
###190ee484cc7fc08d9c4db31e96b8be348967fb25 refs/tags/mmt-mvp-v0.2.1
###4d1d2116bb2ff716896b6510e04804ed1a290465 refs/tags/mmt-mvp-v0.9.0
###b735c3ecff1ced92bf64b3fc01382a1166392ca8 refs/tags/mtm_before_cube_pruning
###11398e13790cbb48fb4e07da68960622dd7fb416 refs/tags/pre-MMT
###6c0951e7aa1b5134ceb816a0f5136f991f216c5d refs/tags/ranked-sampling-v0.1.0
###fatal: Cannot update paths and switch to branch 'regtest' at the same time.
###Did you intend to checkout 'origin/regtest' which can not be resolved as commit?

