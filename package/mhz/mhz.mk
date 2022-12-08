################################################################################
#
# mhz
#
################################################################################

MHZ_VERSION = 6ec38cbb1371d20078a7a5059dd9faa5b281b2d9
MHZ_SITE = https://github.com/wtarreau/mhz.git
MHZ_SITE_METHOD = git

define MHZ_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/mhz $(@D)/mhz.c
endef

define MHZ_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
endef

$(eval $(generic-package))
