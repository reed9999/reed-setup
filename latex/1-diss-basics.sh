
sudo apt install texmaker



#NOTA BENE: The rest of this script isn't really in use. I needed a solution to compare two
# LaTeX and liked what it says here: 
# https://www.sharelatex.com/blog/2013/02/16/using-latexdiff-for-marking-changes-to-tex-documents.html
# but so far it isn't working for me.

########################################
#OLD STUFF


#NO, don't do this per texlive # apt-get install texlive

#Also don't need to do this if use GUI
# clean out past install as per texlive link below
# # rm -rf /usr/local/texlive/2016
# # rm -rf ~/.texlive2017

#echo "########################################"
echo "texlive with the Ubuntu Software Centre GUI does not work great."
echo "Anyway, if texlive isn't working then at the moment I have no desire"
echo "  to install it."
#echo "Maybe there is a way to do this in a script, but I don't know it."
#echo "########################################"

# # which perl
# # perl --version
# # mkdir -p $HOME/Downloads/tmp
# # wget -O $HOME/Downloads/tmp/latexdiff.zip http://mirrors.ctan.org/support/latexdiff.zip
# # unzip $HOME/Downloads/tmp/latexdiff.zip -lv
# # unzip $HOME/Downloads/tmp/latexdiff.zip -d $(which perl)


#HELPFUL
#Install texlive as user (recommended)
#	https://askubuntu.com/q/440118/679415
#	https://www.tug.org/texlive/quickinstall.html

