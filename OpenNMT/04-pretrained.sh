########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################

PRETRAINED_DIR=~/code/__local-large/OpenNMT/pretrained
mkdir -p ~/code/__local-large/OpenNMT
mkdir -p ~/code/__local-large/OpenNMT/pretrained
cd ~/code/__local-large/OpenNMT/pretrained
PRETRAINED_URL=https://s3.amazonaws.com/opennmt-models/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
echo $PRETRAINED_URL
# # wget $PRETRAINED_URL
MODEL=$PRETRAINED_DIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
cd ~/code/OpenNMT
th translate.lua -model $MODEL -src data/src-test.txt -output pred.txt


