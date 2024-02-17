################################################################################
#
# qca-ssdk
#
################################################################################

QCA_SSDK_VERSION = 23a5aa4a4d5834da7a07efb58baebfbee91786b0
QCA_SSDK_SITE = https://git.codelinaro.org/clo/qsdk/oss/lklm/qca-ssdk.git
QCA_SSDK_SITE_METHOD = git
QCA_SSDK_LICENSE = Dual BSD/GPL

QCA_SSDK_MODULE_MAKE_OPTS = \
	OS=linux \
	ARCH=$(KERNEL_ARCH) \
	KVER=$(shell echo $(LINUX_VERSION_PROBED)) \
	SYS_PATH=$(LINUX_DIR) \
	TOOLPREFIX=$(TOOLCHAIN_EXTERNAL_PREFIX)- \
	TOOL_PATH=$(HOST_DIR)/bin/ \
	GCC_VERSION=120300 \
	CHIP_TYPE=HPPE \
	PTP_FEATURE=disable \
	SWCONFIG_FEATURE=disable \
	ISISC_ENABLE=disable \
	IN_QCA803X_PHY=FALSE \
	IN_QCA808X_PHY=FALSE \
	IN_MALIBU_PHY=FALSE \
	EXTRA_CFLAGS="-fno-stack-protector" \
	SoC="ipq807x" \
	INSTALL_MOD_PATH=$(TARGET_DIR)

LNX_CONFIG_OPTS = LNX_MAKEOPTS='$(LINUX_MAKE_FLAGS)' MODULE_TYPE=KSLIB modules

define QCA_SSDK_INSTALL_STAGING_HEADERS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/api $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/ref $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/fal $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/common/*.h $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/sal/os/linux/*.h $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/sal/os/*.h $(STAGING_DIR)/usr/include/qca-ssdk
	cp -rf $(@D)/include/init $(STAGING_DIR)/usr/include/qca-ssdk
endef

define QCA_SSDK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(QCA_SSDK_MODULE_MAKE_OPTS) $(LNX_CONFIG_OPTS)
endef

define QCA_SSDK_INSTALL_MOD_SYM
	cp  $(@D)/Module.symvers $(STAGING_DIR)/usr/include/qca-ssdk
endef
QCA_SSDK_POST_BUILD_HOOKS += QCA_SSDK_INSTALL_STAGING_HEADERS QCA_SSDK_INSTALL_MOD_SYM

#define QCA_SSDK_INSTALL_TARGET_CMDS
#	$(INSTALL) -D $(@D)/build/bin/qca-ssdk.ko $(TARGET_DIR)/lib/modules/qca-ssdk.ko
#endef

$(eval $(generic-package))
