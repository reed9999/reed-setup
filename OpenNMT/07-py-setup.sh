########################################
# openNMT
#https://discuss.pytorch.org/t/is-it-possible-to-use-pytorch-without-gpu-support/9534
#
# At this point I think it's better to learn just enough lua than to try to get
#  this working
########################################

cd ~/code
git clone https://github.com/OpenNMT/OpenNMT-py
cd OpenNMT-py
python3 setup.py build
sudo python3 setup.py install
#python3 -m pip install pytorch
pip3 install pytorch
