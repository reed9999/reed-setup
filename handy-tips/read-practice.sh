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

create_symlinks(){
  for i in `seq 1 5`;
  do 
    fn = "script-$i"
    test $fn ||  ln -s "$i*.*" $fn
  done
}

playing_with_read2(){
  echo "Which script to run? Enter 1 through 5 or 9 for all"
  read choice
  case $choice in
    [1-5])
      echo "Run $choice"
      ;;
    [9])
      echo "Run all"
      ;;
  esac
}


create_symlinks
playing_with_read2
