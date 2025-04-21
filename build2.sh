
# Export
export BUILD_USERNAME=Soman_Sabeel
export BUILD_HOSTNAME=crave
echo "===== Export Done ======"
# updating 
sudo apt update && sudo apt install ccache -y
echo "=== Update Done ==="
# Ccache error fix
export USE_CCACHE=1
ccache -M 50G
echo "=== ccache error fix done"
# Build setup
. build/envsetup.sh
echo "==== Build Setup Done ===="
# lunch
lunch riseup_mojito-userdebug
# Baking
echo "=== Started Baking ==="
mka bacon
echo "=== Done ==="

