################################################################################
#
# mhz
#
################################################################################

MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
MHZ_SITE = https://github.com/wtarreau/mhz.git
MHZ_SITE_METHOD = git
MHZ_LICENSE = MIT/X11
MHZ_LICENSE_FILES = LICENSE

define MHZ_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" -C $(@D)
endef

define MHZ_INSTALL_TARGET_CMDS
	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
endef

$(eval $(generic-package))
