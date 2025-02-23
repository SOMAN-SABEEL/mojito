#!/bin/bash

# Set up environment
echo "======= SettingUp Build Enviroment ======"
. build/envsetup.sh
echo "======= Build Enviroment Setup Complete ======"
# Choose a target device 
lunch mojito-ap1a-userdebug
echo "======= Settting Up Device Complete======"
# Compile CipherOS 
# Make cleaninstall
make installclean
echo "======= Compiling ROOOOM ======"
mka bacon -j$(nproc --all)
echo "======= Doneeee ======"
