#!/bin/sh

# This script creates u-boot FIT image containing the kernel and the DT.

MKIMAGE=$HOST_DIR/bin/mkimage
BOARD_DIR="$(dirname $0)"

# Copy ITS to binaries dir
cp $BOARD_DIR/kernel_fdt.its $BINARIES_DIR

# Generate the FIT image
$MKIMAGE -f $BINARIES_DIR/kernel_fdt.its $BINARIES_DIR/uImage.itb