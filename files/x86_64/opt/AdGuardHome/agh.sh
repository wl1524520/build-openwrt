#!/bin/sh

# nohup /opt/AdGuardHome/AdGuardHome -w /opt/AdGuardHome -c /etc/config/AdGuardHome.yaml > /tmp/adguardhome.log 2>&1 &
nohup /opt/AdGuardHome/AdGuardHome -w /opt/AdGuardHome > /tmp/adguardhome.log 2>&1 &

