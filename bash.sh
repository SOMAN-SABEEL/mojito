#!/bin/bash
set -e

# Get absolute path to this script's directory (ROM root)
ROM_ROOT="$(cd "$(dirname "$0")" && pwd)"
KERNEL_DIR="$ROM_ROOT/kernel_xiaomi_mojito"

# Check if kernel dir exists
if [ ! -d "$KERNEL_DIR" ]; then
    echo "❌ Kernel source not found at: $KERNEL_DIR"
    exit 1
fi

# Step into kernel directory
cd "$KERNEL_DIR"

# Run the main build script
./kernel_build.sh
