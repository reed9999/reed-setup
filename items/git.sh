# git should probably already be installed manually, since we likely cloned
# the repo to get reed-setup code in the first place. But we should do the 
# config here.
# For now it's just a reminder. Eventually prompt the user and default to my 
# own info. 

git config --global credential.helper store

git config --global user.email "<>"
git config --global user.name "Philip J. Reed"



#Eventually add some git UI -- or maybe do this in hacking? elsewhere?
#https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools#Graphical_Interfaces_-_FLOSS

