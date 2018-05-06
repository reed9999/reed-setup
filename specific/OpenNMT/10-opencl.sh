########################################
# openNMT using OpenCL instead of NVidia's CUDA
# http://forum.opennmt.net/t/opencl-instead-of-cuda/52
########################################
# When I get this going, it will allow me to use my primary computer's
# (tenofdiamonds') GPU
# However, cltorch seems to be its own thing that may not work with std
# torch. (?)


log_disk_space () {
	FN=diskspace-before-cltorch.txt
	date '+%Y/%m/%d_%H:%M:%S' >> $FN
	df -vH >> $FN
}
cd ~/u/OpenNMT
log_disk_space

cd ~/code/
echo "I will now clone cltorch from github."
git clone https://github.com/hughperkins/cltorch
echo "I'm not really clear on whether distro-cl will play nice with existing"
echo " torch distros, so a little reluctant to go further."
git clone https://github.com/hughperkins/distro-cl
