################################################################################
#This shell script should represent all the "initial setup" needed to get my 
# new Ubuntu 16 outfitted with everything I need for productive work.
# See notes at end.
################################################################################

BASE_DIR=~/u

symlink_cwd_for_convenience()
{
  echo "Current :`pwd`"
  ln -s `pwd` $BASE_DIR
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
	cp --no-clobber CONFIG-FILES/.vim* ~
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
echo "Base: $BASE_DIR"
cd $BASE_DIR
clone_dissertation_repos
install_and_configure_vim

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
#But this is crude so repace it with an actual prompt... 
#... then replace the whole thing with Python. ;)

if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  cd ~/u
  outfitting/setup.sh $1
else
  echo "Running only the abbreviated setup (stuff I haven't installed yet.)"
fi



################
# ANY OTHER SYMLINKS?
################



# iConference 2018 documents. No longer relevant (though I might work on my
# poster)
## cd ~/Documents
## git clone https://github.com/reed9999/dissertation iconf2018
## cd iconf2018
## git checkout iconf2018

#https://askubuntu.com/a/865569
  #---------------
  # LEARNING bash
  # Clearly I still have a lot to learn. For now, to avoid breaking code, I'll 
  # comment that stuff with #bash#
  #---------------



#The line between essential and nonessential is blurry, but the latter should
# get bumped to later files.
