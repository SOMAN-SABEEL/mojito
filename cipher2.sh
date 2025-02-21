#!/bin/bash

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch mojito-ap1a-userdebug
echo "============="

# Build rom
mka bacon -j$(nproc --all)
