#!/bin/bash

# Atualizando o Sistema Operacional
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove
sudo apt clean

# Aplicativos básicos
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

echo -e "\n[Desktop Entry] \nEncoding=UTF-8 \nName=Android Studio \nComment=IDE Developement Android \nExec=/opt/android-studio/bin/studio.sh \nIcon=/opt/android-studio/bin/studio.png \nTerminal=false \nType=Application \nCategories=Application;Development; \nStartupNotify=true" > /usr/share/applications/android-studio.desktop

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
sudo chmod +x /usr/share/applications/playonlinux.desktop
cp /usr/share/applications/playonlinux.desktop ~/Área\ de\ Trabalho/
cp /usr/share/applications/playonlinux.desktop ~/Desktop
