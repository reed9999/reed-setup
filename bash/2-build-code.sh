########################################
# SECONDARY SETUP FILE
# Where I set up everything needed for hacking and building misc things
# from src

# Some of these are big loops which is the classic case for which I was
# preferring Python. Nevertheless, if it works, don't refactor for now.

# Important: The anki_addons function never gets called but might be useful.
########################################

BASE_DIR=/home/philip/code

# No longer needed -- on Ubuntu 18 Python 3.6 is standard
install_py_36(){
  sudo add-apt-repository ppa:jonathonf/python-3.6
  sudo apt-get update
  sudo apt-get install python3.6
}

#Now in items/clone_repos.sh 
# clone_repos() {
#   array=( anki      econgraphs  qutebrowser   freeCodeCamp \
#           awesome-for-beginners \
#           Theano    coala   coala-bears reedwebutil   tuneinrecordings \
#           django \
#         )
#   for repo in "${array[@]}"
#   do
#     cd $BASE_DIR
#     echo "Considering $repo"
#     if [ ! -d "$repo" ]
#     then
#       echo "Dry run not really  cloning $repo."
#       pwd
#       echo "Now cloning $repo."
#       git clone "https://github.com/reed9999/$repo"
#     else 
#       echo "No need to clone $repo; it seems to already exist."
#     fi
#     cd $repo
#     git config credential.helper store
#   done
# }

anki_addons() {
  base_dir="/home/philip/Documents/Anki/addons/"
  repo="reedanki"
  echo $base_dir
  if [ ! -d "$base_dir$repo" ]
  then
    echo "reedanki needs to be in $base_dir$repo, in the *root*"
    echo "TODO"
    exit
  fi
  echo "$base_dir$repo looks fine"
  
}

# Now the following is either irrelevant because Py 3.6 is standard or taken 
# care of in the new setup in items/clone_repos.sh

# echo "Do you need to install py 3.6 y/[n]?"
# #read answer
# answer='n'
# if [ $answer = 'y' ]
# then
#         install_py_36
# fi
#   #---------------
#   # GIT CLONES
#   # Was moved here from basic-setup
#   #---------------

# cd ~/code
# clone_repos


# Now the following is taken care of by default handling in the new setup

# sudo apt install python-logilab-common 
# sudo apt install tox



# Now the following is taken care of in the new setup in items/build_stuff_from_source.sh
# Although apparently it was never even called....

#   #---------------
#   # BUILD FROM SOURCE
#   #---------------
# build_stuff_from_source(){
#   #DRY violation -- mostly repeated from the part above, but not all
#   # Not sure whether to include econgraphs
#   array=(
#   anki
#   Theano 
#   coala 
#   coala-bears 
#   freeCodeCamp
#   )
#   for repo in "${array[@]}"
#   do
#     cd ~/code/$repo/
#   #This is a horrible way to do this.
#   #Only one of the 2 following will run successfully. 
#     echo "Now making directory just in case it's still needed: $repo."
#     mkdir -p ~/u/$repo

#     echo "Now running custom Philip setup script for $repo."
#     ~/u/$repo/setup.sh 
#   done
# }
