########################################
# SECONDARY SETUP FILE
########################################

#DRY violation -- mostly repeated from basic-setup, but not all
# Not sure whether to inclued econgraphs
array=(
#anki
#Theano 
#coala 
#coala-bears 
freeCodeCamp
)
for repo in "${array[@]}"
do
	cd ~/code/$repo/
#Only one of the 2 following will run successfully. 
	echo "Now making directory just in case it's still needed: $repo."
	mkdir ~/Dropbox/ubuntu/$repo

	echo "Now running custom Philip setup script for $repo."
	~/Dropbox/ubuntu/$repo/setup.sh 
done
