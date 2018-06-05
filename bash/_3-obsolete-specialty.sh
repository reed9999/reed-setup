########################################
# TERTIARY SETUP FILE
# For specialty applications that are still good to keep a record of.
########################################

cd ~/u
sudo apt install ffmpeg
ffmpeg --help > output/temp3.txt
cat output/temp3.txt


echo "Random stuff I like to play with, and organizational helps."
sudo apt install golly
sudo apt install docky

#Eventually add some git UI -- or maybe do this in hacking? elsewhere?
#https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools#Graphical_Interfaces_-_FLOSS



#Hmm, install Compiz Config Settings Manager 
# but this doesn't work
#sudo apt-get install ccsm


echo "Do you want me to delete the temp3 output? [ENTER or y]"
read x
echo (( $x = "y" ))
if [ $x = "" || $x = "y" ]
then
  rm output/temp3.txt
fi
