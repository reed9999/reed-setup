# Script to install and configure the Jetbrains Toolbox

if which jetbrains-toolbox ; then   #actually I don't know the command yet, just guessing.
  echo "VS Code (code) appears to be installed."; exit 0; 
fi;

echo "Not yet complete; come back to this one"
exit 999

# It's a weakness that the URL is HARDCODED but I figure it will autoupdate
# itself once it's installed.
# We could use the INFO_URL to find the latest version.
INFO_URL=https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release

URL=https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz
CHECKSUM_URL=https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz.sha256

JETBRAINS_GLOB=jetbrains-toolbox*.gz
if [ ! -e $JETBRAINS_GLOB ] && [ ! -e ~/Downloads/$JETBRAINS_GLOB ]; then 
        wget $URL
        wget $CHECKSUM_URL
else
        echo "Jetbrains Toolbox file already exists"
fi;

# See https://stackoverflow.com/questions/21956954/how-to-check-the-checksum-through-commandline

CHECKSUM=`cat jetbrains*.sha256`
shasum jetbrains-toolbox*.gz |
  awk "$1==$CHECKSUM{print'good to go'}"

#2018-11-04 16:30:18 (7.13 MB/s) - ‘jetbrains-toolbox-1.11.4269.tar.gz.sha256’ saved [101/101]

#awk: line 1: syntax error at or near ==


mv jetbrains-toolbox*.gz ~/Downloads/



