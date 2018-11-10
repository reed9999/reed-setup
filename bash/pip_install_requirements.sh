#!/bin/bash
pushd ~

echo "source $VENV_DIR/$REPO/bin/activate"
rv=source $VENV_DIR/$REPO/bin/activate

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
