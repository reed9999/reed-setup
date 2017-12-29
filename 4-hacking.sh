########################################
# 4 HACKING
# For things I already have running just fine but thought would be fun to 
# build from source.
########################################




GNOME_clone() {
	repo=$1
	echo "Now cloning $repo."
	git clone https://github.com/GNOME/$repo

}

# GNOME stuff -- I'm should probably hold off until ready to upgrade GNOME en masse.
#http://www.omgubuntu.co.uk/2016/05/install-gnome-3-20-ubuntu-16-04-lts
#However, I git checkout'd rhythmbox to v3.3

date >> diskspace-before-4-hacking.txt
df -vH >> diskspace-before-4-hacking.txt


#Not that much in GNOME actually uses autogen and configure
#Meson is their new way to go. 
sudo pip3 install meson



~/u/hacking/libgweather.sh


meson_suite=(
#  libgweather \
  gnome-usage \
  baobab \
  epiphany \
) 

cd ~/code
for repo in "${meson_suite[@]}"
do
if [ "$1" == "--all" ]
then
  echo "Running the full setup (reinstalling everything)."
	GNOME_clone $repo
	echo "Now building $repo."
else
  echo "Running only the abbreviated setup (stuff I haven't installed yet.)"
fi

  cd $repo
  meson build && cd build
  ninja
  ninja testh
  cd ..
done


#gedit has special flags
short_names=(
#  gedit \
  gimp \
) 

cd ~/code
for repo in "${short_names[@]}"
do
	echo "Now cloning $repo."
  git clone https://github.com/GNOME/$repo
	echo "Now building $repo."
  cd $repo
  ./autogen.sh
  ./configure
  make
  make install
  cd ..
done
