#!/bin/bash
# This was a function in the 2-build-code.sh script and is worth trying to
# extract out into an item in the new setup.  
#---------------

CODE_DIR=~/code
CUSTOM_SCRIPT_DIR=~/reed-setup/items/repos
build_stuff_from_source(){
  #DRY violation -- mostly repeated from clone_repos
  array=(
  anki
  Theano 
  coala 
  coala-bears 
  freeCodeCamp
  )
  for repo in "${array[@]}"
  do
    pushd ~/code/$repo/
    echo "Now running custom Philip setup script for $repo."
     
  done
}

build_stuff_from_source