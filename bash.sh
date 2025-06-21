#!/bin/bash

# Exit if any command fails
set -e

# Sync/install KernelSU-next into kernel tree
curl -LSs "https://raw.githubusercontent.com/KernelSU-Next/KernelSU-Next/next/kernel/setup.sh" | bash -

# Export environment variables
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=Soman
export KBUILD_BUILD_HOST=crave

export CLANG_PATH=$(pwd)/proton-clang
export PATH=$CLANG_PATH/bin:$PATH

# clean build
rm -rf out

# Build defconfig
make O=out mojito_defconfig

# Compile kernel
make -j$(nproc) O=out \
    CC=clang \
    CROSS_COMPILE=${CLANG_PATH}/bin/aarch64-linux-gnu- \
    CROSS_COMPILE_ARM32=${CLANG_PATH}/bin/arm-linux-gnueabi-
