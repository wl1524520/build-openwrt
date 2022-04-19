#!/bin/bash

FIRMWARE=openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz
FM_PATH=r4s/bin/targets/rockchip/armv8/$FIRMWARE
REMOTE_PATH=/var/www/html/h5ai/OpenWRT/R4S
FM_NAME=`date +%Y-%m-%d`-$FIRMWARE

rm -rf $FM_NAME

cp $FM_PATH $FM_NAME

echo "scp $FM_NAME uniteyun:$REMOTE_PATH"
scp $FM_NAME uniteyun:$REMOTE_PATH

rm -rf $FM_NAME

