#This shell script represents all the "initial setup" needed to get my new Ubuntu 16
# outfitted with everything I need for productive work.
# It's "basic" in the sense of basic to my needs.

  #---------------
  # LEARNING bash
  # Clearly I still have a lot to learn. For now, to avoid breaking code, I'll 
  # comment that stuff with #bash#
  #---------------
################
# INSTALLATIONS
################

#pass the flag --all as the first param if we don't wish to reinstall old stuff.
#This provides a convenient way for me 'comment' code yet still run it easily.
if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  sudo apt install vlc
  ln -s ~/Documents/dissertation/ ~/zd
  ln -s ~/Documents/transcriptions/ ~/zt
  sudo apt install python-logilab-common
else
  echo "Running only the abbreviated setup (stuff I haven't installed yet.)"
  echo $1
fi

outfitting/setup.sh $1
################
# SYMLINKS
################



#I've already set up dissertation, but set up the iconf branch too.
## cd ~/Documents
## git clone https://github.com/reed9999/dissertation iconf2018
## cd iconf2018
## git checkout iconf2018

#https://askubuntu.com/a/865569
if (FALSE)
then
  sudo add-apt-repository ppa:jonathonf/python-3.6
  sudo apt-get update
  sudo apt-get install python3.6
fi
