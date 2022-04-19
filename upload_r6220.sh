#!/bin/bash

FW_IMG=openwrt-ramips-mt7621-netgear_r6220-squashfs-factory.img
FW_BIN=openwrt-ramips-mt7621-netgear_r6220-squashfs-sysupgrade.bin
FW_KERNEL=openwrt-ramips-mt7621-netgear_r6220-squashfs-kernel.bin
FW_ROOTFS=openwrt-ramips-mt7621-netgear_r6220-squashfs-rootfs.bin
FW_PATH=r6220/bin/targets/ramips/mt7621
REMOTE_PATH=/var/www/html/h5ai/OpenWRT/R6220
DATE_STAMP=`date +%Y-%m-%d`

echo "scp $FW_PATH/$FW_IMG uniteyun:$REMOTE_PATH/$DATE_STAMP-$FW_IMG"
scp $FW_PATH/$FW_IMG uniteyun:$REMOTE_PATH/$DATE_STAMP-$FW_IMG

echo "scp $FW_PATH/$FW_BIN uniteyun:$REMOTE_PATH/$DATE_STAMP-$FW_BIN"
scp $FW_PATH/$FW_BIN uniteyun:$REMOTE_PATH/$DATE_STAMP-$FW_BIN

cp $FW_PATH/$FW_KERNEL .
cp $FW_PATH/$FW_ROOTFS .
FW_BREED=openwrt-ramips-mt7621-netgear_r6220-squashfs-breed.zip
zip $FW_BREED $FW_KERNEL $FW_ROOTFS
scp $FW_BREED uniteyun:$REMOTE_PATH/$DATE_STAMP-$FW_BREED

rm -f $FW_KERNEL $FW_ROOTFS $FW_BREED
