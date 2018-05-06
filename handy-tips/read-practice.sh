################################################################################
# I'm pretty bad at getting read to work in shell scripts. 
# Keep this around as long as I need a handy reference then delete it.
################################################################################

playing_with_read(){

  echo "Do you want this to match? [ENTER or y]"
  read x
  if [[ $x = "" || $x = "y" ]]
  then
    echo "It matched"
  else
    echo "Nope"
  fi
  exit
}
playing_with_read
