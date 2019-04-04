import os
from subprocess import call

a_dir = "/home/philip/code"
def pull_subdir(which):
  os.chdir(os.path.expanduser('~/code/')+which)
  call("git pull".split())

  
def go():
  for x in [name for name in os.listdir(a_dir)
            if os.path.isdir(os.path.join(a_dir, name))]:
    pull_subdir(x)
if __name__ == "__main__":
  go()

