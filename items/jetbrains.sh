#!/bin/bash
# Script to install and configure the Jetbrains Toolbox
# Truthfully I may just end up wanting to install the individual pieces 
# programmatically anyway -- don't know if Toolbox has a CLI -- but it's still 
# good to see the canonical places they should go. 

WHERE_TO_INSTALL=/opt
if [ -e $WHERE_TO_INSTALL/jetbrains-toolbox*/jetbrains-toolbox ] ; then   #actually I don't know the command yet, just guessing.
  echo "Jetbrains Toolbox appears to be installed."
  TOOLBOX_INSTALLED=true
fi;


# It's a weakness that the URL is HARDCODED but I figure it will autoupdate
# itself once it's installed.
# We could use the INFO_URL to find the latest version.
INFO_URL=https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release

URL=https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz
CHECKSUM_URL=https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz.sha256

JETBRAINS_GLOB=jetbrains-toolbox*.gz
NEEDS_DOWNLOAD=true
if [ -e ~/Downloads/$JETBRAINS_GLOB ] ; then 
  echo "Jetbrains Toolbox downloaded .gz already exists and is in the right place."
  NEEDS_DOWNLOAD=false
fi;
if [ -e $JETBRAINS_GLOB ] ; then 
  echo "Jetbrains Toolbox downloaded .gz already exists; move it to Downloads."
  mv $JETBRAINS_GLOB ~/Downloads
  mv jetbrains*.sha256 ~/Downloads
  NEEDS_DOWNLOAD=false
fi 
if [ "$NEEDS_DOWNLOAD" = true ] ; then 
  echo "Will now download the toolbox gz file and checksum."
  wget $URL
  wget $CHECKSUM_URL
else
  echo "No need to download the toolbox gz file."
fi;

SHA256=.sha256

pushd ~/Downloads
result=`sha256sum -c $JETBRAINS_GLOB$SHA256|grep -c OK`
if [ $result != 1 ] ; then
  echo "Number of OKs was $result" 
  echo "Checksum did not check out! Aborting Jetbrains Toolbox install"
  exit 999;
fi;

if [ TOOLBOX_INSTALLED ] ; then
  echo "Toolbox is already installed";
else
  sudo chown philip /opt
  tar -xvf $JETBRAINS_GLOB --directory /opt
fi 

/opt/jetbrains*/jetbrains-toolbox
popd

