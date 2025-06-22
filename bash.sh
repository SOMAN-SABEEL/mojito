#!/bin/bash

# Sync source (safe)
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

# Set up environment
. build/envsetup.sh

# Lunch device
lunch cipher_mojito-userdebug

# Start build
mka bacon -j$(nproc --all)
