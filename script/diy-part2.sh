#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的192.168.123.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把MSG1500修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/MSG1500/g' package/base-files/files/bin/config_generate

# 修改开源驱动wifi名称
#sed -i 's/OpenWrt/RAISECOM-MSG1500-$/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改闭源驱动2G wifi名称
sed -i 's/OpenWrt/RAISECOM-MSG1500-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.1.2G.dat
#sed -i 's/OpenWrt/RAISECOM-MSG1500-$/g' package/lean/MTK7615-DBDC-LINUX5.4/drivers/mt_wifi/files/mt7615.1.2G.dat
sed -i 's/OpenWrt/RAISECOM-MSG1500-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.2G.dat
sed -i 's/OpenWRT-2.4G/MSG1500_2.4G/g' package/lean/mt/drivers/mt7615d/files/lib/wifi/mt_dbdc.sh

# 修改闭源驱动5G wifi名称
sed -i 's/OpenWrt_5G/RAISECOM-MSG1500-5G-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.1.5G.dat
#sed -i 's/OpenWrt_5G/RAISECOM-MSG1500-5G-$/g' package/lean/MTK7615-DBDC-LINUX5.4/drivers/mt_wifi/files/mt7615.1.5G.dat
sed -i 's/OpenWrt_5G/RAISECOM-MSG1500-5G-$/g' package/lean/mt/drivers/mt_wifi/files/mt7615.5G.dat
sed -i 's/OpenWRT-5G/MSG1500_5G/g' package/lean/mt/drivers/mt7615d/files/lib/wifi/mt_dbdc.sh

# 添加个性信息
#sed -i 's/R22.8.2/R22.8.2 by nanchuci/g' package/lean/default-settings/files/zzz-default-settings

# 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
#rm -rf ./package/base-files/files/etc/banne && cd .. && cp -f ./banner openwrt/package/base-files/files/etc/ && cd openwrt

# 更改时区
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# 01_leds
#patch -p1 -i ../patches/01_leds.patch

# mt7621.mk
#patch -p1 -i ../patches/mt7621.mk.patch

# set-irq-affinity
#patch -p1 -i ../patches/set-irq-affinity.patch

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
#git clone --depth=1 https://github.com/Lienol/openwrt-package

# Add luci-app-eqos
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-eqos

# Add dnsfilter
#git clone --depth=1 https://github.com/garypang13/luci-app-dnsfilter

# Add luci-app-passwall
#sed -i 's#GO_PKG_TARGET_VARS.*# #g' feeds/packages/utils/v2dat/Makefile
#git clone --depth=1 https://github.com/kenzok8/small

# Add luci-app-vssr <M>
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
#git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
#git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
#git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add lua-ipops
#svn co https://github.com/x-wrt/com.x-wrt/trunk/lua-ipops

# Add luci-app-natflow-users
#svn co https://github.com/x-wrt/com.x-wrt/trunk/luci-app-natflow-users

# Add natflow
#svn co https://github.com/x-wrt/com.x-wrt/trunk/natflow

# Add iptvhelper & luci-app-iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/iptvhelper
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-iptvhelper

# Add luci-app-pushbot
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-pushbot

# Add luci-app-nat6-helper
git clone --depth=1 https://github.com/Ausaci/luci-app-nat6-helper

# Add luci-theme-argon
#cd lede/package/lean
#rm -rf luci-theme-argon 
#git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

# Add luci-theme-rosy
#git clone --depth=1 -b openwrt-18.06 https://github.com/shiyu1314/luci-theme-rosy
#rm -rf ../lean/luci-theme-rosy

# Add tmate
git clone --depth=1 https://github.com/project-openwrt/openwrt-tmate

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-udptools
#git clone --depth=1 https://github.com/zcy85611/openwrt-luci-kcp-udp

# Add OpenAppFilter
#git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-app-oled (R2S Only)
#git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add driver for rtl8821cu & rtl8812au-ac
#svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/rtl8812au-ac
#svn co https://github.com/project-openwrt/openwrt/branches/master/package/ctcgfw/rtl8821cu
#popd

# Add netdata
#rm -rf ../lean/netdata
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata

# luci-app-netdata
#rm -rf ../lean/luci-app-netdata
#git clone --depth=1 https://github.com/sirpdboy/luci-app-netdata

# Mod zzz-default-settings
#pushd package/lean/default-settings/files
#sed -i '/http/d' zzz-default-settings
#export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
#sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
#popd

# Fix libssh
#pushd feeds/packages/libs
#rm -rf libssh
#svn co https://github.com/openwrt/packages/trunk/libs/libssh
#popd

# Use Lienol's https-dns-proxy package
#pushd feeds/packages/net
#rm -rf https-dns-proxy
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
#popd

# Use snapshots syncthing package
#pushd feeds/packages/utils
#rm -rf syncthing
#svn co https://github.com/openwrt/packages/trunk/utils/syncthing
#popd

# Fix mt76 wireless driver
#pushd package/kernel/mt76
#sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
#popd

# Add po2lmo
#git clone https://github.com/openwrt-dev/po2lmo.git
#pushd po2lmo
#make && sudo make install
#popd

#添加smartdns
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
