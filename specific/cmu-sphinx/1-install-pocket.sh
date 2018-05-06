########################################
# 001 POCKETSPHINX INSTALL
# also includes SPHINXBASE
# Now works
########################################

#https://cmusphinx.github.io/wiki/download/
sudo apt-get install pocketsphinx

#But also needs sphinxbase. How do we get that?
#https://bakerstreetsystems.com/blog/post/setting-cmu-sphinx-pocketsphinx-ubuntu-1404

sudo apt-get install git
sudo apt-get install automake
sudo apt-get install libtool
sudo apt-get install bison
sudo apt-get install python-dev
sudo apt-get install swig
sudo apt-get install make
sudo apt-get install pkg-config

#PJR
cd ~/code
git clone https://github.com/cmusphinx/sphinxbase.git
cd sphinxbase
./autogen.sh
make
sudo make install
cd ..
git clone git://github.com/cmusphinx/pocketsphinx.git
cd pocketsphinx
./autogen.sh
make
sudo make install
cd ..


###
#https://askubuntu.com/questions/641005/what-is-a-good-speech-recognition-software/641034#641034
echo "Is there anything else left?"
sudo apt-get install pocketsphinx*

#What if we try running right now?
./099-run.sh
# right now
#INFO: cmn.c(143): mean[0]= 12.00, mean[1..12]= 0.0
#ERROR: "acmod.c", line 80: Acoustic model definition is not specified either with -mdef option or with -hmm
