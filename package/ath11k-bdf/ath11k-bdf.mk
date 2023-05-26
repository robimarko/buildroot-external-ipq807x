################################################################################
#
# ath11k-bdf
#
################################################################################

ATH11K_BDF_VERSION = 0f73d32e641c4f17e64597da0e6c40ed3cbebe69
ATH11K_BDF_SITE = https://github.com/openwrt/firmware_qca-wireless.git
ATH11K_BDF_SITE_METHOD = git
ATH11K_BDF_LICENSE = Proprietary

# Qnap 301W
ifeq ($(BR2_PACKAGE_ATH11K_BDF_301W),y)
ATH11K_BDF_IPQ8074_FILE = board-qnap_301w.ipq8074
endif

# Xiaomi AX9000
ifeq ($(BR2_PACKAGE_ATH11K_BDF_AX9000),y)
ATH11K_BDF_IPQ8074_FILE = board-xiaomi_ax9000.ipq8074
endif

define ATH11K_BDF_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath11k/IPQ8074/hw2.0
	$(INSTALL) $(@D)/$(ATH11K_BDF_IPQ8074_FILE) $(TARGET_DIR)/lib/firmware/ath11k/IPQ8074/hw2.0/board-2.bin
endef

define ATH11K_BDF_INSTALL_TARGET_CMDS
	$(ATH11K_BDF_INSTALL_TARGET_CMD)
endef

$(eval $(generic-package))
