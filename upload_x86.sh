#!/bin/bash

FIRMWARE=openwrt-x86-64-generic-squashfs-combined.img
FM_PATH=x86_64/bin/targets/x86/64/$FIRMWARE
REMOTE_PATH=/var/www/html/h5ai/OpenWRT/x86_64
FM_NAME=`date +%Y-%m-%d`-$FIRMWARE

rm -rf $FM_NAME
rm -rf $FM_NAME.gz

cp $FM_PATH $FM_NAME
gzip $FM_NAME

echo "scp $FM_NAME.gz uniteyun:$REMOTE_PATH"
scp $FM_NAME.gz uniteyun:$REMOTE_PATH

rm -rf $FM_NAME
rm -rf $FM_NAME.gz

