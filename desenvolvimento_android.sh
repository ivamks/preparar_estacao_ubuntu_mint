#!/bin/bash
# Date : (09/mai/2020)
# Distribution used to test : Ubuntu 17.10 x64
# Author : Ivam Santos
# Licence : GPLv3

# Aplicativos básicos
sudo apt install ubuntu-restricted-extras -y
sudo apt install openssh-server evolution skypeforlinux vlc gimp obs-studio zoom-player whatsapp-desktop telegram-desktop -y 

#Instalando Java SDK
sudo apt install default-jdk default-jre -y

echo -e "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games\" \nJAVA_HOME=\"/usr/lib/jvm/default-java\"" > /etc/environment

# Instalação para Desenvolviemnto Android
sudo apt install adb libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y 

# Baixando Android Studio
cd /opt
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/3.6.3.0/android-studio-ide-192.6392135-linux.tar.gz
tar xfz android-studio-ide-192.6392135-linux.tar.gz
rm android-studio-ide-192.6392135-linux.tar.gz

sudo echo -e "\n[Desktop Entry] \nEncoding=UTF-8 \nName=Android Studio \nComment=IDE Developement Android \nExec=/opt/android-studio/bin/studio.sh \nIcon=/opt/android-studio/bin/studio.png \nTerminal=false \nType=Application \nCategories=Application;Development; \nStartupNotify=true" > /usr/share/applications/android-studio.desktop
cp /usr/share/applications/android-studio.desktop ~/Área\ de\ Trabalho/
cp /usr/share/applications/android-studio.desktop ~/Desktop

# Removendo Firefox e Instalando o Brave e Chrome
sudo apt remove firefox thunderbird --purge -y
sudo apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#Instalar PlayOnLinux
cd /opt
wget wget https://www.playonlinux.com/script_files/PlayOnLinux/4.3.4/PlayOnLinux_4.3.4.tar.gz -O playonlinux2019.tar.gz
tar -zxf playonlinux2019.tar.gz
./playonlinux/playonlinux   
sudo ln -sf /opt/playonlinux/playonlinux /usr/bin/playonlinux
echo -e ‘[Desktop Entry]\n Version=1.0\n Name=playonlinux\n Exec=/opt/playonlinux/playonlinux\n Icon=/opt/playonlinux/resources/images/configure/winecfg.png\n Type=Application\n Categories=Application’ | sudo tee /usr/share/applications/playonlinux.desktop
cp /usr/share/applications/playonlinux.desktop ~/Área\ de\ Trabalho/
cp /usr/share/applications/playonlinux.desktop ~/Desktop
rm /opt/playonlinux2019.tar.gz

#Realm Studio
wget https://studio-releases.realm.io/latest/download/linux-appimage
sudo chmod 777 /opt/linux-appimage
sudo mkdir /opt/realm-studio  
sudo mv /opt/linux-appimage /opt/realm-studio/realm-studio.sh

sudo echo -e "\n[Desktop Entry] \nEncoding=UTF-8 \nName=Realm Studio \nComment=IDE Developement Realm Database \nExec=/opt/realm-studio/realm-studio.sh \nTerminal=false \nType=Application \nCategories=Application;Development; \nStartupNotify=true" > /usr/share/applications/realm-studio.desktop
cp /usr/share/applications/realm-studio.desktop ~/Área\ de\ Trabalho/
cp /usr/share/applications/realm-studio.desktop ~/Desktop

# Atualizando o Sistema Operacional
chown -R 1000:1000 ~/Área\ de\ Trabalho/*
chown -R 1000:1000 ~/Desktop*
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove
sudo apt -f install && sudo dpkg --configure -a
sudo apt clean

sudo reboot
