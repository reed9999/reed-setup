#!/bin/bash

declare -A desired_links
desired_links=(
    [jh]=~/Dropbox/job_hunt
    [aws]=~/code/gdelt-demo
  ) 
for link_name in "${!desired_links[@]}"
do
  if [ -e ~/$link_name ] ; then
    echo "No link $link_name will be created because that file already exists."
  else
    ln -s ${desired_links[$link_name]} ~/$link_name
  fi
done
