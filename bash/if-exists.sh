#!/bin/bash
# Attempt at a generic framework to identify whether an app is already installed or not.

echo "Now testing existence of $REED_APP_NAME"



if [ `which $REED_APP_NAME` ] ; then 
  echo "$REED_APP_NAME appears to be installed."; 
  export REED_APP_INSTALLED=true
  export REED_APP_INSTALLED='true'
  export REED_NEEDS_DOWNLOAD=false
fi;

# if [ -e ~/Downloads/$REED_APP_GLOB ] ; then 
#   echo "Downloaded file $REED_APP_GLOB already exists and is in the right place."
#   REED_NEEDS_DOWNLOAD=false
# fi;
# 
# if [ -e $TUSK_GLOB ] ; then 
#   echo "Downloaded file $REED_APP_GLOB already exists; move it to Downloads."
#   mv $REED_APP_GLOB ~/Downloads
#   REED_NEEDS_DOWNLOAD=false
# fi 
