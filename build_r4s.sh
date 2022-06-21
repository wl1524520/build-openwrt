#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DEVICE_NAME='openwrt-imagebuilder-rockchip-armv8.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DEVICE_NAME}
rm -rf bin

PKG="base-files dropbear fstools libc libgcc libustream-openssl logd mtd netifd opkg uci uclient-fetch urandom-seed busybox procd uboot-envtools partx-utils e2fsprogs mkf2fs kmod-gpio-button-hotplug -automount autocore-arm -autosamba fdisk cfdisk e2fsprogs ethtool haveged htop luci-app-zerotier -luci-app-ipsec-vpnd wpad-openssl kmod-mt76x2u usbutils dnsmasq-full firewall iptables ppp ppp-mod-pppoe -block-mount coremark kmod-nf-nathelper kmod-nf-nathelper-extra kmod-ipt-raw kmod-tun iptables-mod-tproxy iptables-mod-extra ipset ip-full default-settings luci luci-newapi ddns-scripts_aliyun ddns-scripts_dnspod luci-app-ddns luci-app-upnp luci-app-autoreboot luci-app-arpbind -luci-app-filetransfer -luci-app-vsftpd luci-app-ssr-plus -luci-app-vlmcsd -luci-app-accesscontrol -luci-app-nlbwmon luci-app-turboacc luci-app-wol curl ca-certificates kmod-r8168 -urngd ipv6helper iperf3 luci-app-socat luci-app-frpc luci-app-ttyd"
PKG_THEME="luci-theme-netgear luci-theme-darkmatter"
PKG_LANG="luci-i18n-base-zh-cn luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn luci-i18n-ddns-zh-cn -luci-i18n-filetransfer-zh-cn luci-i18n-firewall-zh-cn luci-i18n-frpc-zh-cn -luci-i18n-openvpn-server-zh-cn luci-i18n-socat-zh-cn luci-i18n-ssr-plus-zh-cn luci-i18n-ttyd-zh-cn luci-i18n-turboacc-zh-cn luci-i18n-upnp-zh-cn luci-i18n-wol-zh-cn luci-i18n-zerotier-zh-cn"

make image PROFILE="friendlyarm_nanopi-r4s" PACKAGES="${PKG} ${PKG_LANG} ${PKG_THEME}" FILES=../r4s_files/

cd ${IMG_BUILD_PATH}

IMG_FILE_PATH="./${DIST_DEVICE_NAME}/bin/targets/rockchip/armv8"
IMG_FILE_NAME='openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-squashfs-sysupgrade.img.gz'
rm -rf ~/${IMG_FILE_NAME}
IMG_PATHNAME=${IMG_FILE_PATH}/${IMG_FILE_NAME}
cp $IMG_PATHNAME ~

