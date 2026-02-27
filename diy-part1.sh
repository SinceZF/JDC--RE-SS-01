#!/bin/bash
# OpenWrt DIY Part 1 - Before update feeds

# Add feeds
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Default IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# Set timezone
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate