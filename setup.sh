#!/usr/bin/env bash
if [[ $EUID -ne 0 ]]; then
   echo "################################################################################"
   echo "#                This script must be run as root (sudo -s)                     #" 
   echo "################################################################################"
   exit
fi
clear
echo "################################################################################"
echo "#                                                                              #"
echo "#                                    SETUP                                     #"
echo "#                                                                              #"
echo "#          Repository : https://github.com/thomasbnt/setup-ubuntu1604          #"
echo "#  Software list : https://github.com/thomasbnt/setup-ubuntu1604#software-list #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "################################################################################"
echo ""
echo -n "# Do you want to install the software? Y/N or CTRL+C :  "
read answer
if [ "$answer" = "y" ] || [ "$answer" = "Y"  ] || [ "$answer" = "Yes"  ] || [ "$answer" = "yes"  ] || [ "$answer" = "YES" ]; then
    echo ""
    echo ""
    echo "# Installing.."
    apt-get update
    apt install git
    apt install gimp
    add-apt-repository ppa:snwh/pulp
    apt-get update
    apt-get install paper-gtk-theme 
    apt-get install paper-icon-theme
    apt-get install unity-tweak-tool
    apt install openvpn 
    apt install network-manager-openvpn
    apt install network-manager-openvpn-gnome
    apt install chromium-browser
    mkdir -p /etc/lightdm/lightdm.conf.d
    touch /etc/lightdm/lightdm.conf.d/50-disable-guest.conf
    echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf.d/50-disable-guest.conf 
    echo "allow-guest=false" >> /etc/lightdm/lightdm.conf.d/50-disable-guest.conf 
    wget https://discordapp.com/api/download?platform=linux&format=deb
    apt-get install -f

    
    
    










    
elif [ "$answer" = "n" ] || [ "$answer" = "N" ] || [ "$answer" = "No"  ] || [ "$answer" = "no"  ] || [ "$answer" = "NO" ]; then
    echo ""
    echo "# Hum okay. :door:"
else
    echo "# Error. Yes or No."
fi

