#!/usr/bin/python
########################################
# TERTIARY SETUP FILE
# PYTHON VERSION
# For specialty applications that are still good to keep a record of.
# My attempt to get around the stuff I hate about shell scripting and
# learn more useful (?) Python skills.
#
# However learning bash is important too. For now, keep both around but
# where .py exists, treat it as canonical.
########################################

import os
import subprocess
from subprocess import call
os.chdir(os.path.expanduser('~/u'))

for app in [
  'vscode',
  'ffmpeg',
  'golly', 
  'docky',
]:
  call(["sudo", "apt", "install", app])

#call ("ffmpeg --help > output/temp3.txt".split())
proc1 = call ("ffmpeg --help".split())
proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
proc2 = call ("head -20".split(), stdin=proc1.stdout)

print "TODO! I need to do a better job with that redirect."

#handy tip:
#os.chdir(os.path.join(os.path.abspath(os.path.curdir),u'subfolder'))


"""
cd ~/u
sudo apt install ffmpeg
cat output/temp3.txt


echo "Random stuff I like to play with, and organizational helps."
sudo apt install golly
sudo apt install docky

#Eventually add some git UI -- or maybe do this in hacking? elsewhere?
#https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools#Graphical_Interfaces_-_FLOSS



#Hmm, install Compiz Config Settings Manager 
# but this doesn't work
#sudo apt-get install ccsm


echo "Do you want me to delete the temp3 output? [ENTER or y]"
read x
echo (( $x = "y" ))
if [ $x = "" || $x = "y" ]
then
  rm output/temp3.txt
fi
"""
