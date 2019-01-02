#!/bin/sh
clear
echo Check Update.....
ping -w 1 -c 1 127.0.0.1
clear
echo Check Update....
ping -w 1 -c 1 127.0.0.1
clear
echo Check Update..
ping -w 1 -c 1 127.0.0.1
clear
echo Check Update.
ping -w 1 -c 1 127.0.0.1
sudo apt-get update && sudo apt-get -y upgrade
clear
echo Telechargement des Library Minecrsat..
ping -w 1 -c 1 127.0.0.1
sudo apt-get -y install xcompmgr libgl1-mesa-dri && sudo apt-get -y install libalut0 libalut-dev && sudo apt-get -y install mesa-utils
clear
echo This will start the config utility. Select 'Advanced Options', then select 'GL Driver', then select 'Enable' (latest utility requires selection of 'GL (Full KMS)' ), then select 'Yes' to reboot and enable the driver.
ping -w 2 -c 1 127.0.0.1
echo Installation de raspi-gpio
ping -w 2 -c 1 127.0.0.1
sudo apt-get install raspi-gpio
clear
echo Installation de xcompmgr libgl1-mesa-dri
ping -w 2 -c 1 127.0.0.1
sudo apt-get install xcompmgr libgl1-mesa-dri
clear
echo Configuration des perfomance overclock to hight
ping -w 1 -c 1 127.0.0.1
Set overclock to High(1000)
clear
echo Configuration des perfomance GPU memory to 512
ping -w 1 -c 1 127.0.0.1
Set GPU memory to 512Mb
clear
echo Installation de mesa-utils
ping -w 2 -c 1 127.0.0.1
sudo apt-get install mesa-utils
clear
echo Installation de libalut0 libalut-dev
ping -w 2 -c 1 127.0.0.1
sudo apt-get install libalut0 libalut-dev
clear


sudo raspi-config
glxgears
clear
echo Telechargement de Minecraft.jar
ping -w 2 -c 1 127.0.0.1
mkdir ~/Minecraft; mkdir ~/Minecraft/Natives; cd ~/Minecraft && wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
java -jar Minecraft.jar
clear
echo Copy des libraries...
ping -w 1 -c 1 127.0.0.1
cd ~/Minecraft/Natives && wget https://www.dropbox.com/s/4oxcvz3ky7a3x6f/liblwjgl.so && wget https://www.dropbox.com/s/m0r8e01jg2og36z/libopenal.so
clear
echo Update lwjgl 
ping -w 1 -c 1 127.0.0.1
cd ~/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209 && rm lwjgl-2.9.4-nightly-20150209.jar; wget https://www.dropbox.com/s/mj15sz3bub4dmr6/lwjgl-2.9.4-nightly-20150209.jar
clear
echo Update lwjgl 
ping -w 2 -c 1 127.0.0.1
cd ~/Minecraft/ && wget https://www.dropbox.com/s/jkhr58apwa7pt1w/run.sh && sudo chmod +x run.sh
