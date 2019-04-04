#https://askubuntu.com/questions/307/how-can-ppas-be-removed

cat /etc/apt/sources.list

#This apparently needs to happen under Python3.5
~/u/handy-tips/switch-python-ver.sh 3.5
# # sudo apt update
# # sudo apt install python-apt
sudo add-apt-repository -r skype-stable
grep skype /etc/apt/sources.list 

# Still don't know what to do about
#Hit:4 http://ppa.launchpad.net/jonathonf/python-3.6/ubuntu xenial InRelease    
#Err:3 http://archive.canonical.com/ubuntu xenial InRelease                     
#  The following signatures were invalid: BADSIG 40976EAF437D05B5 Ubuntu Archive Automatic Signing Key <ftpmaster@ubuntu.com>

sudo add-apt-repository -r http://archive.canonical.com/ubuntu/dists/xenial/InRelease


## Not 100% sure if I should be removing https://repo.skype.com/deb, 
# skype-stable.list, or skype-stable. I tried all and one worked.