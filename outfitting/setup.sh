################
# OUTFITTING my Ubuntu
# This works hand-in-glove with 1-basic-setup, but it's now canonical to put 
# non-essential scripts that get a new Ubuntu to my liking in the outfitting
# directory.
################

if [ "$1" == "--all" ]
then
  echo "Nothing changes for now."
  #Because sudo apt install is fine to rerun
else
  echo "Nothing changes for now."

#  echo "I believe everything in outfitting/setup.sh has been installed, "
#  echo "  so I have nothing to install from outfitting/setup.sh."
fi

sudo apt install redshift
sudo apt install chromium
sudo apt install vlc
sudo apt install bluefish
sudo apt install lynx
