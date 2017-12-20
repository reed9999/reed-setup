#See https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get/865569#865569
#Problem is, pip3 and things like that, as well as the anki build, seem to all use python3 
#by default. 
#So let's symlink
which python3
which python3.5
which python3.6
cd /usr/bin
sudo rm python3
sudo ln -s python3.6 python3
python3 --version

