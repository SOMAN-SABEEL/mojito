
# Export
export BUILD_USERNAME=Soman_Sabeel
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"
# env Setup
. build/envsetup.sh
 # Lunch 
riseup mojito userdebug
# baking
rise b
# Done
