#!/usr/bin/python3
# Top-level driver for my grand plan of automating Ubuntu setup "like I like 
# it. 
# 
########################################
import os
import subprocess
from subprocess import call

#os.chdir(os.path.expanduser('~/u'))

proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
proc2 = call ("head -20".split(), stdin=proc1.stdout)

print "TODO! I need to do a better job with that redirect."
