#!/bin/bash

echo "Fixing icon issue for HibernateApp..."

# 1. Remove the app if it exists
if [ -d "/Applications/HibernateApp.app" ]; then
    echo "Removing existing app..."
    rm -rf /Applications/HibernateApp.app
fi

# 2. Rebuild with proper icon handling
echo "Rebuilding app with icon fixes..."

# Compile the Swift files
swiftc *.swift -o HibernateApp -framework AppKit -framework Foundation

if [ $? -ne 0 ]; then
    echo "Build failed"
    exit 1
fi

# Create the app bundle structure
mkdir -p HibernateApp.app/Contents/MacOS
mkdir -p HibernateApp.app/Contents/Resources

# Move the binary
mv HibernateApp HibernateApp.app/Contents/MacOS/

# Copy assets with proper structure
echo "Setting up proper icon structure..."

# Create a proper icns file using sips
if [ -d "Assets.xcassets/AppIcon.appiconset" ]; then
    echo "Creating proper .icns file..."
    
    # Create temporary directory for icon conversion
    mkdir -p temp_icons
    
    # Convert the largest PNG to icns format
    if [ -f "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" ]; then
        cp "Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png" temp_icons/icon.png
        
        # Convert PNG to ICNS using sips
        sips -s format icns temp_icons/icon.png --out HibernateApp.app/Contents/Resources/AppIcon.icns
        
        # Also copy the original assets
        cp -R Assets.xcassets HibernateApp.app/Contents/Resources/
    fi
    
    # Clean up
    rm -rf temp_icons
fi

# Copy the fixed Info.plist
cp Info.plist.fixed HibernateApp.app/Contents/Info.plist

# Set proper permissions
echo "Setting proper permissions..."
chmod -R 755 HibernateApp.app

# Install to Applications
cp -R HibernateApp.app /Applications/

# Clean up
rm -rf HibernateApp.app

echo "Icon fix applied. You may need to:"
echo "1. Restart Finder: killall Finder"
echo "2. Rebuild Launch Services: sudo /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
echo "3. Or simply log out and log back in."