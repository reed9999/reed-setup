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
import sys
from subprocess import call
import yaml

assert os.getcwd() == os.path.expanduser('~/reed-setup'), \
    "You must change directories to ~/reed-setup to run this."
#handy tip:
#os.chdir(os.path.join(os.path.abspath(os.path.curdir),u'subfolder'))


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

# I don't feel like renaming 0-main.py at this point (maybe later) for 
# downstream Python imports. Declaring as global doesn't work, so this feature
# isn't really working.

class NotYetWorkingError(NotImplementedError):
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
        #self.load_cached_successes()

    def load_cached_successes(self):
        raise NotYetWorkingError('working on this')


    def install_from_script(self, what):
        items_path = os.path.join(
                os.path.expanduser('~'), 'reed-setup', 'items',)
        py_cmd = os.path.join(items_path, '{}.py'.format(what))
        sh_cmd = os.path.join(items_path, '{}.sh'.format(what))
        
        if os.path.exists(py_cmd):
            rv = call(py_cmd, shell=True)
        elif os.path.exists(sh_cmd):
            rv = call(sh_cmd, shell=True)
        else :
            print ("No scripts present for {}; fall back to default behavior".format(what))
            rv = False
        return rv

    def install_simple(self, what):
        BASH_SUCCESS = 0
        print("\n=== INSTALLING {} ===".format(what))
        return_value = self.install_from_script(what)
        if return_value is False: 
            cmd = "sudo apt install -yq {}".format(what)
            return_value = call(cmd, shell=True)
            print ("For item {} rv is {}".format(what, return_value))

        if return_value == BASH_SUCCESS:
            self._successes.append(what)
        else:
            self._failures.append(what)
        return return_value


    def install(self, what):
        assert len(what) > 0, "Whatever we install, it must have len > 0"
        if type(what) == str:
            self.install_simple(what)
        else:
            for subitem in what:
                self.install(subitem)


    def handle_successes(self):
       print ("Successes: {}".format(self._successes))

    def handle_failures(self):
        print ("Failures: {}".format(self._failures))

    @classmethod
    def go(cls, what=None):
        app = cls()
        if what is None: 
            with open(DEFAULT_ITEMSFILE, 'r') as f:
                list_of_what = yaml.load(f)
                app.install(list_of_what)
        else:
            app.install(what)
        app.handle_successes()
        app.handle_failures()

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
    if len(sys.argv) > 1: 
        ReedSetupApp.go(sys.argv[1])
    else:    
        ReedSetupApp.go()

if __name__ == '__main__':
    main()

# Status of success/failure (eventually to be written to a file for caching)
# Successes: ['init', 'graphviz', 'chromium-browser', 'vlc', 'lynx', 'redshift', 'p7zip-full', 'pidgin', 'anki', 'okular', 'default-jre', 'mysql-server', 'symlinks', 'git', 'vim', 'vscode', 'dropbox', 'jetbrains', 'bfg_repo_cleaner', 'python-logilab-common', 'python-pip', 'python3-pip', 'tox', 'build_stuff_from_source', 'docky', 'golly']
# Failures: ['graphviz-graphs', 'graphviz-gd', 'clone_repos', 'ffmpeg', 'all_translation']


# From the previous approach -- Things that still [were going] wrong

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
