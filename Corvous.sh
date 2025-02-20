#!/bin/bash

rm -rf .repo/local_manifests/

# Local TimeZone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/India /etc/localtime

# Rom source repo
repo init -u https://github.com/CipherOS/android_manifest.git -b fifteen
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b Evo-15 https://github.com/Sachinpawar86/local_manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"


# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Soman_Sabeel
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch cipher_mojito-ap3a-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon -j$(nproc --all)
