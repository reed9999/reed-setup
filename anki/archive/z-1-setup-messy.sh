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

# # sudo -H python3.6 -m pip install wheel
#https://www.reddit.com/r/learnpython/comments/5mba64/why_cant_i_pip_this_library_ubuntu/
# # sudo -H apt install python3.6-dev
sudo python3.6 -m pip install pyaudio
sudo python3.6 -m pip install decorator

#This fails but I'm not going to worry too much about it. 
sudo python3.6 -m pip install apt_pkg

## See also BAD COPY ATTEMPT below 

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

~/code/anki/tools/build_ui.sh
./runanki

#If you wish to install it system wide, type 'sudo make install'
#Uninstall with 'sudo make uninstall'



## BAD COPY ATTEMPT from above
################################################################################
# This was probably a not-great idea to copy the 2.7 pyaudio to 3.6 .
# In any event, I both put 3.5 here and had a nonexistent source file, so I'm really not
# sure what in fact I did.


#sudo cp /usr/lib/python2.7/dist-packages/pyaudio.* /usr/local/lib/python3.5/dist-packages/

#echo 'WARNING! I copied pyaudio from the 2.7 directory, which might not be OK.-PJR' > /home/philip/Dropbox/ubuntu/anki/WARNING-pyaudio.txt
#sudo cp WARN* /usr/local/lib/python3.5/dist-packages/
################################################################################

################################################################################
#CRUDE TROUBLESHOOTING
################################################################################

# # sudo python2.7 -m pip install apt_pkg
# # sudo python3.5 -m pip install apt_pkg
# # echo "***\n\n\nNow begin pyaudio 2.7\n\n\n***"
# # sudo python2.7 -m pip install pyaudio
# # echo "***\n\n\n2.7 complete. Now begin pyaudio 3.5\n\n\n***"
# # sudo python3.5 -m pip install pyaudio
# # echo "***\n\n\n3.5 complete. Now begin pyaudio 3.6\n\n\n***"
