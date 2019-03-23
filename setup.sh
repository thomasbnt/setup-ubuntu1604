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
    apt-get update -y
    apt-get install curl -y
    apt-get install git -y
    apt-get install gimp -y
    snap install gravit-designer
    add-apt-repository ppa:snwh/pulp
    apt-add-repository ppa:brightbox/ruby-ng
    add-apt-repository ppa:peek-developers/stable
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    apt-get update -y
    apt-get install software-properties-common
    apt-get install paper-gtk-theme -y
    apt-get install paper-icon-theme -y
    apt-get install unity-tweak-tool -y
    apt-get install openvpn -y
    apt-get install network-manager-openvpn -y
    apt-get install network-manager-openvpn-gnome -y
    apt-get install filezilla -y
    apt-get install ruby2.2
    apt-get install chromium-browser -y
    apt-get install -f -y
    apt-get install peek
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    "Installing NodeJS"
    apt-get install nodejs -y
    "Installing Yarn"
    apt-get install yarn -y
    "Installing WebServer"
    apt-get install apache2 php mysql-server libapache2-mod-php php-mysql -y
    apt-get install php-curl php-gd php-intl php-json php-mbstring php-mcrypt php-xml php-zip php7.0-mbstring php-gettext -y
    apt-get install phpmyadmin
    echo "# Active PhpMyAdmin" >> /etc/apache2/apache2.conf
    echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
    sudo service apache2 restart
    echo "Editing DNS to CloudFlare (File : scripts/dns_cloudflare.sh)"
    bash ./scripts/dns_cloudflare.sh
    echo "Setup Wallpaper random from Unsplash (File : scripts/wallpaper_unsplash.sh)"
    bash ./scripts/wallpaper_unsplash.sh
    echo "Creating .ssh folder"
    mkdir ~/home/$USER/.ssh
    echo "Disabling Guest login.."
    mkdir -p /etc/lightdm/lightdm.conf.d
    touch /etc/lightdm/lightdm.conf.d/50-disable-guest.conf
    echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf.d/50-disable-guest.conf
    echo "allow-guest=false" >> /etc/lightdm/lightdm.conf.d/50-disable-guest.conf
    echo "# Finished ! Please restart. "

elif [ "$answer" = "n" ] || [ "$answer" = "N" ] || [ "$answer" = "No"  ] || [ "$answer" = "no"  ] || [ "$answer" = "NO" ]; then
    echo ""
    echo "# Hum okay. :door:"
else
    echo "# Error. Yes or No."
fi
