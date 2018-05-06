########################################
# QUTEBROWSER
########################################
sudo apt-get update
# Must figure out why this is broken.
#sudo apt-get install python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick python-tox python3-sip python3-dev python3-pyqt5.qtsql libqt5sql5-sqlite

cd ~/code/qutebrowser/
pip3 install --upgrade pip
pip3 install tox
tox -e mkvenv-pypi

echo "#!/bin/bash
~/path/to/qutebrowser/.venv/bin/python3 -m qutebrowser \"$@\"" > /usr/local/bin/qutebrowser/start.sh
/usr/local/bin/qutebrowser/start.sh

