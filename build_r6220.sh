#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DEVICE_NAME='openwrt-imagebuilder-ramips-mt7621.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DEVICE_NAME}
rm -rf bin

PKG="-luci-app-ddns -ddns-scripts_aliyun -ddns-scripts_dnspod -luci-app-accesscontrol luci-app-arpbind luci-app-autoreboot -luci-app-filetransfer -luci-app-nlbwmon -luci-app-ssr-plus luci-app-turboacc -luci-app-upnp -luci-app-vlmcsd -luci-app-vsftpd -luci-app-wol -opkg luci-app-zerotier -luci-app-ttyd -luci-app-socat -kmod-usb3"
PKG_THEME="luci-theme-netgear"
PKG_LANG="luci-i18n-base-zh-cn luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn -luci-i18n-ddns-zh-cn -luci-i18n-filetransfer-zh-cn luci-i18n-firewall-zh-cn -luci-i18n-frpc-zh-cn -luci-i18n-openvpn-server-zh-cn -luci-i18n-socat-zh-cn -luci-i18n-ssr-plus-zh-cn -luci-i18n-ttyd-zh-cn luci-i18n-turboacc-zh-cn -luci-i18n-upnp-zh-cn -luci-i18n-wol-zh-cn luci-i18n-zerotier-zh-cn"

make image PROFILE="netgear_r6220" PACKAGES="${PKG} ${PKG_LANG} ${PKG_THEME}" FILES=../r6220_files/

cd ${IMG_BUILD_PATH}

IMG_FILE_PATH="./${DIST_DEVICE_NAME}/bin/targets/ramips/mt7621"
# bin/targets/ramips/mt7621/openwrt-ramips-mt7621-netgear_r6220-squashfs-sysupgrade.bin

# copy sysupgrade file to home dir
IMG_FILE_NAME='openwrt-ramips-mt7621-netgear_r6220-squashfs-sysupgrade.bin'
rm -rf ~/${IMG_FILE_NAME}
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
cp $IMG_PATHNAME ~

DEST_FILENAME=`date +%Y-%m-%d`-${IMG_FILE_NAME}
IMG_FILE_NAME='openwrt-ramips-mt7621-netgear_r6220-squashfs-factory.img'
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
DEST_FILENAME=`date +%Y-%m-%d`-${IMG_FILE_NAME}

