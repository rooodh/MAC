#!/bin/bash

# Script pour générer une icône temporaire pour l'application Hibernate

echo "Génération d'une icône temporaire pour Hibernate..."

# Créer un dossier temporaire
TEMP_DIR=$(mktemp -d)
echo "Dossier temporaire créé : $TEMP_DIR"

# Créer une icône simple avec un fond bleu et une lune blanche
# Nous allons créer une icône 1024x1024 et la redimensionner

# Créer l'icône source 1024x1024
convert -size 1024x1024 xc:skyblue -fill white -draw "circle 512,512 300,512" -draw "circle 512,512 250,512" -draw "path 'M300,512 L724,512 L600,300 Z'" "$TEMP_DIR/AppIcon-1024.png"

# Redimensionner pour créer toutes les tailles nécessaires
convert "$TEMP_DIR/AppIcon-1024.png" -resize 512x512 "$TEMP_DIR/AppIcon-512.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 256x256 "$TEMP_DIR/AppIcon-256.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 128x128 "$TEMP_DIR/AppIcon-128.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 64x64 "$TEMP_DIR/AppIcon-32@2x.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 32x32 "$TEMP_DIR/AppIcon-32.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 32x32 "$TEMP_DIR/AppIcon-16@2x.png"
convert "$TEMP_DIR/AppIcon-1024.png" -resize 16x16 "$TEMP_DIR/AppIcon-16.png"

# Copier les icônes dans le dossier du projet
echo "Copie des icônes dans Assets.xcassets/AppIcon.appiconset/..."

# Créer le dossier s'il n'existe pas
mkdir -p Assets.xcassets/AppIcon.appiconset

# Copier les fichiers
cp "$TEMP_DIR/AppIcon-16.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-16@2x.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-32.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-32@2x.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-128.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-128@2x.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-256.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-256@2x.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-512.png" Assets.xcassets/AppIcon.appiconset/
cp "$TEMP_DIR/AppIcon-512@2x.png" Assets.xcassets/AppIcon.appiconset/

echo "Icônes temporaires générées avec succès !"
echo "Vous pouvez maintenant reconstruire l'application avec : ./build_and_install.sh"

# Nettoyer le dossier temporaire
rm -rf "$TEMP_DIR"

echo "Script terminé."