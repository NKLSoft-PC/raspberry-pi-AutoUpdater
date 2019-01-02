#!/bin/sh
sudo apt-get update
clear
echo Installation de synaptic en cours...
ping -w 2 -c 1 127.0.0.1
sudo apt-get install synaptic
clear
echo Lancemant de aptitude en cours...
ping -w 2 -c 1 127.0.0.1
sudo aptitude
clear
echo Lancemant de synaptic en cours...
ping -w 2 -c 1 127.0.0.1
sudo synaptic
