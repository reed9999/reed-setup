#!/usr/bin/env bash
################################################################################
# 099 RUN POCKETSPHINX
# Works, AFAICT. 
# However, I don't know what I did to fix the acmod.c error below. All I can
# think of is that compiling ./hello_ps.c may have somehow put things in the 
# right place?
################################################################################

if 0 ; then
  pocketsphinx_continuous -infile 17-11-06-19-51-56.wav > decode-result.txt

#http://www.repository.voxforge1.org/downloads/SpeechCorpus/Trunk/Audio/Main/16kHz_16bit/
else
  
  ~/code/u/cmu-sphinx/96-resample.sh

array=(34 39 40 41 42 43)
for number in "${array[@]}"
do 


  pocketsphinx_continuous \
  -hmm "/usr/local/share/pocketsphinx/model/el-gr/el-gr.cd_cont_5000" \
  -lm "/usr/local/share/pocketsphinx/model/el-gr/el-gr.lm" \
  -dict "/usr/local/share/pocketsphinx/model/el-gr/el-gr.dic" \
  -infile ~/code/u/cmu-sphinx/el-gr/aero_iap-20150703-ftm/wav/resample-el-00$number.wav  > decode-el$number.txt

done
fi

#earlier
#INFO: cmn.c(143): mean[0]= 12.00, mean[1..12]= 0.0
#ERROR: "acmod.c", line 80: Acoustic model definition is not specified either with -mdef option or with -hmm


# Works
  #pocketsphinx_continuous -hmm "/usr/local/share/pocketsphinx/model/hmm/en-us" -infile ~/code/u/cmu-sphinx/goforward.raw 
  #pocketsphinx_continuous -hmm "/usr/local/share/pocketsphinx/model/en-us/en-us" -infile ~/code/u/cmu-sphinx/goforward.raw 

#Doesn't work
  #pocketsphinx_continuous -hmm "/usr/local/share/pocketsphinx/model/el-gr/el-gr.cd_cont_5000" -infile ~/code/u/cmu-sphinx/el-gr/pronunciation_el_είναι.mp3 > decode-el01.txt
