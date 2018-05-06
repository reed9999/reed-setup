########################################
# openNMT
#http://torch.ch/docs/getting-started.html
########################################

cd ~/code
git clone https://github.com/OpenNMT/OpenNMT-py
cd OpenNMT-py
pip3 install pytorch
python3 setup.py build
sudo python3 setup.py install
#python3 -m pip install pytorch
