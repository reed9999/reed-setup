########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################

<<<<<<< HEAD
log_disk_space() {
	FN=diskspace-before-cltorch.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}
PRETRAINED_DIR=~/code/__local/OpenNMT/pretrained
#At one point that wasn't working so I replaced it with this....
PRETRAINED_DIR=~/u/OpenNMT/pretrained
PRETRAINED_URL=https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
mkdir -p ~/code/__local/OpenNMT
mkdir -p ~/code/__local/OpenNMT/pretrained
cd $PRETRAINED_DIR
# # echo "I will now wget $PRETRAINED_URL into $PRETRAINED_DIR"
# # wget $PRETRAINED_URL

=======
PRETRAINED_DIR=~/code/__local-large/OpenNMT/pretrained
mkdir -p ~/code/__local-large/OpenNMT
mkdir -p ~/code/__local-large/OpenNMT/pretrained
cd $PRETRAINED_DIR
PRETRAINED_URL=https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
# # echo "I will now wget $PRETRAINED_URL into $PRETRAINED_DIR"
# # wget $PRETRAINED_URL

### MODEL=$PRETRAINED_DIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
### cd ~/code/OpenNMT
### th translate.lua -model $MODEL -src data/src-test.txt -output pred.txt

PRETRAINED_DIR=~/u/OpenNMT/pretrained
>>>>>>> c456005afb04e227be4bcc68eea90fdbd6497651
echo "I will now translate from model in $PRETRAINED_DIR"
MODEL=$PRETRAINED_DIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
ls -l $MODEL

cd ~/code/OpenNMT
<<<<<<< HEAD
th translate.lua -model $MODEL -src ~/code/OpenNMT/data/src-test.txt -output ~/u/OpenNMT/pred.txt -log_level DEBUG 2>&1 | tee ~/u/OpenNMT/debug-translate.txt
=======
th translate.lua -model $MODEL -src ~/u/OpenNMT/data/src-test.txt -output ~/u/OpenNMT/pred.txt

>>>>>>> c456005afb04e227be4bcc68eea90fdbd6497651
