########################################
# Acquiring the learning needed to understand openNMT
# http://neuralnetworksanddeeplearning.com
########################################
log_disk_space() {
	FN=diskspace-before-nnadp-book.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}

cd ~/u/OpenNMT/
log_disk_space
cd ~/code
REPO_OWNER=mnielsen
REPO=neural-networks-and-deep-learning
git clone https://github.com/$REPO_OWNER/$REPO
