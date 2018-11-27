#!/usr/bin/python3
# This was a shell script, but the looping is failing when I run via a Python
# wrapper although it works directly from the command line. Rather than 
# troubleshoot bash loops I'd rather focus on other topics and let Python do 
# the looping. 
########################################
import os
import subprocess
from subprocess import call

VIRTUALENVS = os.path.expanduser( "~/.virtualenvs")
repos_to_clone = [
  "gdelt-demo", 
#   "anki", 
#   "econgraphs", 
#   "qutebrowser", 
#   "freeCodeCamp", 
#   "awesome-for-beginners", 
#   "Theano", 
#   "coala", 
#   "coala-bears", 
#   "reedwebutil", 
#   "tuneinrecordings", 
#   "neural-networks-and-deep-learning", 
#   "django", 
]

def len_and_env_sanity_check(env):
    """Apparently something is awry with my understanding of how to find the length of a data 
    structure and print it out with print()! This is just to troubleshoot what on earth is 
    going on here.
    """
    print( "at the beginning env is {}".format(env))
    #env = env or [1, 2, 3]
    if not env:
        env = {}
    the_len = len([1, 2, 3])
    print( the_len)
    print( "[checkpoint M] sanitycheck is ".format(the_len))
    print( len([1, 2, 3]))
    print( "after processing len(env) is ".format(len(env)))
    print( "after processing env is ")
    print( "THIS CONCLUDES THE SANITY CHECK")

def call_and_check_rv(cmd, env=None, failure_text=None, shell=True):
    print( "cmd is {}".format(cmd))
    if True:
        len_and_env_sanity_check(env)
    for k in env:
            print( k )
    return_value = call(cmd, shell=True, env=env)
    failure_text = failure_text or cmd 
    if return_value != 0: 
        raise RuntimeError("ret val={}; point of failure={}".format(return_value, failure_text))

def clone_repo(repo):
    repo_path = os.path.join(os.path.expanduser('~'), 'code', repo, )
    repo_git_path = os.path.join(repo_path, '.git',)
    if os.path.exists(repo_git_path):
        print("No need to clone {}; it seems to already exist.".format(repo))
    else:
        cmd = "git clone https://github.com/reed9999/{0} ~/code/{0}".format(repo)
        call_and_check_rv(cmd, "clone [{}]".format(repo))
    post_process(repo)

def create_virtualenv(repo):
    if os.path.exists(os.path.expanduser("~/{}/{}".format(VIRTUALENVS, repo))):
        return False
    call_and_check_rv("mkdir -p {}".format(VIRTUALENVS))
    if repo in ['neural-networks-and-deep-learning']:
        pyver = 'python2.7'
    else:
        pyver = 'python3.6'
    cmd = "virtualenv --python={} {}/{}".format(pyver, VIRTUALENVS, repo)
    call_and_check_rv(cmd)
    return True

def install_requirements(repo):
    install_requirements_attempt3()

def install_requirements_attempt3(repo):
    env = {'VENV_DIR': VIRTUALENVS, 'REPO': repo}
    cmd = "bash/pip_install_requirements.sh"
    print( "in attemp t3 env is {}".format(env))
    #call_and_check_rv(cmd, env=env)
    call_and_check_rv(cmd, env={'philip': 1, 'hello': 2})
    
def install_requirements_attempt2(repo):
    cmd = "export VENV_DIR={}; export REPO={}; bash/pip_install_requirements.sh"
    call_and_check_rv(cmd.format(VIRTUALENVS, repo))
    
def install_requirements_attempt1(repo):
    call_and_check_rv("/bin/bash; source {}/{}/bin/activate".format(VIRTUALENVS, repo))
    call_and_check_rv("pip install -r {}/requirements.txt".format(VIRTUALENVS, repo))
    call_and_check_rv("deactivate", "deactivate for {}".format(repo))
    

def post_process(repo):
    create_virtualenv(repo)
    install_requirements(repo)
    exit

def clone_repo_full(repo):
    # clone_repo(repo) #TODO reenable this!
    post_process(repo)

for repo in repos_to_clone:
    clone_repo_full(repo)

global_cmd = 'git config --global credential.helper store'
call_and_check_rv(global_cmd, "setting credential.helper globally")

