#!/usr/bin/python3
# This was a shell script, but the looping is failing when I run via a Python
# wrapper although it works directly from the command line. Rather than 
# troubleshoot bash loops I'd rather focus on other topics and let Python do 
# the looping. 
########################################
import os
import subprocess
from subprocess import call

repos_to_clone = [
  "gdelt-demo", 
  "anki", 
  "econgraphs", 
  "qutebrowser", 
  "freeCodeCamp", 
  "awesome-for-beginners", 
  "Theano", 
  "coala", 
  "coala-bears", 
  "reedwebutil", 
  "tuneinrecordings", 
  "neural-networks-and-deep-learning", 
  "django", 
]

def clone_repo_full(repo):
    repo_path = os.path.join(os.path.expanduser('~'), 'code', repo, )
    repo_git_path = os.path.join(repo_path, '.git',)
    if os.path.exists(repo_git_path):
        print("No need to clone {}; it seems to already exist.".format(repo))
    else:
        cmd = "git clone https://github.com/reed9999/{0} ~/code/{0}".format(repo)
        return_value = call(cmd, shell=True)
        if return_value != 0: 
            raise RuntimeError("Return value is {} for {}".format(return_value, repo))

for repo in repos_to_clone:
    clone_repo_full(repo)

global_cmd = 'git config --global credential.helper store'
return_value = call(global_cmd, shell=True)
if return_value != 0: 
    msg = "Could not set credential.helper globally. rv={}".format(
        return_value, repo)
    raise RuntimeError(msg)

