# # sudo apt install python-pip
cd ~/code/nematus
# # virtualenv -p /usr/bin/python2.7 ve2.7
source ve2.7/scripts/activate
python --version
python2.7 -m pip install numpy numexpr cython tables theano bottle bottle-log tornado
sudo apt install cuda cudnn

