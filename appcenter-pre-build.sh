echo "Injecting secrets..."
echo "Updating iOS secret"
echo $IOS_SECRET | base64 --decode > "$APPCENTER_SOURCE_DIRECTORY/ios/UnitConverter/AppCenter-Config.plist"
echo "Finished injecting secrets."
