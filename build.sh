#!/bin/bash
set -e

# Setup KernelSU-Next
curl -LSs "https://raw.githubusercontent.com/KernelSU-Next/KernelSU-Next/next/kernel/setup.sh" | bash -

# Export build environment
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=Soman
export KBUILD_BUILD_HOST=crave

# Proton Clang path 
export CLANG_PATH=$(pwd)/proton-clang
export PATH=$CLANG_PATH/bin:$PATH

# Clean previous output
rm -rf out

# Load default config
make O=out mojito_defconfig

# Build kernel
make -j$(nproc) O=out \
    CC=clang \
    CROSS_COMPILE=${CLANG_PATH}/bin/aarch64-linux-gnu- \
    CROSS_COMPILE_ARM32=${CLANG_PATH}/bin/arm-linux-gnueabi-
