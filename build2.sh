#!/bin/bash
# Remove old local_manifests
# ROM source repo
# Clone local_manifests repository
# Signed Keys
# Sync the repositories
#/opt/crave/resync.sh
echo "============================"
# Export
export BUILD_USERNAME="Soman"
export BUILD_HOSTNAME="crave"
echo "======= Export Done ======"
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="
# Lunch
lunch lineage_mojito-ap2a-userdebug
echo "============="
# Make clean install
make installclean
echo "============="
# Build ROM
m bacon
