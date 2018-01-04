########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://opennmt.net/Models/
#http://torch.ch/docs/getting-started.html
########################################
log_disk_space() {
	FN=diskspace-before-zerobrane.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}

cd ~/u/OpenNMT/
log_disk_space
cd ~/code
git clone https://github.com/pkulchenko/ZeroBraneStudio
