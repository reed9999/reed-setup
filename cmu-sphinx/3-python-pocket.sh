#!/usr/bin/env bash
########################################
# 3 POCKETSPHINX PYTHON BINDINGS
########################################

cd ~/code
git clone https://github.com/cmusphinx/pocketsphinx-python
cd pocketsphinx-python
./autogen.sh
make
sudo make install