#!/bin/bash

declare -A desired_links
desired_links=(
    [jh]=~/Dropbox/job_hunt
  ) 
for link_name in "${!desired_links[@]}"
do
    ln -s ${desired_links[$link_name]} ~/$link_name
done