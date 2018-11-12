#!/bin/bash
# Script to install and configure the BFG Repository Cleaner
# See ....

WHERE_TO_INSTALL=~/programs
if [ -e $WHERE_TO_INSTALL/bfg*.jar ] ; then
  echo "BFG appears to already be downloaded and installed."
else
        mkdir -p $WHERE_TO_INSTALL
        wget http://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar\
         -O $WHERE_TO_INSTALL/bfg-1.13.0.jar
fi;

#This probably doesn't yet do anything because aliases don't appear to persist
alias bfg="java -jar $WHERE_TO_INSTALL/bfg-1.13.0.jar"

