########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################

#-model /home/philip/code/__local/OpenNMT/pretrained/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7 -src /home/philip/code/OpenNMT/data/src-test.txt -output /home/philip/u/OpenNMT/zb-output.txt -log_level DEBUG

BIGFILEDIR=~/code/__local
MODELSTORAGEDIR=$BIGFILEDIR/OpenNMT/pretrained
log_disk_space() {
	FN=diskspace-before-cltorch.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}

romance_language_models() {
  MODELFILE='https://s3.amazonaws.com/opennmt-models/onmt_esfritptro-4-1000-600_epoch13_3.12_release_v2.t7'
  echo "Enter romance if you want me to wget a 1.3Gb model of various romance languages."
  read response
  if [[ $response = "romance" ]]
  then
    echo "I will now wget $MODELFILE into $MODELSTORAGEDIR"
    cd $MODELSTORAGEDIR
    wget $MODELFILE
  fi
}

romance_language_models
exit

MODELSTORAGEDIR=~/code/__local/
#At one point that wasn't working so I replaced it with this....
#MODELSTORAGEDIR=~/u/OpenNMT/pretrained
PRETRAINED_URL=https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
#mkdir -p ~/code/__local/OpenNMT
#mkdir -p ~/code/__local/OpenNMT/pretrained
mkdir -p $MODELSTORAGEDIR
cd $MODELSTORAGEDIR

echo "Enter wget if you want me to wget a fairly large pretrained model file."
read response
if [[ $response = "wget" ]]
then
  echo "I will now wget $PRETRAINED_URL into $MODELSTORAGEDIR"
  wget $PRETRAINED_URL
fi

cd $MODELSTORAGEDIR

echo "I will now translate from model in $MODELSTORAGEDIR"
MODEL=$MODELSTORAGEDIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
ls -l $MODEL

cd ~/code/OpenNMT
th translate.lua -model $MODEL -src ~/code/OpenNMT/data/src-test.txt -output ~/u/OpenNMT/pred.txt -log_level DEBUG 2>&1 | tee ~/u/OpenNMT/debug-translate.txt
