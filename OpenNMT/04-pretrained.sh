########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################

#-model /home/philip/code/__local/OpenNMT/pretrained/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7 -src /home/philip/code/OpenNMT/data/src-test.txt -output /home/philip/u/OpenNMT/zb-output.txt -log_level DEBUG

log_disk_space() {
	FN=diskspace-before-cltorch.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}
PRETRAINED_DIR=~/code/__local/OpenNMT/pretrained
#At one point that wasn't working so I replaced it with this....
#PRETRAINED_DIR=~/u/OpenNMT/pretrained
PRETRAINED_URL=https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
mkdir -p ~/code/__local/OpenNMT
mkdir -p ~/code/__local/OpenNMT/pretrained
cd $PRETRAINED_DIR

echo "Enter wget if you want me to wget a fairly large pretrained model file."
read response
if [[ $response = "wget" ]]
then
  echo "I will now wget $PRETRAINED_URL into $PRETRAINED_DIR"
  wget $PRETRAINED_URL
fi

cd $PRETRAINED_DIR

echo "I will now translate from model in $PRETRAINED_DIR"
MODEL=$PRETRAINED_DIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
ls -l $MODEL

cd ~/code/OpenNMT
th translate.lua -model $MODEL -src ~/code/OpenNMT/data/src-test.txt -output ~/u/OpenNMT/pred.txt -log_level DEBUG 2>&1 | tee ~/u/OpenNMT/debug-translate.txt
