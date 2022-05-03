################################################################################
#
# mhz
#
################################################################################

MHZ_VERSION = d1ed90e3523ab0300d6e7960eaaa49ef8c41845d
MHZ_SITE = https://github.com/wtarreau/mhz.git
MHZ_SITE_METHOD = git

define MHZ_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/mhz $(@D)/mhz.c
endef

define MHZ_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
endef

$(eval $(generic-package))
