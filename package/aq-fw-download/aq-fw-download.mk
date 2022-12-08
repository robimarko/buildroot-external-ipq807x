################################################################################
#
# aq-fw-download
#
################################################################################

AQ_FW_DOWNLOAD_SITE = $(BR2_EXTERNAL_IPQ807X_PATH)/aq-fw-download-src
AQ_FW_DOWNLOAD_SITE_METHOD = local
AQ_FW_DOWNLOAD_SHELL_DEPENDENCIES = libbsd

define AQ_FW_DOWNLOAD_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS) -lbsd" -C $(@D)
endef

define AQ_FW_DOWNLOAD_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/aq-fw-download $(TARGET_DIR)/usr/bin/aq-fw-download
endef

$(eval $(generic-package))
