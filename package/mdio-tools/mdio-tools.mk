################################################################################
#
# mdio-tools
#
################################################################################

MDIO_TOOLS_VERSION = 1.1.1
MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
MDIO_TOOLS_LICENSE = GPL-2.0-only
MDIO_TOOLS_DEPENDENCIES = libmnl

$(eval $(autotools-package))
