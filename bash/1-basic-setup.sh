#!/usr/bin/env bash
################################################################################
#This shell script is the main one that eventually should kick off all the 
# "initial setup" needed to get my a new Ubuntu 16 outfitted with everything I 
# need or want for productive work.
#
# At present this idea is split among files 1 through 5, and as a first stage 
# I'd like to select whether to run one or all of those.
# See notes at end.
################################################################################

THIS_DIR_TO_LINK=~/setup-bash/
MAIN_DIR=~/setup
CONFIG_FILES_DIR=$MAIN_DIR/CONFIG-FILES/

symlink_cwd_for_convenience()
{
  echo "Current :`pwd`"
  test $THIS_DIR_TO_LINK ||  ln -s `pwd` $THIS_DIR_TO_LINK
}

clone_dissertation_repos()
{
  cd ~/Documents
  DIR_TO_CLONE=dissertation
  test $DIR_TO_CLONE || git clone https://github.com/reed9999/$DIR_TO_CLONE
  test ~/diss || ln -s ~/Documents/dissertation/ ~/diss

  DIR_TO_CLONE=transcriptions
  test $DIR_TO_CLONE || git clone https://github.com/reed9999/$DIR_TO_CLONE
  test ~/trxn || ln -s ~/Documents/transcriptions/ ~/trxn
}

install_and_configure_vim()
{
  echo "Copying my standard config files."
	cp --no-clobber ~/.vimrc ~/.vimrc-backup
	cp --no-clobber ~/.viminfo ~/.viminfo-backup
	cp --no-clobber $CONFIG_FILES_DIR/.vim* ~
  if [ `command -v vim` = '' ]
  then
    echo "I should get around to installing vim. TODO."
  else
    echo "vim is already installed."
  fi
}

################
# INSTALLATIONS
################

symlink_cwd_for_convenience
echo "Base: $THIS_DIR_TO_LINK"
cd $THIS_DIR_TO_LINK

clone_dissertation_repos
install_and_configure_vim

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
#But this is crude so repace it with an actual prompt... 
#... then replace the whole thing with Python. ;)

if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  cd $MAIN_DIR
  outfitting/setup.sh $1

else
  echo "Running only the abbreviated setup (stuff I haven't installed yet.)"
fi

################
# ANY OTHER SYMLINKS?
################

#https://askubuntu.com/a/865569
  #---------------
  # LEARNING bash
  # Clearly I still have a lot to learn. For now, to avoid breaking code, I'll 
  # comment that stuff with #bash#
  #---------------
