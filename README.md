Buildroot for IPQ8074 and beyond
================================

This repo provides packages for bringup of IPQ family chips. It produces a
bootable kernel with built-in initramfs. The main use-case is integration of
QCA's out-of-round kernel modules for networking. These are QCA-SSDK,
QCA-NSS-DP; however some chips may require extra modules.

Basic usage:
------------

First, obtain an upstream buildroot tree. From the buildroot tree, configure
using the **BR2_EXTERNAL**. Assuming that both buildroot and this repo are
cloned in the same base directory, the following will suffice:

	make BR2_EXTERNAL=../buildroot-external-ipq807x ipq807x_defconfig

The default configuration can now be customized with:

	make nconfig

Start a build with:

	make

Advanced usage:
---------------

A common use case is to make incremental changes to a package's source. To
facilitate this, buildroot provides a way to manually specify the source
directory for a package. This is done by editing a file named **local.mk**.
Assuming linux is cloned in ../linux, and similarly for qca-ssdk, **local.mk**
would have the following contents:

	LINUX_OVERRIDE_SRCDIR = ../linux
	QCA_SSDK_OVERRIDE_SRCDIR = ../qca-ssdk

At this point, the package may need to be rebuilt. Each package uses the
`<pkg>-rebuild` target. For example:

	make linux-rebuild
	make qca-ssdk-rebuild all

Note that the `all` target is optional. It tells buildroot to also re-assemble
an image after the package is rebuilt.

Call the `<pkg>-rebuild` target after a change is made to the sources. buildroot
uses rsync to update modified files.

### Possible issues

Sometimes, buildroot's system may fail to correctly rebuild a package. This
usually manifests as source changes not reflecting in the behavior of said
package. In this case the `<pkg>-dirclean` target may help:

	make qca-ssd-dirclean
	make qca-ssdk-rebuild
