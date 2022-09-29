################################################################################
#
# qca-ssdk-shell
#
################################################################################

QCA_SSDK_SHELL_VERSION = b43fba2d2c6805d54b70d3d43363b689f729db54
QCA_SSDK_SHELL_SITE = https://git.codelinaro.org/clo/qsdk/oss/ssdk-shell.git
QCA_SSDK_SHELL_SITE_METHOD = git
QCA_SSDK_SHELL_LICENSE = Dual BSD/GPL
QCA_SSDK_SHELL_DEPENDENCIES = libbsd

QCA_SSDK_SHELL_MAKE_OPTS = \
	OS=linux \
	ARCH=$(KERNEL_ARCH) \
	KVER=$(shell echo $(LINUX_VERSION_PROBED)) \
	SYS_PATH=$(LINUX_DIR) \
	TOOLPREFIX=$(TOOLCHAIN_EXTERNAL_PREFIX)- \
	TOOL_PATH=$(HOST_DIR)/bin \
	LDFLAGS="$(TARGET_LDFLAGS) -lbsd"

define QCA_SSDK_SHELL_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(QCA_SSDK_SHELL_MAKE_OPTS)
endef

define QCA_SSDK_SHELL_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/bin/ssdk_sh $(TARGET_DIR)/usr/bin/ssdk_sh
endef

$(eval $(generic-package))
