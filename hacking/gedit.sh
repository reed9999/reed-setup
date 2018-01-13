cd ~/code/gedit
git checkout 3.18.3  #not yet ready for GNOME 3.20 
sudo apt install gtksourceview-3.0
sudo apt install gsettings-desktop-schemas

  ./autogen.sh
  ./configure --disable-spell
  make
  make install


#$ find / -name gsettings-desktop-schemas 2>/dev/null
#/usr/share/doc/gsettings-desktop-schemas
