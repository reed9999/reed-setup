#This shell script represents all the "initial setup" needed to get my new Ubuntu 16
# outfitted with everything I need for productive work.
# It's "basic" in the sense of basic to my needs.

  #---------------
  # LEARNING bash
  # Clearly I still have a lot to learn. For now, to avoid breaking code, I'll 
  # comment that stuff with #bash#
  #---------------
clone_dissertation_repos()
{
  cd ~/Documents
  git config credential.helper store
  git clone https://github.com/reed9999/dissertation
  git clone https://github.com/reed9999/transcriptions

  ln -s ~/Documents/dissertation/ ~/diss
  ln -s ~/Documents/transcriptions/ ~/trxn

}

install_and_configure_vim()
{
	#TODO - find the .vimrc and .viminfo files and copy them to right place
	pwd
}

################
# INSTALLATIONS
################

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  clone_dissertation_repos
  install_and_configure_vim
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
