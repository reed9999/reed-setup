#!/bin/bash
# Install Node.js
# Now attempting to REFACTOR out commonalities.
# It turns out that node is already installed so for now I will leave this unfinished.
# It's probably easiest to get wget to output directly to ~/Downloads though.

export REED_APP_NAME=node
export REED_APP_GLOB=node-*.tar.xz
export REED_APP_URL=https://nodejs.org/dist/v10.13.0/node-v10.13.0-linux-x64.tar.xz

pushd ~/reed-setup
bash/if-exists.sh

#These two arguments aren't working.
echo "APP INSTALLED $REED_APP_INSTALLED"
echo "NEEDS_DOWNLOAD $REED_NEEDS_DOWNLOAD"

echo "Short circuiting nodejs right now."

if [ false ]; then

        if [ $REED_NEEDS_DOWNLOAD ] ; then 
          wget -O ~/Downloads/tusk-0.8.0-linux-amd.deb \
                https://github.com/klauscfhq/tusk/releases/download/v0.8.0/tusk-0.8.0-linux-amd64.deb
        fi

        if [ ! $REED_APP_INSTALLED ] ; then 
          sudo dpkg -i ~/Downloads/$REED_APP_GLOB
          sudo apt install -f
        fi
fi

sudo apt install npm

# unset REED_APP_NAME
# unset REED_APP_GLOB
# unset REED_APP_URL
# unset REED_APP_INSTALLED
popd
