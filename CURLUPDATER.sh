#!/bin/sh
curl https://get.pimoroni.com/uptodate | bash
curl https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update | bash

sudo apt-get update
sudo apt-get upgrade
sudo reboot
