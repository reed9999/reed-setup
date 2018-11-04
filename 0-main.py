#!/usr/bin/python3
# Top-level driver for my grand plan of automating Ubuntu setup "like I like 
# it.
#
# Main design question is whether to have Python drive bash (occasionally) or
# vice versa. I want Python to be top level. Only use bash scripts where 
# convenient for tiny tasks.
########################################
import os
import subprocess
from subprocess import call
import yaml

# #os.chdir(os.path.expanduser('~/u'))
#
# proc1 = subprocess.Popen ("ffmpeg --help".split(), stdout=subprocess.PIPE)
# proc2 = call ("head -20".split(), stdin=proc1.stdout)
#
# print "TODO! I need to do art better job with that redirect."

# Still a bit too HARDCODED
DEFAULT_ITEMSFILE = os.path.join(
    os.path.expanduser('~'),
    'reed-setup',
    'WHAT_TO_INSTALL.yaml',
)
MAIN_SCRIPTS = [
#    'bash/1-basic-setup.sh',
    'bash/2-build-code.sh',
    '3-specialty.py',
    'bash/4-hacking.sh',
    'bash/5-translation.sh',
    'bash/6-wine.sh',
    'bash/90-links.sh',
]


class ReedSetupApp:
    @classmethod
    def get_intentions_from_user(cls):
        print("Eventually ask the user")
        cls._scripts_to_run = MAIN_SCRIPTS
    
    @classmethod
    def install_scripts(cls):
        for script in cls._scripts_to_run:
            print("I will now run {}".format(script))
            proc = call(script, shell=True)

    @classmethod
    def old_style_go(cls):
        app = cls()
        app.get_intentions_from_user()
        app.install_scripts()

    @classmethod
    def install_simple(cls, what):
        print(what)

    @classmethod
    def install(cls, what):
        assert len(what) > 0, "Whatever we install, it must be something of len > 0"
        if type(what) == str:
            cls.install_simple(what)
        else:
            for subitem in what:
                cls.install(subitem)



    @classmethod
    def go(cls):
        with open(DEFAULT_ITEMSFILE, 'r') as f:
            what = yaml.load(f)
            for item in what:
                cls.install(item)
        #cls.old_style_go()

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
