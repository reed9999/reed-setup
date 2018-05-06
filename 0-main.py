#!/usr/bin/python3
# Top-level driver for my grand plan of automating Ubuntu setup "like I like 
# it.
#
# My major rethink just now has me convinced: I should commit to Python at the
# top level and only use bash scripts where convenient for tiny tasks.
# Although improving my bash is a worthy goal, improving my Python is a higher
# priority!
########################################
import os
import subprocess
from subprocess import call


# #os.chdir(os.path.expanduser('~/u'))
#
# proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
# proc2 = call ("head -20".split(), stdin=proc1.stdout)
#
# print "TODO! I need to do a better job with that redirect."

MAIN_SCRIPTS = [
    'bash/1-basic-setup.sh',
    'bash/2-build-code.sh',
    '3-specialty.py',
    'bash/4-hacking.sh',
    'bash/5-translation.sh',
    'bash/6-wine.sh',
    'bash/90-links.sh',
],

class ReedSetupApp:
    def get_intentions_from_user(self):
        print("Eventually ask the user")
        self._scripts_to_run = MAIN_SCRIPTS

    def install_scripts(self):
        self._procs = [call(script) for script in self._scripts_to_run]

    @classmethod
    def go(cls):
        app = cls()
        app.get_intentions_from_user()
        app.install_scripts()

def main():
    #ReedSetupApp.go()
    call('bash/1-basic-setup.sh', shell=True)

if __name__ == '__main__':
    main()
