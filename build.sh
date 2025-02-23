#!/bin/bash

# Set up environment
echo "======= SettingUp Build Enviroment ======"
. build/envsetup.sh
echo "======= Build Enviroment Setup Complete ======"
# Choose a target device 
lunch cipher_mojito-ap1a-userdebug
echo "======= Settting Up Device Complete======"
# Compile CipherOS 
echo "======= Compiling ROM ======"
mka bacon -j$(nproc --all)
echo "======= Done ======"
