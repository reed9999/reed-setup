########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################

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
echo "I will now translate from model in $PRETRAINED_DIR"
MODEL=$PRETRAINED_DIR/onmt_baseline_wmt15-all.en-de_epoch13_7.19_release.t7
ls -l $MODEL

cd ~/code/OpenNMT
th translate.lua -model $MODEL -src data/src-test.txt -output pred.txt

