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
  "django", 
]

for repo in repos_to_clone:
    repo_git_path = os.path.join(os.path.expanduser('~'), 'code', repo, '.git')
    if os.path.exists(repo_git_path):
        print("No need to clone {}; it seems to already exist.".format(repo))
        continue
    cmd = "git clone https://github.com/reed9999/{0} ~/code/{0}".format(repo)
    return_value = call(cmd, shell=True)
    if return_value != 0: 
        raise RuntimeError("Return value is {} for {}".format(return_value, repo))
    # TODO convert this to Python
        # cd $repo
        # git config credential.helper store
