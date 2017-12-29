########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://torch.ch/docs/getting-started.html
########################################

if [ "$1" == "--all" ]
then
	git clone https://github.com/torch/distro.git ~/torch --recursive
	cd ~/code/torch; bash install-deps;
	./install.sh

	source ~/.bashrc
	#Still something wrong with this transition
	# luarocks didn't work implying .bashrc hadn't really been sourced.
fi

luarocks install tds
luarocks install bit32 

cd ~/code
git clone https://github.com/OpenNMT/OpenNMT
cd OpenNMT
