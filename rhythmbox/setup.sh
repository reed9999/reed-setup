########################################
# SETUP for rhythmbox
# It was already running just fine from the standard Ubuntu install 
# but I thought would be fun to 
# build from source.
# However, knowing that I need to upgrade all of my GNOME to 3.20 makes me think I should hold off
# on this!
# see http://www.omgubuntu.co.uk/2016/05/install-gnome-3-20-ubuntu-16-04-lts
########################################

cd ~/code/
# # git clone https://github.com/GNOME/rhythmbox
# Maybe a better way around the gtk-doc problem
sudo apt-get build-dep rhythmbox
# See old-2-gtk-doc-fix.sh
# The above fixed it.

array=(      gtk+-3.0             )

for thing_to_install in "${array[@]}"
do
  echo "Now attempting to install ($thing_to_install)"
  sudo apt install $thing_to_install
done

#Simulate what the config script was choking on
pkg-config --short-errors --print-errors --cflags --libs "gtk+-3.0 >= 3.18.0"
#https://askubuntu.com/q/78377
#dpkg -l "*gtk*" | grep ii 
apt-cache policy libgtk2.0-0 libgtk-3-0 
dpkg -l libgtk2.0-0 libgtk-3-0

array=(rhythmbox) 
for repo in "${array[@]}"
do
	echo "Now building $repo."
  cd $repo
  ./autogen.sh
  ./configure
  make
  make install
done


#Things they should probably fix.
# No GTK-Doc found, please install it - How would I know? Requirements file?
# INSTALL file, references in README etc., doesn't exist.
# How would I know to do build-dep?
# Horribly confusing message logged in confusing-error.txt

#GTK-Doc build problems.
# building GTK-Doc from source fails with xsltproc
# configure: error: could not find DocBook XML DTD V4.3 in XML catalog


