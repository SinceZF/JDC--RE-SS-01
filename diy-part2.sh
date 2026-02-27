#!/bin/bash
# OpenWrt DIY script part 2 (After Update feeds)

# 设置 AdGuardHome 和 adbyby-plus 开机自启
cat >> package/emortal/default-settings/files/zzz-default-settings <<EOF
/etc/init.d/adbyby_plus enable
/etc/init.d/adguardhome enable
EOF