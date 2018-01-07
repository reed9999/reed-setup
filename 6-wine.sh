########################################
#This shell script represents all the "initial setup" needed to get my new 
# Ubuntu 16
# outfitted with everything I need for productive work.

log_disk_space_wine()
{
  FN=diskspace-before-6-wine.txt
  date '+%Y/%m/%d_%H:%M:%S' >> $FN
  df -vH >> $FN
}

#I don't like this because it doesn't tell me what to do for 64 bit.
wine_32bit()
{

  git clone https://github.com/wine-mirror/wine
  cd wine
  ./configure
  make
  ./wine notepad
}
wine_from_ppa()
{
  # "Google for Ubuntu handbook  install wine 2.0 ubuntu"
  sudo add-apt-repository ppa:/wine/wine-builds
  sudo apt-get update
  sudo apt-get install --install-recommends wine-staging

}

################
# INSTALLATIONS
################

if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
  cd ~/code
  sudo dpkg --add-architecture i386
  wine_from_ppa
else
  echo "Running only the abbreviated setup (stuff I haven't installed yet.)"
fi
