################################################################################
# Getting this going in Lyx, without a lot of reformatting, requires some installation of pieces.
# I did some of this via the GUI on Lyx
#http://flukylogs.blogspot.com/2009/09/install-style-files-in-lyx.html
################################################################################

echo "*** Because I've had such bad experiences with Lyx, I'm putting this on"
echo "*** hold for now."
echo

  ######################################
  # But what is the problem with Lyx?
  ######################################

#1. I've tried to install various classes, Lyx modules, etc.
# See the Stack Exchange from the Basque guy. See the UC-Berkeley thesis
# class, in Downloads/misc.
# Maybe they installed but I'm not sure.

#2. One reason I'm not sure is because Lyx is requiring too many changes from 
# my previous dissertation TeX.
# a. I changed all my cites into BAD CITE to get it to stop complaining
# b. The \inputs keep failing, so I had to replace them with TeX child document
#   includes
# c. Even so it still errors on things like my philip_note template.

#In sum: It just ain't worth fixing for this project!


cd ~/u/latex
mv ~/Downloads/apacite.zip .
# OR
# # wget http://mirrors.ctan.org/biblio/bibtex/contrib/apacite.zip


TARGETDIR=/usr/share/texmf/tex/latex/apacite
sudo mkdir -p $TARGETDIR
echo "Now unzipping apacite.zip to $TARGETDIR"
unzip -v apacite.zip $TARGETDIR

sudo texhash

echo "STUFF GOES HERE" >> ~/.lyx/layouts/apacite.layout

echo "Maybe try this too but I'm too lazy to implement it now."
echo "https://wiki.lyx.org/Layouts/UCThesis#toc4"
