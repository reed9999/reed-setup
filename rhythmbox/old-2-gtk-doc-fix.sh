
#Dependency on GTK-Doc; may as well build it from source too.
# # git clone git://git.gnome.org/gtk-doc

# Dependency for GTK-Doc
sudo apt install xsltproc

# configure: error: could not find DocBook XSL Stylesheets in XML catalog
# https://github.com/Homebrew/legacy-homebrew/issues/27320
# sudo vim /etc/xml/catalog
#but actually 
update-xmlcatalog --help
#sudo apt install docbook
#mkdir tmp-docbook
#cd tmp-docbook
#wget 'http://docbook.org/xml/5.0/catalog.xml'
#cd ..
#pwd

array=(gtk-doc rhythmbox)
for repo in "${array[@]}"
do
	echo "Now cloning $repo."
  cd $repo
  ./autogen.sh
  ./configure
  make
  make install
done
