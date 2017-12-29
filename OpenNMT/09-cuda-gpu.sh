########################################
# openNMT
#http://opennmt.net/OpenNMT/installation/
#http://torch.ch/docs/getting-started.html
# It seems CUDA is almost essential
# I have a GPU, but no reason to think it's nvidia
# I don't know if I can get the benefit of CUDA without nvidia
########################################

echo "Confirm I even have a GPU."
#see https://askubuntu.com/questions/5417/how-to-get-the-gpu-info
sudo apt install mesa-utils
glxinfo

sudo lshw -C display
echo "Chrome's about:gpu turned out to be the most straightforward way."

#fun but largely redundant
#glxgears

sudo apt install glmark2
glmark2


#https://devtalk.nvidia.com/default/topic/842208/does-cuda-depend-on-nvidia-graphics-driver-/
