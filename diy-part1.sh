#!/bin/bash
# OpenWrt DIY script part 1 (Before Update feeds)

# 默认 IP 修改
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 注入自定义 .config
cat >> .config <<EOF
# Custom packages already included in .config
EOF