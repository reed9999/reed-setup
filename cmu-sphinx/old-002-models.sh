########################################
# OLD ATTEMPT
# 002 MODELS INSTALL
# This got so disorganized and I liked the other approach I found, so 
# this is now just archival.
# Eventually clean out the stuff I installed here. 
########################################

#https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/

#This is helpful to give a hint of where things should be installed.
#https://github.com/jeff1evesque/pocketsphinx/issues/27
#https://github.com/jeff1evesque/pocketsphinx/pull/65/files
#Especially
#Ensure en-us is stored in:
#/usr/local/share/pocketsphinx/model/hmm/en-us
#Then, ensure cmusphinx-5.0-en-us.lm.dmp is stored in:
#
#/usr/local/share/pocketsphinx/model/lm/cmusphinx-5.0-en-us.lm.dmp


#This has become a complete mess, but this is to document where I tried to 
#install some of this stuff.
#1. General variables.
en_us_dir=/usr/local/share/pocketsphinx/model/en-us/en-us
lm_dir=/usr/local/share/pocketsphinx/model/en-us/en-us.lm.bin
cmu_dict_dir=/usr/local/share/pocketsphinx/model/en-us/cmudict-en-us.dict


#Previous, messy version.
temp_place=~/Dropbox/ubuntu/cmu-sphinx
model_tar=$temp_place/cmusphinx-en-us-8khz-5.2.tar.gz
old_lang_model_dir=/usr/local/share/pocketsphinx/model/en-us
new_lang_model_dir=/usr/local/share/pocketsphinx/model/hmm

#2. 
#Original efforts to install at the old place.
# # mv ~/Downloads/cmusphinx-e* $temp_place 
# # tar tvf $model_tar
#tar xvf $model_tar -C $old_lang_model_dir/en-us

#3. 
#Following is to 'fix' things I installed, so they're closer to where the 
# jeff1evesque github issue above says. 
# # sudo mv $old_lang_model_dir $new_lang_model_dir
ls $new_lang_model_dir
ls $new_lang_model_dir/en-us




#Following is not the right thing.
#gunzip $temp_place/cmusphinx-en-us-8khz-5.2.tar.gz -lv
#unzip $temp_place/cmusphinx-en-us-8khz-5.2.tar.gz -d $old_lang_model_dir

# This might be interesting eventually but would be tons better to get the command line working first.
#1. Try this - https://github.com/Uberi/speech_recognition/blob/master/reference/pocketsphinx.rst#notes-on-the-structure-of-the-language-data
# However I think that's just for that python library, not in general!
#https://github.com/Uberi/speech_recognition

