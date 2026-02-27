#!/bin/bash
# OpenWrt DIY Part 2 - After feeds update

# Inject custom .config for RE-SS-01
cat >> .config <<EOF
# Enable hardware NSS
CONFIG_PACKAGE_kmod-qca-nss-drv=y
CONFIG_PACKAGE_kmod-qca-nss-ecm=y
CONFIG_PACKAGE_kmod-qca-nss-drv-pppoe=y
CONFIG_PACKAGE_kmod-qca-nss-drv-ipv6=y

# LuCI Bootstrap
CONFIG_PACKAGE_luci-theme-bootstrap=y

# Ad Blocking
CONFIG_PACKAGE_adbyby-plus=y
CONFIG_PACKAGE_adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_luci-app-pbr=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_luci-app-turboacc=y
EOF