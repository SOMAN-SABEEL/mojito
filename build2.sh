#!/bin/bash
echo "============================"
# Export
export BUILD_USERNAME="Soman"
export BUILD_HOSTNAME="crave"
echo "======= Export Done ===================="
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ==============="
# Lunch
lunch lineage_mojito-bp2a-userdebug
echo "============="
# Make clean install
echo "============================"
# Build ROM
m evolution
