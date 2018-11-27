# See https://packaging.python.org/tutorials/installing-packages/ - make sure pip works, but 
# not just pip! 

# This works in isolation but not when run as an item on ./0-main.py python_packaging
# Suggesting there's something I'm not understanding about running bash scripts in Python
pip_version=`pip --version`
if [[ $pip_version ]]
then
    echo "pip OK. Version is: $pip_version"
else
    echo "PIP is not installed so the item failed."
    exit 999
fi