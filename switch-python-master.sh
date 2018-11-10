#Following should only run if we're starting for the first time. 

echo "Now I will need to sudo so we can start the terminal under Python 3.5"
sudo ~/uu/handy-tips/switch-python-ver.sh 3.5
gnome-terminal
echo "...and then revert to Python 3.6"
sudo ~/uu/handy-tips/switch-python-ver.sh 3.6
