
sudo apt install mysql-server

#Any way to use caching_sha2_password in scripted fashion?
# See https://blog.gabriela.io/2018/02/22/how-to-use-mysql-8-0-4-with-a-gui/
# Download driver from https://dev.mysql.com/downloads/connector/j/
# But it's not yet recognized by DataGrip

# More generally this seems to indicate that the caching_sha2_password feature 
# was not yet ready for prime time in MySQL's own Workbench as of spring 
# 2018.
# https://stackoverflow.com/questions/49194719/

# Best practice may be just to use the old authentication since it doesn't matter for this project

