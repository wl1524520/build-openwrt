#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DEVICE_NAME='openwrt-imagebuilder-ar71xx-generic.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DEVICE_NAME}

cp ../smartdns/luci-app-smartdns.1.2019.11.02-1102.all-luci-all.ipk packages
cp ../smartdns/smartdns.1.2019.11.02-1102.mips-openwrt-all.ipk packages

PK_VPN="luci-app-openvpn-server luci-i18n-openvpn-server-zh-cn"
PK_THEME="luci-theme-netgear luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn"
#PK_ADD="luci-app-dnspod luci-i18n-wol-zh-cn"
PK_ADD="smartdns luci-app-smartdns luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn luci-i18n-ramfree-zh-cn luci-i18n-upnp-zh-cn"
PK_DEL="-automount -luci-app-accesscontrol -luci-app-adbyby-plus -luci-app-ddns -luci-app-filetransfer -luci-app-flowoffload -luci-app-ipsec-vpnd -luci-app-nlbwmon -luci-app-pptp-server -luci-app-ssr-plus -luci-app-vlmcsd -luci-app-vsftpd -luci-app-wol -luci-app-xlnetacc -luci-app-zerotier"

# make image PACKAGES="${PK_ADD} ${PK_THEME} ${PK_VPN} ${PK_DEL}"
# make image PACKAGES="${PK_ADD} ${PK_THEME} ${PK_VPN} ${PK_DEL} ${PK_DEL_FM}" FILES=../files/
make image PROFILE="wndr3800" PACKAGES="${PK_ADD} ${PK_THEME} ${PK_DEL}"

cd ${IMG_BUILD_PATH}

IMG_FILE_PATH="./${DIST_DEVICE_NAME}/bin/targets/ar71xx/generic"
IMG_FILE_NAME='openwrt-ar71xx-generic-wndr3800-squashfs-sysupgrade.bin'
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
