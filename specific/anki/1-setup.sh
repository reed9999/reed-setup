########################################
# ANKI
# Cleaned up version.
# I *think* this documents all the important stuff that I did that would work.
# But see z-1-setup-messy.sh for a more stream of consciousness version.
########################################

cd ~/code/anki/
sudo apt install python3-pip
pip3 install pyqt5
pip3 install --upgrade pip

sudo apt install python-pyaudio	#may not be the issue here.

sudo -H python3.6 -m pip install wheel
sudo -H apt install python3.6-dev
sudo python3.6 -m pip install pyaudio
sudo python3.6 -m pip install decorator

sudo apt install libjack-jackd2-dev portaudio19-dev



pip3 install -r requirements.txt
sudo python3.6 -m pip install markdown

~/code/anki/tools/build_ui.sh
./runanki

