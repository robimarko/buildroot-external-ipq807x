################################################################################
#
# qrtr
#
################################################################################

QRTR_VERSION = cd6bedd5d00f211e6c1e3803ff2f9f53c246435e
QRTR_SITE = https://git.codelinaro.org/clo/qsdk/qrtr.git
QRTR_SITE_METHOD = git

define QRTR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) \
	CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(@D)
endef

define QRTR_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/qrtr-lookup $(TARGET_DIR)/usr/bin/qrtr-lookup
	$(INSTALL) $(@D)/qrtr-cfg $(TARGET_DIR)/usr/bin/qrtr-cfg
	$(INSTALL) $(@D)/qrtr-ns $(TARGET_DIR)/usr/bin/qrtr-ns
endef

$(eval $(generic-package))
