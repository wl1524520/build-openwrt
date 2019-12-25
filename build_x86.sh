#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DIR_NAME='openwrt-imagebuilder-x86-64.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DIR_NAME}

PK_VPN="luci-app-openvpn-server luci-i18n-openvpn-server-zh-cn"
PK_THEME="luci-theme-bootstrap luci-theme-netgear luci-theme-argon luci-theme-material luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"
# PK_DDNS="-luci-app-ddns -luci-i18n-ddns-zh-cn -ddns-scripts_aliyun -ddns-scripts_dnspod luci-app-dnspod"
PK_DDNS="luci-app-ddns luci-i18n-ddns-zh-cn luci-app-dnspod"
PK_ADD="luci-mod-rpc smartdns luci-app-smartdns luci-i18n-smartdns-zh-cn luci-app-frpc luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn luci-i18n-flowoffload-zh-cn luci-i18n-nlbwmon-zh-cn luci-i18n-ramfree-zh-cn luci-i18n-upnp-zh-cn luci-i18n-wol-zh-cn coreutils-nohup"
PK_DEL=" -alsa-utils -automount -autosamba -block-mount -kmod-8139cp -kmod-8139too -kmod-r8125 -kmod-ac97 -kmod-ath10k -kmod-ath5k -kmod-ath9k -kmod-ath9k-htc -kmod-rt2800-usb -kmod-sound-hda-codec-realtek -kmod-sound-hda-codec-via -kmod-sound-hda-core -kmod-sound-via82xx -kmod-usb-audio -kmod-usb-net -kmod-usb-net-asix -kmod-usb-net-asix-ax88179 -kmod-usb-net-rtl8150 -kmod-usb-net-rtl8152 -luci-app-accesscontrol -luci-app-adbyby-plus -luci-app-filetransfer -luci-app-ipsec-vpnd -luci-app-pptp-server -luci-app-sfe -luci-app-transmission -luci-app-v2ray-server -luci-app-vlmcsd -luci-app-vsftpd -luci-app-xlnetacc -luci-app-zerotier -wpad -luci-app-qbittorrent"
PK_DEL_FM="-ath10k-firmware-qca988x -ath10k-firmware-qca9888 -ath10k-firmware-qca9984"

make image PACKAGES="${PK_ADD} ${PK_DDNS} ${PK_THEME} ${PK_VPN} ${PK_DEL} ${PK_DEL_FM}" FILES=../files/x86_64/

cd ${IMG_BUILD_PATH}

IMG_FILE_PATH="./${DIST_DIR_NAME}/bin/targets/x86/64"
IMG_FILE_NAME='openwrt-x86-64-combined-squashfs.img'
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
if [ ! -f ./${IMG_PATHNAME} ]; then
    exit -1
fi

DEST_FILENAME=`date +%Y-%m-%d`-${IMG_FILE_NAME}

if [ -f ./${DEST_FILENAME} ]; then
    echo "rm -rf ./${DEST_FILENAME}"
    rm -rf ./${DEST_FILENAME}
fi

echo "cp ${IMG_PATHNAME} ${DEST_FILENAME}"
cp ${IMG_PATHNAME} ${DEST_FILENAME}

echo "gzip ${DEST_FILENAME}"
gzip ${DEST_FILENAME}

if [ -f ${HOME}/${DEST_FILENAME}.gz ]; then
    echo "rm -rf ${HOME}/${DEST_FILENAME}.gz"
    rm -rf ${HOME}/${DEST_FILENAME}.gz
fi

echo "mv ${DEST_FILENAME}.gz ${HOME}"
mv ${DEST_FILENAME}.gz ${HOME}

