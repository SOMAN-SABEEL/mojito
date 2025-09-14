#!/bin/bash

# Remove old local_manifests
rm -rf .repo/local_manifests/

# Local TimeZone
sudo rm -rf /etc/localtime

# ROM source repo
repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
 clone https://github.com/SOMAN-SABEEL/local_manifest .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Signed Keys

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME="Soman"
export BUILD_HOSTNAME="crave"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_mojito-userdebug
echo "============="

# Make clean install
make installclean
echo "============="

# Build ROM
m bacon
