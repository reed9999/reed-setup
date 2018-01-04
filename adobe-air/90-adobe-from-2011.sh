########################################
# Set up Adobe Air
# https://helpx.adobe.com/air/kb/install-air-2-64-bit.html
########################################

# https://askubuntu.com/questions/87447/how-can-i-install-adobe-air

echo "These instructions from Adobe were from 2011, Ubuntu 9, 32 bit only."
echo " I consider them dodgy."
exit 1
# # wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin
# # mv AdobeAIRInstaller.bin ~/Dropbox/ubuntu/adobe-air/
# # chmod 755 ~/Dropbox/ubuntu/adobe-air/AdobeAIRInstaller.bin
#~/Dropbox/ubuntu/adobe-air/AdobeAIRInstaller.bin
~/ubuntu/adobe-air/AdobeAIRInstaller.bin
#which gives a completely opaque error of file not found.

echo "According to Adobe I need several dependencies to run a 32-bit app."
echo "It's unfortunate that Air on Linux is unsupported and only 32-bit exists"
sudo dpkg -i getlibs-all.deb
sudo ./AdobeAIRInstaller.bin
sudo getlibs -l libhal-storage.so.1
sudo getlibs -l libgnome-keyring.so.0.1.1


 
if [ "$1" == "--wget" ]
then
  echo "Now I will wget some more dependencies."
  DLDIR=~/u/adobe-air
  NSS_URL=http://mirrors.kernel.org/ubuntu/pool/main/n/nss/libnss3-1d_3.12.3.1-0ubuntu2_i386.deb
  NSPR_URL=http://mirrors.kernel.org/ubuntu/pool/main/n/nspr/libnspr4-0d-dbg_4.7.1~beta2-0ubuntu1_i386.deb
  
  cd $DLDIR
  wget $NSS_URL
  wget $NSPR_URL

  sudo file-roller libnss3-1d_3.12.3.1-0ubuntu0.9.04.2_i386.deb
end
