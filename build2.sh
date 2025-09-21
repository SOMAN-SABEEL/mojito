#!/bin/bash
# Remove old local_manifests
rm -rf .repo/local_manifests/

# Local TimeZone
sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

# ROM source repo
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
# Clone local_manifests repository
git clone -b Evo-16 https://github.com/Sachinpawar86/local_manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"
# Signed Keys
crave ssh
git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys
cd vendor/evolution-priv/keys || exit 1
./keys.sh
cd ../../..
echo "===== Keys setup done ====="
echo "================ sync =============="
/opt/crave/resync.sh
echo "============================"
# Export
export BUILD_USERNAME="Soman"
export BUILD_HOSTNAME="crave"
echo "======= Export Done ===================="
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ==============="
# Lunch
lunch lineage_mojito-bp2a-userdebug

echo "============="
# Make clean install
echo "============================"
# Build ROM
m evolution

echo "====================== done evolution ======================="
crave pull out/target/product/*/*.zip
echo "========= pull done ========"
