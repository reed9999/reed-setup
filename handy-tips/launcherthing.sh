
#Last substantive mod 2017-12-10
#Attempted to set launcher 2017-12-25
# https://help.ubuntu.com/community/UnityLaunchersAndDesktopFiles
# Section Editing an entry of the....

gsettings get com.canonical.Unity.Launcher favorites



#This revealed that the problem app was gnome-software. I did
## apt remove gnome-software
## apt install gnome-software
# Results at bottom with #R


#Not the way to set it....
#gsettings set com.canonical.Unity.Launcher favorites ['application://org.gnome.Nautilus.desktop', 'application://libreoffice-writer.desktop', 'application://libreoffice-calc.desktop', 'application://libreoffice-impress.desktop', 'application://unity-control-center.desktop', 'application://chromium-browser.desktop', 'application://dropbox.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices', 'application://lyx.desktop']

#Related : Turned on workspaces 2017-12-10
#https://askubuntu.com/questions/260510/how-do-i-turn-on-workspaces-why-do-i-only-have-one-workspace


#### Details about the gnome-software install
#R  Need to get 0 B/2,757 kB of archives.
#R  After this operation, 1,127 kB of additional disk space will be used.
#R  Do you want to continue? [Y/n] y
#R  (Reading database ... 363291 files and directories currently installed.)
#R  Preparing to unpack .../gnome-software-common_3.20.5-0ubuntu0.16.04.6_all.deb ...
#R  Unpacking gnome-software-common (3.20.5-0ubuntu0.16.04.6) over (3.20.5-0ubuntu0.16.04.5) ...
#R  Selecting previously unselected package gnome-software.
#R  Preparing to unpack .../gnome-software_3.20.5-0ubuntu0.16.04.6_amd64.deb ...
#R  Unpacking gnome-software (3.20.5-0ubuntu0.16.04.6) ...
#R  Processing triggers for hicolor-icon-theme (0.15-0ubuntu1) ...
#R  Processing triggers for libglib2.0-0:amd64 (2.48.2-0ubuntu1) ...
#R  Processing triggers for gnome-menus (3.13.3-6ubuntu3.1) ...
#R  Processing triggers for desktop-file-utils (0.22-1ubuntu5.1) ...
#R  Processing triggers for bamfdaemon (0.5.3~bzr0+16.04.20160824-0ubuntu1) ...
#R  Rebuilding /usr/share/applications/bamf-2.index...
#R  Processing triggers for mime-support (3.59ubuntu1) ...
#R  Processing triggers for man-db (2.7.5-1) ...
#R  Setting up gnome-software-common (3.20.5-0ubuntu0.16.04.6) ...
#R  Setting up gnome-software (3.20.5-0ubuntu0.16.04.6) ...
#R  philip@tenofdiamonds:~$ 
#R  
#R  
#R  
