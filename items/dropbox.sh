#!/bin/bash
# Script to install and configure the Dropbox daemon

pushd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &
popd