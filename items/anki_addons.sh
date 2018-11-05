# Not yet in use. Extracted from 2-build-code.sh

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