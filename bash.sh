#!/bin/bash

# 💫 Stop on error
set -e

# 🧹 Clean conflicting folders

## repo sync

## sync
/opt/crave/resync.sh

# 🌱 Setup build environment
echo "🔧 Setting up build environment..."
. build/envsetup.sh

# 🏷️ Set Project Infinity X flags
echo "rom flags"


# 🍽️ Choose lunch combo
echo "🍽️ Lunching device..."
lunch lineage_mojito-ap4a-userdebug

# 🧽 Clean build environment
echo "🧽 Running full clean..."
mka clean

# 🔨 Start building
echo "🚀 Starting build..."
mka bacon
