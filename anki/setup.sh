########################################
# ANKI
########################################
#Anki requires:

#- Python 3.6+
#- Qt 5.9+ and a PyQT that supports it
#- mplayer
#- lame

cd ~/code/anki/
#https://docs.bigchaindb.com/projects/server/en/latest/appendices/install-latest-pip.html
# # sudo apt install python3-pip
# # pip3 install pyqt5
# # # # pip3 install --upgrade pip

# ATTENTION!
# Following turned out to be necessary for anki requirements but weren't automatic.
# https://stackoverflow.com/a/5922091
# # # # sudo apt install python-pyaudio	#was already installed, not the issue.
#For whatever reason, though, pyaudio is not installed in /usr/local/lib/python3.5/
#Now we need it for 3.6

python3.6 -m pip install pyaudio
python3.6 -m pip install apt_pkg
python3.6 -m pip install decorator

################################################################################
# This was probably a not-great idea to copy the 2.7 pyaudio to 3.6 (although
# I put 3.5 here.)
#sudo cp /usr/lib/python2.7/dist-packages/pyaudio.* /usr/local/lib/python3.5/dist-packages/
#Also apparently need to do the same with decorator.
#echo 'WARNING! I copied pyaudio from the 2.7 directory, which might not be OK.-PJR' > /home/philip/Dropbox/ubuntu/anki/WARNING-pyaudio.txt
#sudo cp WARN* /usr/local/lib/python3.5/dist-packages/
################################################################################

# https://stackoverflow.com/a/21801632
# # # # sudo apt install libjack-jackd2-dev portaudio19-dev


#Was failing on pyaudio until installs above. See ~/Dropbox/ubuntu/basic2-output01.txt
#Then, for success, see ~/Dropbox/ubuntu/basic2-output02.txt
#However, all of that was with Python 3.5, which doesn't work with anki
#So I did my symlinks to get python3 to mean 3.6
#Then similar failures on this.

# # # # pip3 install -r requirements.txt
#See https://github.com/SlapBot/stephanie-va/issues/8
# for ideas on how to fix.
./runanki3.6		#Exception: Anki requires Python 3.6+

#If you wish to install it system wide, type 'sudo make install'
#Uninstall with 'sudo make uninstall'



