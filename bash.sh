#!/bin/bash

# 💫 Stop on error
set -e

# 🧹 Clean conflicting folders
echo "🧼 Cleaning old sources..."
rm -rf \
  device/xiaomi/mojito \
  device/xiaomi/sm6150-common \
  hardware/xiaomi \
  kernel/xiaomi/mojito \
  vendor/xiaomi/mojito \
  vendor/xiaomi/sm6150-common \
  out

# 🧭 Initialize repo
echo "🌐 Initializing repo..."
repo init --depth=1 --no-repo-verify --git-lfs \
  -u https://github.com/ProjectInfinity-X/manifest \
  -b QPR3 \
  -g default,-mips,-darwin,-notdefault

# 📦 Clone device trees
echo "📦 Cloning device resources..."
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/device_xiaomi_mojito.git device/xiaomi/mojito
git clone --depth=1 -b mojito-voyager https://github.com/SOMAN-SABEEL/android_device_xiaomi_sm6150-common.git device/xiaomi/sm6150-common
git clone --depth=1 -b voyager https://github.com/SOMAN-SABEEL/android_hardware_xiaomi.git hardware/xiaomi
git clone --depth=1 -b inline-rom https://github.com/SOMAN-SABEEL/kernel_xiaomi_mojito.git kernel/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_mojito.git vendor/xiaomi/mojito
git clone --depth=1 -b 15 https://gitlab.com/romgharti/android_vendor_xiaomi_sm6150-common.git vendor/xiaomi/sm6150-common

## sync
/opt/sync/resync.sh
# 🌱 Setup build environment
echo "🔧 Setting up build environment..."
. build/envsetup.sh

# 🏷️ Set Project Infinity X flags
export WITH_GAPPS=true
export INFINITY_MAINTAINER="Soman Sabeel"
export INFINITY_BUILD_TYPE=UNOFFICIAL
export TARGET_SUPPORTS_TOUCHGESTURES=true
export USE_MOTO_CALCULATOR=true
export TARGET_SUPPORTS_BLUR=true
export TARGET_HAS_UDFPS=false
export TARGET_BUILD_GOOGLE_TELEPHONY=false

# 🍽️ Choose lunch combo
echo "🍽️ Lunching device..."
lunch lineage_mojito-bp1a-userdebug

# 🧽 Clean build environment
echo "🧽 Running full clean..."
mka clean

# 🔨 Start building
echo "🚀 Starting build..."
mka bacon -j$(nproc --all)
