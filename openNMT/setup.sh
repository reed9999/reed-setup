########################################
# openNMT
#http://torch.ch/docs/getting-started.html
########################################

git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/code/torch; bash install-deps;
./install.sh

source ~/.bashrc
#Still something wrong with this transition
# luarocks didn't work implying .bashrc hadn't really been sourced.

luarocks install tds
luarocks install bit32 

cd ~/code
git clone https://github.com/OpenNMT/OpenNMT
cd OpenNMT
