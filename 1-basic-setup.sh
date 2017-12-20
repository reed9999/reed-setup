#This shell script represents all the "initial setup" needed to get my new Ubuntu 16
# outfitted with everything I need for productive work.
# It's "basic" in the sense of basic to my needs.

################
# INSTALLATIONS
################

sudo apt install vlc

################
# SYMLINKS
################
# # ln -s ~/Documents/dissertation/ ~/zd
# # ln -s ~/Documents/transcriptions/ ~/zt


# # sudo apt install python-logilab-common


################
# GIT CLONES
################

# # cd ~/code
# # array=(anki econgraphs qutebrowser freeCodeCamp awesome-for-beginners Theano coala coala-bears)
# # for repo in "${array[@]}"
# # do
# # 	echo "Now cloning $repo."
# # 	git clone "https://github.com/reed9999/$repo"
# # done


#also anki, django already done
#reedanki needs to be in ~/Documents/Anki/addons/, in the *root*

#I've already set up dissertation, but set up the iconf branch too.
## cd ~/Documents
## git clone https://github.com/reed9999/dissertation iconf2018
## cd iconf2018
## git checkout iconf2018

#https://askubuntu.com/a/865569
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6
