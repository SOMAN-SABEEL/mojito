#!/bin/bash

# Clean conflicting folders
rm -rf \
  device/xiaomi/mojito \
  device/xiaomi/sm6150-common \
  hardware/xiaomi \
  kernel/xiaomi/mojito \
  vendor/xiaomi/mojito \
  vendor/xiaomi/sm6150-common

# Initialize repo
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b QPR3 -g default,-mips,-darwin,-notdefault

# Sync source
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

# Clone device trees
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/device_xiaomi_mojito.git device/xiaomi/mojito
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/android_device_xiaomi_sm6150-common.git device/xiaomi/sm6150-common
git clone --depth=1 -b voyager https://github.com/SOMAN-SABEEL/android_hardware_xiaomi.git hardware/xiaomi
git clone --depth=1 -b inline-rom https://github.com/SOMAN-SABEEL/kernel_xiaomi_mojito.git kernel/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_mojito.git vendor/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_sm6150-common.git vendor/xiaomi/sm6150-common

# Setup build environment
. build/envsetup.sh

# Add maintainer flags

# Lunch device
lunch infinity_mojito-userdebug

# Start build
mka bacon -j$(nproc --all)
