########################################
# THEANO
# Seems to be complete
########################################
cd ~/code/Theano/
sudo pip3 install scipy
sudo python3 ./setup.py build
sudo python3 ./setup.py install
python3 -c 'import theano; print(dir(theano))'
