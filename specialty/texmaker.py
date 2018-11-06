#!/usr/bin/python3

import os
import subprocess
from subprocess import call
os.chdir(os.path.expanduser('~/u'))

#Quite plausibly this python script is complete overkill. 
#Perhaps instead I should have a bunch of tiny shell scripts that I call 
# with Python, who knows?

print("Now installing texmaker")

#This should be refactored out since it's straight from ../3-specialty.py
for app in [
  'texmaker',
]:
  call(["sudo", "apt", "install", app])

