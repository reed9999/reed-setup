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
]

class ReedSetupApp:
    def get_intentions_from_user(self):
        print("Eventually ask the user")
        self._scripts_to_run = MAIN_SCRIPTS

    def install_scripts(self):
        for script in self._scripts_to_run:
            print("I will now run {}".format(script))
            proc = call(script, shell=True)

    @classmethod
    def go(cls):
        app = cls()
        app.get_intentions_from_user()
        app.install_scripts()

def main():
    ReedSetupApp.go()

if __name__ == '__main__':
    main()


# Things that still go wrong

# The directory '/home/philip/.cache/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
# The directory '/home/philip/.cache/pip' or its parent directory is not owned by the current user and caching wheels has been disabled. check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
# Requirement already satisfied: meson in /usr/local/lib/python3.5/dist-packages
# You are using pip version 9.0.1, however version 10.0.1 is available.
# You should consider upgrading via the 'pip install --upgrade pip' command.
# bash/4-hacking.sh: 32: bash/4-hacking.sh: /home/philip/u/hacking/libgweather.sh: not found
# bash/4-hacking.sh: 35: bash/4-hacking.sh: Syntax error: "(" unexpected
# bash/5-translation.sh: 9: bash/5-translation.sh: typeset: not found
# bash/5-translation.sh: 26: bash/5-translation.sh: Syntax error: "(" unexpected (expecting "fi")
# bash/6-wine.sh: 36: [: unexpected operator
# Running only the abbreviated setup (stuff I haven't installed yet.)
# ln: failed to create symbolic link '/home/philip/travel/travel': File exists
# ln: failed to create symbolic link '/home/philip/nonrev/nonrev': File exists
# Eventually ask the user
# I will now run bash/1-basic-setup.sh
# I will now run bash/2-build-code.sh
# I will now run 3-specialty.py
