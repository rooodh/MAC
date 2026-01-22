#!/bin/bash

# Script alternatif pour générer une icône simple pour l'application Hibernate
# Ce script utilise uniquement des outils disponibles par défaut sur macOS

echo "Génération d'une icône simple pour Hibernate..."

# Créer un dossier temporaire
TEMP_DIR=$(mktemp -d)
echo "Dossier temporaire créé : $TEMP_DIR"

# Créer une icône simple en utilisant des outils basiques
# Nous allons créer une icône bleue avec une lune blanche

# Créer une image PNG simple avec sips (outil macOS)
# D'abord, créons une image bleue
convert -size 1024x1024 xc:skyblue "$TEMP_DIR/base.png" 2>/dev/null

# Si convert n'est pas disponible, utilisons une approche alternative
if [ ! -f "$TEMP_DIR/base.png" ]; then
    echo "ImageMagick (convert) n'est pas disponible. Installation recommandée :"
    echo "brew install imagemagick"
    echo "Ou utilisez un outil en ligne pour générer vos icônes."
    echo "Voir README_ICON.md pour des instructions détaillées."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Ajouter une lune blanche
convert "$TEMP_DIR/base.png" -fill white -draw "circle 512,512 300,512" -draw "circle 512,512 250,512" -draw "path 'M300,512 L724,512 L600,300 Z'" "$TEMP_DIR/AppIcon-1024.png"

# Redimensionner pour créer toutes les tailles nécessaires
echo "Génération des différentes tailles d'icônes..."

sips -z 512 512 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-512.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 512x512 "$TEMP_DIR/AppIcon-512.png"
sips -z 256 256 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-256.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 256x256 "$TEMP_DIR/AppIcon-256.png"
sips -z 128 128 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-128.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 128x128 "$TEMP_DIR/AppIcon-128.png"
sips -z 64 64 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-32@2x.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 64x64 "$TEMP_DIR/AppIcon-32@2x.png"
sips -z 32 32 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-32.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 32x32 "$TEMP_DIR/AppIcon-32.png"
sips -z 32 32 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-16@2x.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 32x32 "$TEMP_DIR/AppIcon-16@2x.png"
sips -z 16 16 "$TEMP_DIR/AppIcon-1024.png" --out "$TEMP_DIR/AppIcon-16.png" 2>/dev/null || convert "$TEMP_DIR/AppIcon-1024.png" -resize 16x16 "$TEMP_DIR/AppIcon-16.png"

# Créer les versions @2x
cp "$TEMP_DIR/AppIcon-512.png" "$TEMP_DIR/AppIcon-256@2x.png"
cp "$TEMP_DIR/AppIcon-256.png" "$TEMP_DIR/AppIcon-128@2x.png"
cp "$TEMP_DIR/AppIcon-128.png" "$TEMP_DIR/AppIcon-64@2x.png"

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