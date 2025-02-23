#!/bin/bash

# Set up environment 
. build/envsetup.sh

# Choose a target device 
lunch cipher_mojito-ap1a-userdebug

# Compile CipherOS 
mka bacon -j$(nproc --all)
