## 2018 Nov 4
Computer wiped out by warranty support; great opportunity to test and rearrange my setup here.

First question is why on earth is this almost 200 Mb? See .git/object/pack. Pretty sure 
that's because I stupidly had audio files in the repo at one point. I thought I'd removed them.
Call it a TODO to come back to.

Second question is reorg. I like modularity and would like each item to have a "recipe."
Standard packages where it's just a sudo apt __ have an implied recipe and need 
nothing other than a line in a list.

## 2018 Sep 1

I want to use boto3 but I want to make a requirements file for python3. But pip3 was still weird. See topical-logs/pip

sudo usermod -a -G root philip because I'm fed up with permissions issues.


## 2018 Aug 28

Installing pyspark via pip doesn't seem to work. See topical-logs/pyspark.md
Oh, never mind. I guess pyspark comes standard when you install spark!


## 2018 Aug 27
See topical-logs/hadoop.md

## 2018 Aug 26: The Hive problem

The Hive problem seemed to have been that I skipped several steps of Hadoop setup. Fair enough. See ~/uu/topical-logs/hive.md for more.

Now working on Hadoop--https://stackoverflow.com/questions/17335728
connect to host localhost port 22: Connection refused


## 2018 Aug 16

See messed up pip below. Ended up just using virtualenvs for python3
although at least pip is happily (?) installed for Python 2.7. Just don't
fall for the trick where it offers to update it!

Installed Spark with Scala. Seems very happy though I don't know Scala.
Installed Hive but I'd rather not have to install the rest of Hadoop locally.


### Messed up pip
pip is still messed up. Useful?:
https://github.com/pypa/pip/issues/5253
https://github.com/pypa/pip/issues/5240

$ sudo pip2 uninstall pip
The directory '/home/philip/.cache/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
Uninstalling pip-10.0.1:
  Would remove:
    /usr/bin/pip3
    /usr/local/bin/pip
    /usr/local/bin/pip2
    /usr/local/bin/pip2.7
    /usr/local/lib/python2.7/dist-packages/pip-10.0.1.dist-info/*
    /usr/local/lib/python2.7/dist-packages/pip/*
Proceed (y/n)? y
  Successfully uninstalled pip-10.0.1
The directory '/home/philip/.cache/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.






### This is awesome
Where pip instructs me to break itself

philip@tenofdiamonds:~/aws/gdelt-data$ pip --version
pip 8.1.1 from /usr/lib/python2.7/dist-packages (python 2.7)
philip@tenofdiamonds:~/aws/gdelt-data$ pip3 --version
bash: /usr/local/bin/pip3: No such file or directory
philip@tenofdiamonds:~/aws/gdelt-data$ pip install pip3
Collecting pip3
  Could not find a version that satisfies the requirement pip3 (from versions: )
No matching distribution found for pip3
You are using pip version 8.1.1, however version 18.0 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
philip@tenofdiamonds:~/aws/gdelt-data$ pip install --upgrade pip
Collecting pip
  Using cached https://files.pythonhosted.org/packages/5f/25/e52d3f31441505a5f3af41213346e5b6c221c9e086a166f3703d2ddaf940/pip-18.0-py2.py3-none-any.whl
Installing collected packages: pip
Successfully installed pip-18.0
philip@tenofdiamonds:~/aws/gdelt-data$ pip3 --version
bash: /usr/local/bin/pip3: No such file or directory
philip@tenofdiamonds:~/aws/gdelt-data$ pip --version
Traceback (most recent call last):
  File "/usr/bin/pip", line 9, in <module>
    from pip import main
ImportError: cannot import name main
philip@tenofdiamonds:~/aws/gdelt-data$

### Some history
 2076  pip2 uninstall pip
 2077  sudo pip2 uninstall pip
 2078  pip3
 2079  rm /usr/local/bin/pip3\*
 2080  sudo rm /usr/local/bin/pip3\*
 2083  sudo apt install python-pip
 2084  pip --version
 2085  pip3 --version
 2086  pip install pip3

This is the very bad idea:

 2087  pip install --upgrade pip
 2088  pip3 --version
 2089  pip --version
 2090  pip uninstall pip
 2092  sudo apt remove python-pip
