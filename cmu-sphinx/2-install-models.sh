########################################
# 002 MODELS INSTALL
# First attempt was messy. See old-002-models.sh
########################################

#Hello world.
# From https://cmusphinx.github.io/wiki/tutorialpocketsphinx/
gcc -o hello_ps hello_ps.c \
    -DMODELDIR=\"`pkg-config --variable=modeldir pocketsphinx`\" \
    `pkg-config --cflags --libs pocketsphinx sphinxbase`

en_us_dir=/usr/local/share/pocketsphinx/model/en-us/en-us
lm_dir=/usr/local/share/pocketsphinx/model/en-us/en-us.lm.bin
cmu_dict_dir=/usr/local/share/pocketsphinx/model/en-us/cmudict-en-us.dict

ls $lm_dir
ls $cmu_dict_dir


#Also useful: Be able to resample
sudo apt install sox

#Earlier documentation from old-002-models.sh
#Possibly also useful stuff
#https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/
#https://github.com/jeff1evesque/pocketsphinx/issues/27
#https://github.com/jeff1evesque/pocketsphinx/pull/65/files
#Especially
#Ensure en-us is stored in:
#/usr/local/share/pocketsphinx/model/hmm/en-us
#Then, ensure cmusphinx-5.0-en-us.lm.dmp is stored in:
#
#/usr/local/share/pocketsphinx/model/lm/cmusphinx-5.0-en-us.lm.dmp

