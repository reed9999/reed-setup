########################################
# archive-3 INSTALL - DIFFERENT APPROACH
# I don't know whether I actually implemented this.
# However, it could contain the "magic" that got pocketsphinx_continuous to suddenly work.


#https://github.com/cmusphinx/pocketsphinx/issues/57
# Hope this link works. If not, see at bottom.
# # wget 'https://downloads.sourceforge.net/project/cmusphinx/sphinx4/5prealpha/sphinx4-5prealpha-src.zip
mkdir temp_code
unzip sphinx4-5prealpha-src.zip temp_code
cd temp_code/sphinxbase
./autogen.sh
make
sudo make install
cd ..
#git clone git://github.com/cmusphinx/pocketsphinx.git
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


#full URL just in case
#wget 'https://downloads.sourceforge.net/project/cmusphinx/sphinx4/5prealpha/sphinx4-5prealpha-src.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2F&ts=1513614862&use_mirror=iweb'
#mv "sphinx4-5prealpha-src.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2F&ts=1513614862&use_mirror=iweb" sphinx4-5prealpha-src.zip
