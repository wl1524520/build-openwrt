#!/bin/bash

IMG_BUILD_PATH=$PWD
DIST_DIR_NAME='openwrt-imagebuilder-x86-64.Linux-x86_64'

cd ${IMG_BUILD_PATH}/${DIST_DIR_NAME}
rm -rf bin

PKG="base-files dropbear fstools libc libgcc libustream-openssl logd mtd netifd opkg uci uclient-fetch urandom-seed busybox procd partx-utils mkf2fs e2fsprogs kmod-button-hotplug kmod-usb-hid kmod-mmc kmod-sdhci usbutils pciutils kmod-alx kmod-e1000e kmod-igb kmod-igc kmod-igbvf kmod-iavf kmod-bnx2x kmod-pcnet32 kmod-tulip kmod-via-velocity kmod-vmxnet3 kmod-i40e kmod-i40evf kmod-r8125 kmod-8139cp kmod-8139too kmod-fs-f2fs cfdisk htop lm-sensors autocore-x86 -automount -autosamba -luci-app-adbyby-plus -luci-app-ipsec-vpnd luci-proto-bonding luci-app-unblockmusic luci-app-zerotier -luci-app-xlnetacc ddns-scripts_aliyun ddns-scripts_dnspod ca-bundle luci-app-wireguard luci-app-ttyd -kmod-sound-hda-core -kmod-sound-hda-codec-realtek -kmod-sound-hda-codec-via -kmod-sound-via82xx -kmod-sound-hda-intel -kmod-sound-hda-codec-hdmi -kmod-sound-i8x0 -kmod-usb-audio -kmod-usb-net -kmod-usb-net-asix-ax88179 -kmod-usb-net-rtl8150 -kmod-usb-net-rtl8152-vendor kmod-mlx4-core kmod-mlx5-core kmod-drm-i915 dnsmasq-full firewall iptables ppp ppp-mod-pppoe block-mount coremark kmod-nf-nathelper kmod-nf-nathelper-extra kmod-ipt-raw kmod-tun iptables-mod-tproxy iptables-mod-extra ipset ip-full default-settings luci luci-newapi ddns-scripts_aliyun ddns-scripts_dnspod luci-app-ddns luci-app-upnp luci-app-autoreboot luci-app-arpbind -luci-app-filetransfer -luci-app-vsftpd luci-app-ssr-plus -luci-app-vlmcsd -luci-app-accesscontrol -luci-app-nlbwmon luci-app-turboacc luci-app-wol curl ca-certificates"
PKG_THEME="luci-theme-argon luci-theme-darkmatter luci-theme-material luci-theme-netgear"
PKG_LANG="luci-i18n-base-zh-cn luci-i18n-arpbind-zh-cn luci-i18n-autoreboot-zh-cn luci-i18n-bonding-zh-cn luci-i18n-ddns-zh-cn -luci-i18n-filetransfer-zh-cn luci-i18n-firewall-zh-cn -luci-i18n-frpc-zh-cn -luci-i18n-openvpn-server-zh-cn luci-i18n-socat-zh-cn luci-i18n-ssr-plus-zh-cn luci-i18n-ttyd-zh-cn luci-i18n-turboacc-zh-cn luci-i18n-unblockmusic-zh-cn luci-i18n-upnp-zh-cn luci-i18n-wireguard-zh-cn luci-i18n-wol-zh-cn luci-i18n-zerotier-zh-cn"

make image PACKAGES="${PKG} ${PKG_THEME} ${PKG_LANG}" FILES=../x86_files
# FILES_REMOVE="/usr/bin/UnblockNeteaseMusic /usr/bin/node"

rm -rf ~/openwrt-x86-64-generic-squashfs-combined.img.gz
cp bin/targets/x86/64/openwrt-x86-64-generic-squashfs-combined.img.gz ~

cd ${IMG_BUILD_PATH}
