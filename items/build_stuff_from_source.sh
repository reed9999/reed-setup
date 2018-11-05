# This was a function in the 2-build-code.sh script and is worth trying to
# extract out into an item in the new setup.  


  #---------------
  # BUILD FROM SOURCE
  #---------------
build_stuff_from_source(){
  #DRY violation -- mostly repeated from the part above, but not all
  # Not sure whether to include econgraphs
  array=(
  anki
  Theano 
  coala 
  coala-bears 
  freeCodeCamp
  )
  for repo in "${array[@]}"
  do
    cd ~/code/$repo/
  #This is a horrible way to do this.
  #Only one of the 2 following will run successfully. 
    echo "Now making directory just in case it's still needed: $repo."
    mkdir -p ~/u/$repo

    echo "Now running custom Philip setup script for $repo."
    ~/u/$repo/setup.sh 
  done
}
