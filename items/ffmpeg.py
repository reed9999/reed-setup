#!/usr/bin/python3
# I forget why I wanted to run ffmpeg or what this is even doing. It had 
# something to do with the voice recognition project I was hacking around 
# with. It will fail now and that's OK.
########################################

import os
import subprocess
from subprocess import call
import yaml



proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
proc2 = call ("head -20".split(), stdin=proc1.stdout)
print ("TODO! I need to do art better job with that redirect.")

