########################################
########################################

#Apertium is weird. Just do package version.
#http://wiki.apertium.org/wiki/Install_Apertium_core_using_packaging

if [ "$1" == "--all" ]
then
echo "Installing apertium executables from scratch."
wget https://apertium.projectjj.com/apt/install-nightly.sh -O - | sudo bash
sudo apt-get -f install apertium-all-dev
apt-cache policy | grep apertium
find /var/lib/apt/lists/ |grep projectjj.*Packages | xargs grep -h Package
fi


cd ~/code
if [ "$1" == "--all" ]
then
	svn co https://matxin.svn.sourceforge.net/svnroot/matxin/trunk matxin
fi

cd matxin
./autogen.sh
make build
make install
make test





### CURRENT PROBLEM OUTPUT
###- aclocal.
###- autoconf.
###- autoheader.
###- automake.
###configure.ac:236: installing 'build-aux/compile'
###configure.ac:38: installing 'build-aux/install-sh'
###configure.ac:38: installing 'build-aux/missing'
###src/Makefile.am: installing 'build-aux/depcomp'
###
###checking for a BSD-compatible install... /usr/bin/install -c
###checking whether build environment is sane... yes
###checking for a thread-safe mkdir -p... /bin/mkdir -p
###checking for gawk... gawk
###checking whether make sets $(MAKE)... yes
###checking whether make supports nested variables... yes
###checking for xml2-config... yes
###checking for g++... g++
###checking whether the C++ compiler works... yes
###checking for C++ compiler default output file name... a.out
###checking for suffix of executables... 
###checking whether we are cross compiling... no
###checking for suffix of object files... o
###checking whether we are using the GNU C++ compiler... yes
###checking whether g++ accepts -g... yes
###checking for style of include used by make... GNU
###checking dependency style of g++... gcc3
###checking for gcc... gcc
###checking whether we are using the GNU C compiler... yes
###checking whether gcc accepts -g... yes
###checking for gcc option to accept ISO C89... none needed
###checking whether gcc understands -c and -o together... yes
###checking dependency style of gcc... gcc3
###checking how to run the C preprocessor... gcc -E
###checking whether ln -s works... yes
###checking whether make sets $(MAKE)... (cached) yes
###checking for ranlib... ranlib
###checking Compilation architecture: PPC, i686, Other... Other
###checking Operating System... Linux
###checking for xsltproc... /usr/bin/xsltproc
###checking for flex... no
###configure: error: flex not found. You may want to adjust your PATH.
