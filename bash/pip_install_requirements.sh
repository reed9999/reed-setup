#!/bin/bash
# The idea is to iterate into each code/* repo directory and install 
# requirements using the standard pip method.

# However something was buggy and it installed everything in the system
# Python. Most likely this has something to do with calling shell scripts 
# from Python. Anyway, it's not high priority functionality right now so just
# exit.

echo "pip_install_requirements.sh doesn't work for $REPO"
exit 999


pushd ~

echo `whoami`
echo "source $VENV_DIR/$REPO/bin/activate"
#For some reason trying to capture the rv of the source is breaking it.
rv=`source $VENV_DIR/$REPO/bin/activate`

echo "This rv appears to always be blank: $rv"
if [ rv ]; then 
    echo "pip install -r $REPO/requirements.txt"
    pip install -r ~/code/$REPO/requirements.txt

    echo "deactivate"
    deactivate
else
    echo "Couldn't activate"
    exit 999
fi 
popd
