########################################
# SETUP for rhythmbox
# It was already running just fine from the standard Ubuntu install 
# but I thought would be fun to 
# build from source.
########################################

cd ~/code/
# # git clone https://github.com/GNOME/rhythmbox
# # git clone https://github.com/samba-team/samba

### More than likely this samba stuff is all nonsense
# See confusing-error.txt

cd samba/lib/tdb
# # ./configure
# # make
# # sudo make install

# Maybe a better way around the gtk-doc problem
sudo apt-get build-dep rhythmbox
# See old-2-gtk-doc-fix.sh
# The above fixed it.

#Even so, still some problems...
cd ../../../rhythmbox

# configure: error: Package requirements (		  gobject-introspection-1.0 >= 0.10.0 		  gtk+-3.0 >= 3.20.0					  x11						  gdk-pixbuf-2.0 >= 2.18.0			  glib-2.0 >= 2.38.0				  gio-2.0 >= 2.38.0					  gio-unix-2.0 >= 2.38.0				  libsoup-2.4 >= 2.42.0				  libpeas-1.0 >= 0.7.3				  libpeas-gtk-1.0 >= 0.7.3			  libxml-2.0 >= 2.7.8				  tdb >= 1.2.6						  json-glib-1.0) were not met:
#handy sed #s/>= [0-9\.]+//g
array=(      gobject-introspection-1.0        gtk+-3.0             x11             gdk-pixbuf-2.0         glib-2.0           gio-2.0      gio-unix-2.0           libsoup-2.4          libpeas-1.0           libpeas-gtk-1.0         libxml-2.0      tdb               json-glib-1.0)

for thing_to_install in "${array[@]}"
do
echo "Will not attemp to install ($thing_to_install) because this is bogus"
# #  echo "Now attempting to install ($thing_to_install)"
# #   sudo apt install $thing_to_install
done

#wget https://www.samba.org/ftp/tdb/tdb-1.3.15.tar.gz

array=(rhythmbox) #I thought I might need some other things.
for repo in "${array[@]}"
do
	echo "Now cloning $repo."
  cd $repo
  ./autogen.sh
  ./configure
  make
  make install
done

./configure

#Things they should probably fix.
# No GTK-Doc found, please install it - How would I know? Requirements file?
# INSTALL file, references in README etc., doesn't exist.
# How would I know to do build-dep?
# Horribly confusing message logged in confusing-error.txt

#GTK-Doc build problems.
# building GTK-Doc from source fails with xsltproc
# configure: error: could not find DocBook XML DTD V4.3 in XML catalog


