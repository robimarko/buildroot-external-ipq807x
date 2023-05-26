################################################################################
#
# ath11k-firmware
#
################################################################################

ATH11K_FIRMWARE_VERSION = a039049a9349722fa5c74185452ab04644a0d351
ATH11K_FIRMWARE_SITE = https://github.com/quic/upstream-wifi-fw.git
ATH11K_FIRMWARE_SITE_METHOD = git
ATH11K_FIRMWARE_LICENSE = Proprietary
ATH11K_FIRMWARE_LICENSE_FILES = ath11k-firmware/LICENSE.md

# IPQ8074 firmware
ifeq ($(BR2_PACKAGE_ATH11K_FIRMWARE_IPQ8074),y)
ATH11K_FIRMWARE_IPQ8074_DIR = ath11k-firmware/IPQ8074/hw2.0/testing/2.9.0.1/WLAN.HK.2.9.0.1-01385-QCAHKSWPL_SILICONZ-1

define ATH11K_FIRMWARE_IPQ8074_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/IPQ8074
	$(INSTALL) $(@D)/$(ATH11K_FIRMWARE_IPQ8074_DIR)/* $(TARGET_DIR)/lib/firmware/IPQ8074
endef
endif

# QCN9074 firmware
ifeq ($(BR2_PACKAGE_ATH11K_FIRMWARE_QCN9074),y)
ATH11K_FIRMWARE_QCN9074_DIR = ath11k-firmware/QCN9074/hw1.0/testing/2.9.0.1/WLAN.HK.2.9.0.1-01385-QCAHKSWPL_SILICONZ-1

define ATH11K_FIRMWARE_QCN9074_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath11k/QCN9074/hw1.0
	$(INSTALL) $(@D)/$(ATH11K_FIRMWARE_QCN9074_DIR)/* $(TARGET_DIR)/lib/firmware/ath11k/QCN9074/hw1.0
endef
endif

define ATH11K_FIRMWARE_INSTALL_TARGET_CMDS
	$(ATH11K_FIRMWARE_IPQ8074_INSTALL_TARGET_CMD)
	$(ATH11K_FIRMWARE_QCN9074_INSTALL_TARGET_CMD)
endef

$(eval $(generic-package))
