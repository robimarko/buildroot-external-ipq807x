################################################################################
#
# qca-nss-dp
#
################################################################################

QCA_NSS_DP_VERSION = 72e9ec4187414461cbcf6ccff100e8b5ebe5f40b
QCA_NSS_DP_SITE = https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-dp.git
QCA_NSS_DP_SITE_METHOD = git
QCA_NSS_DP_LICENSE = Dual BSD/GPL
QCA_NSS_DP_DEPENDENCIES = qca-ssdk

QCA_NSS_DP_MODULE_MAKE_OPTS = \
	SoC=ipq807x \
	KBUILD_EXTRA_SYMBOLS="$(shell echo $(STAGING_DIR)/usr/include/qca-ssdk/Module.symvers)" \
	EXTRA_CFLAGS="-I$(STAGING_DIR)/usr/include/qca-ssdk"

$(eval $(kernel-module))

define QCA_NSS_DP_FIX_HEADERS
	ln -fs $(@D)/hal/soc_ops/ipq807x/nss_ipq807x.h $(@D)/exports/nss_dp_arch.h
endef
QCA_NSS_DP_PRE_BUILD_HOOKS += QCA_NSS_DP_FIX_HEADERS

define QCA_NSS_DP_INSTALL_STAGING_HEADERS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/qca-nss-dp
	cp -r $(@D)/exports/* $(STAGING_DIR)/usr/include/qca-nss-dp
endef

define QCA_NSS_DP_INSTALL_MOD_SYM
	cp  $(@D)/Module.symvers $(STAGING_DIR)/usr/include/qca-nss-dp
endef
QCA_NSS_DP_POST_BUILD_HOOKS += QCA_NSS_DP_INSTALL_STAGING_HEADERS QCA_NSS_DP_INSTALL_MOD_SYM

$(eval $(generic-package))
