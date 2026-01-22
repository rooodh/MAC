#!/bin/bash

# Build and install script for Hibernate App - FIXED VERSION
# This version uses a corrected Info.plist and handles the build properly

echo "Building Hibernate App (Fixed Version)..."

# 1. Clean previous build
if [ -d "HibernateApp.app" ]; then
    echo "Cleaning previous build..."
    rm -rf HibernateApp.app
fi

# 2. Compilation des fichiers Swift
echo "Compiling Swift files..."
swiftc *.swift -o HibernateApp -framework AppKit -framework Foundation

if [ $? -ne 0 ]; then
    echo "Build failed. Please check the error messages above."
    exit 1
fi

# 3. Création de la structure .app avec assets
echo "Creating .app bundle with assets..."
mkdir -p HibernateApp.app/Contents/MacOS
mkdir -p HibernateApp.app/Contents/Resources

# 4. Copier le binaire
mv HibernateApp HibernateApp.app/Contents/MacOS/

# 5. Copier les assets (icônes)
if [ -d "Assets.xcassets" ]; then
    echo "Copying assets..."
    cp -R Assets.xcassets HibernateApp.app/Contents/Resources/
fi

# 6. Copier le fichier Info.plist CORRIGÉ
if [ -f "Info.plist.fixed" ]; then
    echo "Copying corrected Info.plist..."
    cp Info.plist.fixed HibernateApp.app/Contents/Info.plist
else
    echo "Warning: Info.plist.fixed not found, using original Info.plist"
    if [ -f "Info.plist" ]; then
        cp Info.plist HibernateApp.app/Contents/
    fi
fi

# 7. Installation vers /Applications
echo "Installing to Applications folder..."

# Nettoyage de l'ancienne version si elle existe
if [ -d "/Applications/HibernateApp.app" ]; then
    rm -rf "/Applications/HibernateApp.app"
fi

cp -R HibernateApp.app /Applications/

# 8. Nettoyage local (optionnel)
rm -rf HibernateApp.app

echo "Hibernate App has been installed to your Applications folder."
echo "You can now launch it from there."
echo ""
echo "Note: If the icon still doesn't appear, you may need to:"
echo "1. Restart Finder: killall Finder"
echo "2. Rebuild the Launch Services database: /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user"
echo "3. Or simply log out and log back in."