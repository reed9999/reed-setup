#!/bin/bash
################
# Set up vim and copy relevant files.
################

copy_vim_config()
{

  cp ~/.vimrc ~/.backup.vimrc
  cp ~/.viminfo ~/.backup.viminfo
  cp ~/reed-setup/outfitting/config-files/.vimrc ~/.vimrc
  cp ~/reed-setup/outfitting/config-files/.viminfo ~/.viminfo
}

if [ "$1" == "--all" ]; then
  sudo apt install vim
else
  echo "I believe everything in outfitting/setup.sh has been installed, "
  echo "  so I have nothing to install from outfitting/setup.sh."
fi

sudo apt install vim
copy_vim_config


## This was in 1-basic-setup.sh and seems to be redundant.
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