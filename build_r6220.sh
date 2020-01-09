#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DEVICE_NAME='openwrt-imagebuilder-ramips-mt7621.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DEVICE_NAME}

PK_VPN="luci-app-openvpn-server luci-i18n-openvpn-server-zh-cn"
PK_THEME="luci-theme-netgear"
#PK_ADD="luci-app-dnspod luci-i18n-wol-zh-cn"
PK_WPAD="-wpad-basic wpad-openssl"
PK_LANG="luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn luci-i18n-smartdns-zh-cn luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn luci-i18n-ramfree-zh-cn luci-i18n-upnp-zh-cn luci-i18n-flowoffload-zh-cn"
PK_ADD="luci-mod-rpc smartdns luci-app-smartdns luci-app-firewall luci-app-frpc luci-app-flowoffload luci-app-ramfree luci-app-sqm luci-app-upnp luci-app-arpbind luci-app-autoreboot bind-dig"
PK_DEL="-automount -luci-app-accesscontrol -luci-app-adbyby-plus -luci-app-ddns -luci-app-filetransfer -luci-app-flowoffload -luci-app-ipsec-vpnd -luci-app-nlbwmon -luci-app-pptp-server -luci-app-ssr-plus -luci-app-vlmcsd -luci-app-vsftpd -luci-app-wol -luci-app-xlnetacc -luci-app-zerotier -block-mount -luci-app-sfe -opkg"

make image PROFILE="netgear_r6220" PACKAGES="${PK_ADD} ${PK_LANG} ${PK_WPAD} ${PK_THEME} ${PK_DEL}" FILES=../files/wndr3800/

cd ${IMG_BUILD_PATH}

IMG_FILE_PATH="./${DIST_DEVICE_NAME}/bin/targets/ramips/mt7621"

# copy sysupgrade file to home dir
IMG_FILE_NAME='openwrt-ramips-mt7621-netgear_r6220-squashfs-sysupgrade.bin'
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
if [ ! -f ${IMG_PATHNAME} ]; then
    exit -1
fi

DEST_FILENAME=`date +%Y-%m-%d`-${IMG_FILE_NAME}

if [ -f ${HOME}/${DEST_FILENAME} ]; then
    echo "rm -rf ${HOME}/${DEST_FILENAME}"
    rm -rf ${HOME}/${DEST_FILENAME}
fi

echo "cp ${IMG_PATHNAME} ${HOME}/${DEST_FILENAME}"
cp ${IMG_PATHNAME} ${HOME}/${DEST_FILENAME}

# copy factory image file to home dir
IMG_FILE_NAME='openwrt-ramips-mt7621-netgear_r6220-squashfs-factory.img'
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
if [ ! -f ${IMG_PATHNAME} ]; then
    exit -1
fi

DEST_FILENAME=`date +%Y-%m-%d`-${IMG_FILE_NAME}

if [ -f ${HOME}/${DEST_FILENAME} ]; then
    echo "rm -rf ${HOME}/${DEST_FILENAME}"
    rm -rf ${HOME}/${DEST_FILENAME}
fi

echo "cp ${IMG_PATHNAME} ${HOME}/${DEST_FILENAME}"
cp ${IMG_PATHNAME} ${HOME}/${DEST_FILENAME}

