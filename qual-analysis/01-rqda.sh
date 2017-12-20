#Going from this post:
# https://forum.openhardware.science/t/any-open-source-alternatives-to-atlas-ti-nvivo-or-dedoose/580
# I'm pessimistic about open-source options but may as well try.

# http://rqda.r-forge.r-project.org
# # sudo apt update
# # sudo apt-get update




# # sudo apt-get install libgtk2.0-dev 
# # sudo apt install gfortran  #For the F77 that it will complain about

################################################################################
# INSTALL R

# # sudo apt -y install r-base

### Following is to build from latest source, but not working for me.
cd ~/code
# # git clone https://github.com/wch/r-source
cd r-source
### ./configure
### make
### make check

sudo R BATCH -f ~/Dropbox/ubuntu/qual-analysis/x01-rqda.R


#configure: error: No F77 compiler found
# make: *** No targets specified and no makefile found.  Stop.
# make: *** No rule to make target 'check'.  Stop.
# ./01-rqda.sh: line 18: R: command not found

