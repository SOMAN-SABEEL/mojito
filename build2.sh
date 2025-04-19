
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
