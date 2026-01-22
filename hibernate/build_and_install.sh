#!/bin/bash

# Build and install script for Hibernate App (MINIMAL VERSION)

echo "Building Hibernate App..."

# 1. Compilation des fichiers Swift
# On compile tous les fichiers .swift du dossier vers un binaire nommé 'HibernateApp'
# On ajoute -framework AppKit au cas où c'est une application avec interface
swiftc *.swift -o HibernateApp -framework AppKit -framework Foundation

if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # 2. Création de la structure .app
    # Sous macOS, une application est un dossier avec une structure spécifique
    echo "Structuring as .app bundle..."
    mkdir -p HibernateApp.app/Contents/MacOS
    
    # On déplace le binaire dans le dossier requis
    mv HibernateApp HibernateApp.app/Contents/MacOS/
    
    # 3. Installation vers /Applications
    echo "Installing to Applications folder..."
    
    # Nettoyage de l'ancienne version si elle existe
    if [ -d "/Applications/HibernateApp.app" ]; then
        rm -rf "/Applications/HibernateApp.app"
    fi
    
    cp -R HibernateApp.app /Applications/
    
    # 4. Nettoyage local (optionnel)
    rm -rf HibernateApp.app
    
    echo "Hibernate App has been installed to your Applications folder."
    echo "You can now launch it from there."
else
    echo "Build failed. Please check the error messages above."
    exit 1
fi
