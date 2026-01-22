# Guide pour ajouter une icône à l'application Hibernate

## Problème actuel

Les fichiers d'icônes dans `Assets.xcassets/AppIcon.appiconset/` sont vides (0 octets), ce qui explique pourquoi vous ne voyez pas l'icône de l'application.

## Solution

### Méthode 1: Utiliser des icônes existantes

1. **Téléchargez ou créez des icônes** au format PNG avec les tailles suivantes :
   - AppIcon-16.png (16x16)
   - AppIcon-16@2x.png (32x32)
   - AppIcon-32.png (32x32)
   - AppIcon-32@2x.png (64x64)
   - AppIcon-128.png (128x128)
   - AppIcon-128@2x.png (256x256)
   - AppIcon-256.png (256x256)
   - AppIcon-256@2x.png (512x512)
   - AppIcon-512.png (512x512)
   - AppIcon-512@2x.png (1024x1024)

2. **Remplacez les fichiers vides** dans `Assets.xcassets/AppIcon.appiconset/` par vos icônes.

3. **Vérifiez le fichier Contents.json** pour vous assurer qu'il référence correctement vos icônes.

### Méthode 2: Générer des icônes automatiquement

1. **Créez une image source** (de préférence 1024x1024 pixels) au format PNG.

2. **Utilisez un outil comme** [IconKit](https://itunes.apple.com/us/app/iconkit-icon-resizer-for-app/id507135296) ou [Image2Icon](https://itunes.apple.com/us/app/image2icon/id1165603373) pour générer toutes les tailles nécessaires.

3. **Copiez les icônes générées** dans `Assets.xcassets/AppIcon.appiconset/` en remplaçant les fichiers existants.

### Méthode 3: Utiliser un site web de génération d'icônes

1. Allez sur un site comme [https://appicon.co/](https://appicon.co/) ou [https://makeappicon.com/](https://makeappicon.com/)

2. Téléchargez votre image source

3. Téléchargez le pack d'icônes généré

4. Extrayez le contenu et copiez les fichiers dans `Assets.xcassets/AppIcon.appiconset/`

## Après avoir ajouté les icônes

1. **Nettoyez le projet** :
   ```bash
   ./build_and_install.sh clean
   ```

2. **Reconstruisez l'application** :
   ```bash
   ./build_and_install.sh
   ```

3. **Vérifiez que l'icône apparaît** dans le Finder et dans le Dock.

## Conseils pour créer une bonne icône

- Utilisez une image carrée (1024x1024 pixels pour la meilleure qualité)
- Évitez les détails trop fins qui ne seront pas visibles en petite taille
- Utilisez des couleurs contrastées pour une meilleure visibilité
- L'icône devrait représenter le concept d'hibernation (une lune, un ours qui dort, etc.)

## Si vous ne voulez pas créer d'icône

Vous pouvez utiliser une icône par défaut en supprimant la référence à l'icône dans le fichier Info.plist, mais ce n'est pas recommandé car votre application aura une icône générique peu attrayante.