#!/bin/bash

# 1. 默认 IP 修改为 192.168.1.1
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 2. 注入极致稳定的 NSS 与核心插件配置
cat >> .config <<EOF
# 硬件型号定义
CONFIG_TARGET_ipq60xx=y
CONFIG_TARGET_ipq60xx_generic=y
CONFIG_TARGET_ipq60xx_generic_DEVICE_jdcloud_re-ss-01=y

# 强制开启 5.15 内核稳定性组件
CONFIG_LINUX_5_15=y
CONFIG_PACKAGE_kmod-qca-nss-drv=y
CONFIG_PACKAGE_kmod-qca-nss-ecm=y
CONFIG_PACKAGE_kmod-qca-nss-ecm-standard=y
CONFIG_PACKAGE_kmod-qca-nss-drv-pppoe=y
CONFIG_PACKAGE_kmod-qca-nss-drv-ipv6=y

# 需求清单：CAKE, SmartDNS, PBR
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-pbr=y
CONFIG_PACKAGE_ipv6helper=y
EOF

# 3. 极致稳定优化：关闭内核调试，减少崩溃概率
sed -i 's/CONFIG_KERNEL_KALLSYMS=y/CONFIG_KERNEL_KALLSYMS=n/' .config
