# Guide d'utilisation des améliorations Hibernate

## Résumé des améliorations apportées

### 1. ✅ Suppression des messages en mode fenêtre
- **Problème résolu** : Plus de messages intrusifs lors des changements d'état
- **Comportement actuel** : Les changements d'état sont silencieux et instantanés
- **Où** : Dans toutes les fonctions (enableHibernation, disableHibernation, putToSleep)

### 2. ✅ Réduction de la taille de l'interface
- **Problème résolu** : Interface trop large (2x trop grande)
- **Solution** : Taille réduite de 300x400 à 250x350 pixels
- **Résultat** : Interface plus compacte et mieux proportionnée

### 3. ⚠️ Problème de l'icône manquante
- **Problème identifié** : Les fichiers d'icônes sont vides (0 octets)
- **Solution proposée** : Plusieurs méthodes pour ajouter une icône

## Comment utiliser les améliorations

### Étape 1 : Construire et installer l'application

Vous avez deux options pour construire l'application :

#### Option A : Utiliser le script original (simple)
```bash
./build_and_install.sh
```

#### Option B : Utiliser le script amélioré (recommandé pour les icônes)
```bash
./build_and_install_improved.sh
```

Le script amélioré gère mieux les assets et les icônes.

### Étape 2 : Tester les améliorations

1. **Lancez l'application** depuis le dossier Applications
2. **Vérifiez la taille de l'interface** : Elle devrait être plus compacte
3. **Testez les changements d'état** :
   - Activez/désactivez l'hibernation en mode test
   - Activez/désactivez l'hibernation en mode réel
   - Utilisez le bouton "Put to Sleep Now"
4. **Confirmez** : Aucun message ne devrait apparaître lors des changements

### Étape 3 : Ajouter une icône (optionnel mais recommandé)

Vous avez plusieurs options pour ajouter une icône :

#### Option A : Utiliser le script de génération d'icône (nécessite ImageMagick)
```bash
# Installer ImageMagick si ce n'est pas déjà fait
brew install imagemagick

# Générer une icône temporaire
./generate_simple_icon.sh

# Reconstruire l'application
./build_and_install_improved.sh
```

#### Option B : Créer vos propres icônes
1. Suivez les instructions dans `README_ICON.md`
2. Placez vos icônes dans `Assets.xcassets/AppIcon.appiconset/`
3. Reconstruisez l'application

#### Option C : Utiliser un outil en ligne
1. Allez sur [https://appicon.co/](https://appicon.co/)
2. Téléchargez une image (par exemple une lune ou un ours)
3. Téléchargez le pack d'icônes généré
4. Extrayez et copiez les fichiers dans `Assets.xcassets/AppIcon.appiconset/`
5. Reconstruisez l'application

### Étape 4 : Rafraîchir l'icône (si nécessaire)

Si l'icône ne s'affiche pas immédiatement après l'avoir ajoutée :

```bash
# Méthode 1 : Redémarrer le Finder
killall Finder

# Méthode 2 : Reconstruire la base de données Launch Services
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Méthode 3 : Se déconnecter et se reconnecter
```

## Dépannage

### Problème : L'interface est toujours trop grande
**Solution** : 
- Vérifiez que vous utilisez bien la dernière version de `ContentView.swift`
- Assurez-vous que la ligne `.frame(width: 250, height: 350)` est bien présente
- Nettoyez et reconstruisez : `./build_and_install.sh clean` puis `./build_and_install.sh`

### Problème : Les messages apparaissent toujours
**Solution** :
- Vérifiez que vous avez bien supprimé les lignes `alertMessage = ...` et `showAlert = true`
- Assurez-vous d'utiliser la dernière version du code
- Les alertes d'erreur (en cas de problème) sont normales et doivent rester

### Problème : L'icône ne s'affiche toujours pas
**Solution** :
- Vérifiez que les fichiers dans `Assets.xcassets/AppIcon.appiconset/` ne sont pas vides
- Utilisez `ls -lh Assets.xcassets/AppIcon.appiconset/` pour vérifier les tailles
- Assurez-vous d'utiliser `build_and_install_improved.sh` au lieu de `build_and_install.sh`
- Essayez les méthodes de rafraîchissement ci-dessus

### Problème : L'application ne se compile pas
**Solution** :
- Vérifiez que vous avez Xcode ou les outils de développement installés
- Essayez `xcode-select --install` pour installer les outils de base
- Vérifiez les messages d'erreur spécifiques

## Fichiers modifiés et créés

### Fichiers modifiés
- `ContentView.swift` : Interface réduite et messages supprimés

### Fichiers créés
- `README_ICON.md` : Guide pour ajouter une icône
- `generate_simple_icon.sh` : Script pour générer une icône temporaire
- `build_and_install_improved.sh` : Script de build amélioré
- `CHANGES_SUMMARY.md` : Résumé des modifications
- `USAGE_GUIDE.md` : Ce guide (que vous êtes en train de lire)

## Conseils supplémentaires

### Pour une expérience optimale
1. **Utilisez toujours le mode test** pour essayer les fonctionnalités sans risque
2. **Passez en mode réel** uniquement lorsque vous êtes prêt à modifier les paramètres système
3. **Sauvegardez vos paramètres** avant de faire des changements en mode réel

### Personnalisation avancée
Si vous voulez aller plus loin, vous pouvez :
- Modifier les couleurs dans `ContentView.swift`
- Ajouter plus d'informations sur les différents modes d'hibernation
- Implémenter un système de sauvegarde/restauration des paramètres
- Ajouter des animations pour une expérience plus fluide

## Support

Si vous rencontrez des problèmes ou avez des questions :

1. **Vérifiez d'abord** les fichiers de log et les messages d'erreur
2. **Consultez** les guides fournis (`README_ICON.md`, `CHANGES_SUMMARY.md`)
3. **Essayez** les solutions de dépannage ci-dessus
4. **N'hésitez pas** à demander de l'aide pour des problèmes spécifiques

Bon hibernation ! 🌙💤