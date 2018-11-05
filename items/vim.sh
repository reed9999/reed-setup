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

if [ "$1" == "--all" ]
then
  sudo apt install vim

else
  echo "I believe everything in outfitting/setup.sh has been installed, "
  echo "  so I have nothing to install from outfitting/setup.sh."
fi

sudo apt install vim
copy_vim_config
