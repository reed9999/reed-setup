#!/usr/bin/python3
# Top-level driver for my grand plan of automating Ubuntu setup "like I like 
# it".
#
# Main design question is whether to have Python drive bash (occasionally) or
# vice versa. I want Python to be top level. Only use bash scripts where 
# convenient for tiny tasks.
########################################
import os
import subprocess
from subprocess import call
import yaml

assert os.getcwd() == os.path.expanduser('~/reed-setup'), \
    "You must change directories to ~/reed-setup to run this."


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


class NotYetWorkingError(RuntimeError):
    """The purpose of this class is to give me something to throw in the 
    common case where I just wanted to get something going so I went ahead and 
    installed manually, leaving not-yet-working code in the scripts. I want to
    see this error every time so it fails every time, reminding me to 
    eventually get the script working!"""
    pass

class ReedSetupApp:
    """The main app class.

    It's probably considered unpythonic to be so stubbornly object-oriented, 
    but I will accept being unpythonic here because I like this OO paradigm.
    """

    def __init__(self):
        self._successes = []
        self._failures = []



    def install_from_script(self, what):
        items_path = os.path.join(
                os.path.expanduser('~'), 'reed-setup', 'items',)
        try:
            cmd = os.path.join(items_path, '{}.py'.format(what))
            rv = call(cmd, shell=True)
            if rv !=0: raise FileNotFoundError(cmd)
        except:
            pass

        #We could have put the following in a try block and used 
        # except Exception as ex    etc. with raise SomeExceptionClass from ex
        cmd = os.path.join(items_path, '{}.sh'.format(what))
        rv = call(cmd, shell=True)
        return rv

    def install_simple(self, what):
        BASH_SUCCESS = 0
        try:
            return_value = self.install_from_script(what)
            #print ("[{}] OK return value {}".format(what, return_value))
        except:
            cmd = "sudo apt install {}".format(what)
            return_value = call(cmd, shell=True)
        print ("For item {} rv is {}".format(what, return_value))
        if return_value in [BASH_SUCCESS, True]:
            self._successes.append(what)
        else:
            self._failures.append(what)


    def install(self, what):
        assert len(what) > 0, "Whatever we install, it must have len > 0"
        if type(what) == str:
            self.install_simple(what)
        else:
            for subitem in what:
                self.install(subitem)



    @classmethod
    def go(cls):
        app = cls()
        with open(DEFAULT_ITEMSFILE, 'r') as f:
            list_of_what = yaml.load(f)
            app.install(list_of_what)
        print ("Successes: {}".format(app._successes))
        print ("Failures: {}".format(app._failures))

        #cls.old_style_go()

    # OLD APPROACH - being phased out
    def get_intentions_from_user(self):
        print("Eventually ask the user")
        self._scripts_to_run = MAIN_SCRIPTS
    
    def install_scripts(self):
        for script in self._scripts_to_run:
            print("I will now run {}".format(script))
            proc = call(script, shell=True)

    @classmethod
    def old_style_go(cls):
        app = cls()
        app.get_intentions_from_user()
        app.install_scripts()

def main():
    ReedSetupApp.go()

if __name__ == '__main__':
    main()

# Status of success/failure (eventually to be written to a file for caching)
# Successes: ['git', 'vim', 'redshift', 'vlc', 'bluefish', 'lynx', 'p7zip-full', 'pidgin']
# Successes: ['git', 'vim', 'chromium-browser', 'vlc', 'lynx', 'redshift', 'p7zip-full', 'pidgin']
# Failures: ['vscode', 'jetbrains']




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
