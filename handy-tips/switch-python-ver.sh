#See https://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get/865569#865569
#Problem is, pip3 and things like that, as well as the anki build, seem to all use python3 
#by default. 
#On the other hand, running the script only from 3.5 to 3.6 leaves Ubuntu in a 
# bad state where the Terminal won't start at startup. 

which python3
which python3.5
which python3.6

cd /usr/bin
sudo cp python3 ~/Dropbox/ubuntu/handy-tips/symlink-backup-python3
sudo rm python3

# tgt = (( $1 || "3.6" ))
tgt=$1
if [ "$1" == "" ]
then 
  tgt="3.6"
fi
echo "Now switching python3 link to point to python$tgt"
sudo ln -s python$tgt python3
python3 --version

