#!/usr/bin/python3
#Why did I want to do this in Python again? IIRC just because I was tired of porting Windows batch files to shell
# scripts. So perhaps a thin Python wrapper
import os
from subprocess import call
from shutil import copy2

os.chdir(os.path.expanduser('~/diss'))

copy2('bibliography.bib', '__bibliography.backup')

#lazy repetitive code
commands = [
  "cat src-bib/zotero1.bib > bibliography.bib",
  "cat src-bib/zotero2.bib >> bibliography.bib",
  "cat src-bib/local.bib >> bibliography.bib",
]
for command in commands:
    call (command.split())
    print ("I called {}".format(command))



copy2('bibliography.bib', 'bibliography.temp')
os.unlink('bibliography.bib')
#equivalent to: sed -f scripts/pre.sed 0<bibliography.temp 1>bibliography.bib



command = "sed -f scripts/pre.sed"
infile = 'bibliography.temp'
outfile =  'bibliography.bib'
with open(infile, 'r') as file_input:
  with open(outfile, 'w') as file_output:
    proc = call (command.split(), stdin=file_input, stdout=file_output)

#FEATURE: Prompt user before deleting the temp file?
#del zotero.temp
