#!/bin/bash

# Clone device resources
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/android_device_xiaomi_sm6150-common.git device/xiaomi/sm6150-common
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/device_xiaomi_mojito.git device/xiaomi/mojito
git clone --depth=1 -b voyager https://github.com/SOMAN-SABEEL/android_hardware_xiaomi.git hardware/xiaomi
git clone --depth=1 -b inline-rom https://github.com/SOMAN-SABEEL/kernel_xiaomi_mojito.git kernel/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_mojito.git vendor/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_sm6150-common.git vendor/xiaomi/sm6150-common

# Set up environment
. build/envsetup.sh

# Export build flags
export CIPHER_MAINTAINER="Soman Sabeel"
export CIPHER_GAPPS=true

# Lunch device
lunch cipher_mojito-ap1a-userdebug

# Start build
mka bacon -j$(nproc --all)
