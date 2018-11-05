wget https://go.microsoft.com/fwlink/?LinkID=760868
mv code_*.deb ~/Downloads/
sudo dkpg -i ~/Downloads/code_*.deb
sudo apt install -f

