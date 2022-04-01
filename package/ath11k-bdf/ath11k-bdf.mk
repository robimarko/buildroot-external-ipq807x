################################################################################
#
# ath11k-bdf
#
################################################################################

ATH11K_BDF_SITE = $(BR2_EXTERNAL_IPQ807X_PATH)/package/ath11k-bdf/files
ATH11K_BDF_SITE_METHOD = local
ATH11K_BDF_LICENSE = Proprietary

# Qnap 301W
ifeq ($(BR2_PACKAGE_ATH11K_BDF_301W),y)
ATH11K_BDF_IPQ8074_DIR = 301W

define ATH11K_BDF_301W_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath11k/IPQ8074/hw2.0
	$(INSTALL) $(@D)/$(ATH11K_BDF_IPQ8074_DIR)/* $(TARGET_DIR)/lib/firmware/ath11k/IPQ8074/hw2.0
endef
endif

define ATH11K_BDF_INSTALL_TARGET_CMDS
	$(ATH11K_BDF_301W_INSTALL_TARGET_CMD)
endef

$(eval $(generic-package))
