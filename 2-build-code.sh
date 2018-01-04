########################################
# SECONDARY SETUP FILE
# Where I set up everything needed for hacking and building misc things
# from src
########################################

install_py_36(){
  sudo add-apt-repository ppa:jonathonf/python-3.6
  sudo apt-get update
  sudo apt-get install python3.6
}
install_py_36
  #---------------
  # GIT CLONES
  # Was moved here from basic-setup
  #---------------

cd ~/code
array=(anki econgraphs qutebrowser freeCodeCamp awesome-for-beginners Theano coala coala-bears)
for repo in "${array[@]}"
do
	echo "Now cloning $repo."
	git clone "https://github.com/reed9999/$repo"
done


#also anki, django already done
#reedanki needs to be in ~/Documents/Anki/addons/, in the *root*

sudo apt install python-logilab-common 

  #---------------
  # BUILD FROM SOURCE
  #---------------
#DRY violation -- mostly repeated from the part above, but not all
# Not sure whether to inclued econgraphs
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
#Only one of the 2 following will run successfully. 
	echo "Now making directory just in case it's still needed: $repo."
	mkdir -p ~/u/$repo

	echo "Now running custom Philip setup script for $repo."
	~/u/$repo/setup.sh 
done
