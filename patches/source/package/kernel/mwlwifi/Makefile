#
# Copyright (C) 2014-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mwlwifi
PKG_VERSION:=10.3.8.0.git-2018-06-20
PKG_RELEASE=1

PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=

# i changed to use the original Kaloz
# cat /sys/kernel/debug/ieee80211/phy1/mwlwifi/info && cat /sys/kernel/debug/ieee80211/phy0/mwlwifi/info
# ll /rom/lib/firmware/mwlwifi/ && ll /lib/firmware/mwlwifi/
# have to keep in PKG_MIRROR_HASH
# cp -avr /build/patches/source /build
# make package/kernel/mwlwifi/download V=s
# make package/kernel/mwlwifi/check FIXUP=1 V=s
# cat package/kernel/mwlwifi/Makefile | less
# make package/kernel/mwlwifi/{clean,prepare,compile} package/index V=s
# for the package/kernel/mwlwifi/patches must be remove rm -rf package/kernel/mwlwifi/patches
PKG_SOURCE_URL:=https://github.com/kaloz/mwlwifi
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=c2f82f1ac18ed7fb48be1eb8d678a3cf32192069
PKG_MIRROR_HASH:=788396121638e19acec06ddf22b3cd45f10da39cb000e41ffb58b1e863da6169

PKG_MAINTAINER:=Imre Kaloz <kaloz@openwrt.org> and Patrik Laszlo <alabard@gmail.com>
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/mwlwifi
  SUBMENU:=Wireless Drivers
  TITLE:=Marvell 88W8864 wireless driver
  DEPENDS:=+kmod-mac80211 +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT +@DRIVER_11W_SUPPORT @PCI_SUPPORT @TARGET_mvebu
  FILES:=$(PKG_BUILD_DIR)/mwlwifi.ko
  AUTOLOAD:=$(call AutoLoad,50,mac80211 mwlwifi)
endef

NOSTDINC_FLAGS = \
	-I$(PKG_BUILD_DIR) \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-include backport/backport.h

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

define KernelPackage/mwlwifi/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DIR) $(1)/lib/firmware/mwlwifi
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8864.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8897.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/88W8964.bin $(1)/lib/firmware/mwlwifi/
	$(CP) $(PKG_BUILD_DIR)/bin/firmware/Marvell_license.txt $(1)/lib/firmware/mwlwifi/
endef

$(eval $(call KernelPackage,mwlwifi))