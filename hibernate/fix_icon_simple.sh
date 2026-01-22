#!/bin/bash

echo "Simple icon fix for HibernateApp..."

# 1. Check if we can use iconutil to create icns from appiconset
if [ -d "Assets.xcassets/AppIcon.appiconset" ]; then
    echo "Creating ICNS file using iconutil..."
    
    # Create a temporary appiconset directory
    mkdir -p temp_appiconset
    
    # Copy only the macOS icons
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-16.png" temp_appiconset/icon_16x16.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-16@2x.png" temp_appiconset/icon_16x16@2x.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-32.png" temp_appiconset/icon_32x32.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-32@2x.png" temp_appiconset/icon_32x32@2x.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-128.png" temp_appiconset/icon_128x128.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-128@2x.png" temp_appiconset/icon_128x128@2x.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-256.png" temp_appiconset/icon_256x256.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-256@2x.png" temp_appiconset/icon_256x256@2x.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-512.png" temp_appiconset/icon_512x512.png
    cp "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" temp_appiconset/icon_512x512@2x.png
    
    # Create Contents.json for iconutil
    cat > temp_appiconset/Contents.json << 'EOF'
{
  "images" : [
    {
      "size" : "16x16",
      "idiom" : "mac",
      "filename" : "icon_16x16.png",
      "scale" : "1x"
    },
    {
      "size" : "16x16",
      "idiom" : "mac",
      "filename" : "icon_16x16@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "32x32",
      "idiom" : "mac",
      "filename" : "icon_32x32.png",
      "scale" : "1x"
    },
    {
      "size" : "32x32",
      "idiom" : "mac",
      "filename" : "icon_32x32@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "128x128",
      "idiom" : "mac",
      "filename" : "icon_128x128.png",
      "scale" : "1x"
    },
    {
      "size" : "128x128",
      "idiom" : "mac",
      "filename" : "icon_128x128@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "256x256",
      "idiom" : "mac",
      "filename" : "icon_256x256.png",
      "scale" : "1x"
    },
    {
      "size" : "256x256",
      "idiom" : "mac",
      "filename" : "icon_256x256@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "512x512",
      "idiom" : "mac",
      "filename" : "icon_512x512.png",
      "scale" : "1x"
    },
    {
      "size" : "512x512",
      "idiom" : "mac",
      "filename" : "icon_512x512@2x.png",
      "scale" : "2x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF
    
    # Use iconutil to create icns file
    iconutil -c icns -o temp_appiconset/AppIcon.icns temp_appiconset
    
    if [ -f "temp_appiconset/AppIcon.icns" ]; then
        echo "ICNS file created successfully!"
        cp temp_appiconset/AppIcon.icns /Applications/HibernateApp.app/Contents/Resources/
    else
        echo "iconutil failed, trying alternative approach..."
        # Fallback: copy the largest PNG and rename it
        cp "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" /Applications/HibernateApp.app/Contents/Resources/AppIcon.icns
    fi
    
    # Clean up
    rm -rf temp_appiconset
else
    echo "No appiconset found, using fallback approach..."
    # Fallback: copy the largest PNG and rename it
    if [ -f "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" ]; then
        cp "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" /Applications/HibernateApp.app/Contents/Resources/AppIcon.icns
    fi
fi

# Update Info.plist to point to the icns file
echo "Updating Info.plist..."
plutil -replace CFBundleIconFile -string "AppIcon.icns" /Applications/HibernateApp.app/Contents/Info.plist

# Set proper permissions
chmod -R 755 /Applications/HibernateApp.app

echo "Icon fix completed!"
echo "Please restart Finder: killall Finder"
echo "Or try: touch /Applications/HibernateApp.app"

# Touch the app to force icon refresh
touch /Applications/HibernateApp.app