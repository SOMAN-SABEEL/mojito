#!/bin/bash
set -e

# KernelSU-Next setup
curl -LSs "https://raw.githubusercontent.com/KernelSU-Next/KernelSU-Next/next/kernel/setup.sh" | bash -

# Export environment
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=Soman
export KBUILD_BUILD_HOST=crave

export CLANG_PATH=$(pwd)/proton-clang
export PATH=$CLANG_PATH/bin:$PATH

#clean output dir for a fresh build
rm -rf out

# Build defconfig
make O=out mojito_defconfig

# Compile kernel
make -j$(nproc) O=out \
    CC=clang \
    CROSS_COMPILE=aarch64-linux-gnu- \
    CROSS_COMPILE_ARM32=arm-linux-gnueabi-
