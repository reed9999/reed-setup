#!/bin/bash
# Install Visual Studio Code and configure it as desired.
# DRY with tusk.sh -- would be good to REFACTOR out commonalities.

if which code ; then 
  echo "VS Code (code) appears to be installed."; 
else
  VSCODE_GLOB=vscode-current.deb

  if [ ! -e $VSCODE_GLOB ] && [ ! -e ~/Downloads/$VSCODE_GLOB ]; then 
    wget -O vscode-current.deb \
            https://go.microsoft.com/fwlink/?LinkID=760868
  else
    echo "VS Code install .deb file already exists"
  fi;
  mv $VSCODE_GLOB ~/Downloads/
  sudo dpkg -i ~/Downloads/$VSCODE_GLOB 
  sudo apt install -f
fi;

# Be conservative for now. Files I know I want to copy.
cp  ~/.config/Code/User/*.json /tmp
cp CONFIG-FILES/Code/User/*.json ~/.config/Code/User

# Extensions to add. Need to research if this can be done programmatically.
# Python
# pylint
# Ruby
