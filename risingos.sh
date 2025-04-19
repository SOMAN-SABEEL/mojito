
rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingOS-Revived/android -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync device resources
echo "========================="
echo "Cloning Device Resources"
echo "========================="

# device tree
git clone https://github.com/SOMAN-SABEEL/device_xiaomi_mojito.git -b Evo-15-QPR2
# device common tree 
git clone https://github.com/SOMAN-SABEEL/android_device_xiaomi_sm6150-common.git -b Evo-15-QPR2

# vendor tree
git clone https://github.com/SOMAN-SABEEL/android_vendor_xiaomi_mojito -b 15
git clone https://github.com/SOMAN-SABEEL/android_vendor_xiaomi_sm6150-common -b 15

# kernel 
git clone https://github.com/SOMAN-SABEEL/kernel_xiaomi_mojito -b inline-rom

# hardware
git clone https://github.com/SOMAN-SABEEL/android_hardware_xiaomi -b voyager

# viper-4-android
git clone https://github.com/SOMAN-SABEEL/packages_apps_ViPER4AndroidFX -b v4a

echo "============================"
echo "Device Resource Clone Done"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Soman_Sabeel
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh 
echo "====== Envsetup Done ======="

# Lunch
riseup mojito userdebug
echo "==== brunching ====="

# Build rom
rise b
