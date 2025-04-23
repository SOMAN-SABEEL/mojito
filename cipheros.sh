#!/bin/bash

rm -rf .repo/local_manifests/

# Local TimeZone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/India /etc/localtime

# Rom source repo
repo init -u https://github.com/CipherOS/android_manifest.git -b fifteen
# Sync 
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
# git clone https://github.com/SOMAN-SABEEL/mojito/default.xml .repo/manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"


# Sync the repositories
 /opt/crave/resync.sh
echo "============================"

# Export
export CIPHER_MAINTAINER=Soman_Sabeel
export CIPHER_GAPPS=true
echo "======= Export Done ======"

# Set up environment 
. build/envsetup.sh

# Choose a target device 
lunch cipher_mojito-ap3a-userdebug

# Compile CipherOS 
mka bacon -j$(nproc --all)
