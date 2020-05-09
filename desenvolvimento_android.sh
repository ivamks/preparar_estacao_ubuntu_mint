#!/bin/bash

# Atualizando o Sistema Operacional
apt update
apt full-upgrade -y
apt autoremove
apt clean

# Aplicativos básicos
apt install openssh-server evolution skypeforlinux vlc gimp obs-studio zoom-player whatsapp-desktop telegram-desktop -y 

#Instalando Java SDK
apt install default-jdk default-jre -y

echo -e "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games\" \nJAVA_HOME=\"/usr/lib/jvm/default-java\"" > /etc/environment

# Instalação para Desenvolviemnto Android
apt install adb libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 -y 

# Baixando Android Studio
cd /opt
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/3.6.3.0/android-studio-ide-192.6392135-linux.tar.gz
tar xfz android-studio-ide-192.6392135-linux.tar.gz
rm android-studio-ide-192.6392135-linux.tar.gz

echo -e "\n[Desktop Entry] \nEncoding=UTF-8 \nName=Android Studio \nComment=IDE Developement Android \nExec=/opt/android-studio/bin/studio.sh \nIcon=/opt/android-studio/bin/studio.png \nTerminal=false \nType=Application \nCategories=Application;Development; \nStartupNotify=true" > /usr/share/applications/android-studio.desktop

# Removendo Firefox e Instalando o Brave e Chrome
apt remove firefox thunderbird --purge -y
apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y
