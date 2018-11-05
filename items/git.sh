# git should probably already be installed manually, since we likely cloned
# the repo to get reed-setup code in the first place. But we should do the 
# config here.
# For now it's just a reminder. Eventually prompt the user and default to my 
# own info. 

git config credential.helper store
echo "TODO: Don't forget to set up the git.sh for real."

echo "git config --global user.email \"you@example.com\" \
git config --global user.name \"your name\""

#  git config --global user.email "you@example.com"
#  git config --global user.name "your name"

