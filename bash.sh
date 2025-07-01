#!/bin/bash

# 💫 Stop on error
set -e


rm -rf .repo/local_manifests
mkdir -p .repo/local_manifests

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

## repo sync

## sync
/opt/crave/resync.sh

# 🌱 Setup build environment
echo "🔧 Setting up build environment..."
. build/envsetup.sh

# 🏷️ Set Project Infinity X flags
echo "rom flags"
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
lunch lineage_mojito-ap4a-userdebug

# 🧽 Clean build environment
echo "🧽 Running full clean..."
mka clean

# 🔨 Start building
echo "🚀 Starting build..."
mka bacon
