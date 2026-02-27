#!/bin/bash
# DIY Part 1 (Before Update feeds)

# 注入 feed
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 注入硬件型号和核心插件（覆盖 .config）
cat >> .config <<EOF
CONFIG_TARGET_ipq60xx=y
CONFIG_TARGET_ipq60xx_generic=y
CONFIG_TARGET_ipq60xx_generic_DEVICE_jdcloud_re-ss-01=y

CONFIG_LINUX_5_15=y
CONFIG_PACKAGE_kmod-qca-nss-drv=y
CONFIG_PACKAGE_kmod-qca-nss-ecm=y
CONFIG_PACKAGE_kmod-qca-nss-ecm-standard=y
CONFIG_PACKAGE_kmod-qca-nss-drv-pppoe=y
CONFIG_PACKAGE_kmod-qca-nss-drv-ipv6=y

CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-app-opkg=y
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-pbr=y
CONFIG_PACKAGE_ipv6helper=y

CONFIG_KERNEL_KALLSYMS=n
EOF