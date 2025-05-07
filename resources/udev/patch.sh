#! /bin/sh

sudo cp /usr/lib/udev/rules.d/60-persistent-storage.rules /etc/udev/rules.d/;
sudo patch -p1 < udev_external_usb3_optical_drive.diff /etc/udev/rules.d/60-persistent-storage.rules;
exit
