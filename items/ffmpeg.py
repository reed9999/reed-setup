#!/usr/bin/python3
# I forget why I wanted to run ffmpeg or what this is even doing. It had 
# something to do with the voice recognition project I was hacking around 
# with. It will fail now and that's OK.
########################################

import os
import subprocess
from subprocess import call
import yaml

#See comment in 0-main.py about NotYetWorkingError.
raise NotImplementedError("ffmpeg script Still under construction")

print("""Original bash code:

sudo apt install ffmpeg
ffmpeg --help > output/temp3.txt
cat output/temp3.txt
""")
proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
proc2 = call ("head -20".split(), stdin=proc1.stdout)
# TODO - I need to do a better job with that redirect