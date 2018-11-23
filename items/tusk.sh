#!/bin/bash
# Install Tusk and configure it as desired.
# DRY with vscode.sh, jetbrains.sh -- would be good to REFACTOR out commonalities.

# It's probably easiest to get wget to output directly to ~/Downloads though.

#if [ -e  `which tusk-app` ] 
if [ `which tusk-app` ] ; then 
  echo "tusk appears to be installed."; 
  TUSK_INSTALLED=true
  NEEDS_DOWNLOAD=false
fi;

TUSK_GLOB=tusk-*.deb
if [ -e ~/Downloads/$TUSK_GLOB ] ; then 
  echo "Tusk .deb file already exists and is in the right place."
  NEEDS_DOWNLOAD=false
fi;
if [ -e $TUSK_GLOB ] ; then 
  echo "Tusk .deb file already exists; move it to Downloads."
  mv $TUSK_GLOB ~/Downloads
  NEEDS_DOWNLOAD=false
fi 

if [ $NEEDS_DOWNLOAD ] ; then 
  wget -O ~/Downloads/tusk-0.8.0-linux-amd.deb \
        https://github.com/klauscfhq/tusk/releases/download/v0.8.0/tusk-0.8.0-linux-amd64.deb
fi

if [ ! $TUSK_INSTALLED ] ; then 
  sudo dpkg -i ~/Downloads/$TUSK_GLOB 
  sudo apt install -f
fi;
