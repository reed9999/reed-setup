pushd ~

VENV_DIR=~/.virtualenvs
REPO=gdelt-demo
echo "source $VENV_DIR/$REPO/bin/activate"
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
