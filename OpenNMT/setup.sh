########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://torch.ch/docs/getting-started.html
########################################

if [ "$1" == "--all" ]
then
	git clone https://github.com/torch/distro.git ~/code/torch --recursive
	cd ~/code/torch; bash install-deps;
	./install.sh

	source ~/.bashrc
	#Still something wrong with this transition
	# luarocks didn't work implying .bashrc hadn't really been sourced.
fi

sudo apt install luarocks
cd ~/code/torch
sudo luarocks install tds
sudo luarocks install bit32 
#Note: If for any reason luarocks can't find one of these, path it directly
# to torch/install/bin/luarocks.
# https://github.com/torch/nngraph/issues/52

cd ~/code
git clone https://github.com/OpenNMT/OpenNMT
cd OpenNMT
