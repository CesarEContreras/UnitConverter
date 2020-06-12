echo "Injecting secrets..."
echo "Updating iOS secret"

Get-ChildItem -Path $APPCENTER_SOURCE_DIRECTORY/ios -Filter *.js -Recurse -File -Name| ForEach-Object {
    $_.FullName
}

echo $IOS_SECRET | base64 --decode > "$APPCENTER_SOURCE_DIRECTORY/ios/Glitz/AppCenter-Config.plist"
echo "Finished injecting secrets."
