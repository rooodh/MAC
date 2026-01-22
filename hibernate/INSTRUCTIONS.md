# Hibernate App - User Instructions

Welcome to Hibernate App! This guide will help you get started with managing your Mac's hibernation settings.

## Quick Start Guide

### 1. Building the Application

You have two options to use this app:

#### Option A: Build with Xcode (Recommended)
1. Open `HibernateApp.xcodeproj` in Xcode
2. Click the "Run" button (or press ⌘+R)
3. Xcode will build and launch the application

#### Option B: Use the Build Script
1. Open Terminal
2. Navigate to this folder: `cd /path/to/hibernate`
3. Run: `./build_and_install.sh`
4. The app will be installed in your Applications folder

### 2. Using the Application

Once launched, you'll see a simple interface with three buttons:

#### 🔵 Enable Hibernate Mode
- **What it does**: Configures your Mac to use hibernation mode
- **Effect**: Your Mac will save its entire state to disk when sleeping
- **Best for**: When you want maximum battery life and safety
- **Note**: Requires administrator password

#### 🔴 Disable Hibernate Mode  
- **What it does**: Returns your Mac to regular sleep mode
- **Effect**: Your Mac will use traditional sleep (faster wake, but uses battery)
- **Best for**: When you're using your Mac frequently and want fast wake
- **Note**: Requires administrator password

#### 🟢 Put to Sleep Now
- **What it does**: Immediately puts your Mac to sleep
- **Effect**: Uses whatever sleep mode is currently active
- **Best for**: When you want to sleep your Mac right away

### 3. Understanding the Modes

| Mode | Name | Wake Time | Battery Use | Safety |
|------|------|-----------|-------------|--------|
| 0 | Regular Sleep | Instant (1-2s) | Low | ❌ Lost if power off |
| 25 | Hibernate | Slow (10-30s) | None | ✅ Safe |

### 4. Recommended Usage

#### For Laptop Users
- **When on battery**: Enable Hibernate Mode for maximum battery life
- **When plugged in**: Use Regular Sleep for convenience
- **Before travel**: Enable Hibernate Mode to ensure your work is safe

#### For Desktop Users
- **Normal use**: Regular Sleep is usually fine
- **Before power outages**: Enable Hibernate Mode for safety

### 5. Command Line Alternative

If you prefer using Terminal, you can use the included shell script:

```bash
# Check current settings
./check_hibernation.sh

# Enable hibernation (requires sudo)
./execute_with_sudo.sh pmset -a hibernatemode 25

# Disable hibernation (requires sudo)
./execute_with_sudo.sh pmset -a hibernatemode 0

# Put to sleep immediately
./hibernate.sh sleep
```

### 6. Troubleshooting

#### "Operation not permitted" or "Permission denied"
- The app needs administrator privileges to change hibernation settings
- Make sure to allow the app in System Preferences > Security & Privacy

#### App doesn't launch
- Make sure you built it correctly in Xcode
- Check that you have macOS 12.0 or later

#### Hibernation not working
- Check that you have enough free disk space (equal to your RAM size)
- Verify your Mac supports hibernation (most modern Macs do)
- Run `./check_hibernation.sh` to see current settings

### 7. Advanced Tips

#### Create a Desktop Shortcut
1. Build and install the app
2. Drag HibernateApp from Applications to your Desktop
3. Double-click to launch quickly

#### Add to Login Items
1. Open System Preferences > Users & Groups
2. Go to Login Items tab
3. Click "+" and add HibernateApp
4. Now it launches automatically at startup

#### Use Keyboard Shortcuts
1. Launch the app
2. Use ⌘+1, ⌘+2, ⌘+3 for the three buttons (if supported)

### 8. Safety Information

- **Hibernation is safe**: Your Mac will wake up exactly as you left it
- **No data loss**: Even if battery dies completely, your work is saved
- **Automatic recovery**: macOS handles hibernation automatically

### 9. Uninstalling

To remove the application:
1. Drag HibernateApp from Applications to Trash
2. Empty the Trash
3. Your hibernation settings will remain as you last set them

## Support

If you encounter any issues:
1. Check the README.md file
2. Run `./check_hibernation.sh` for diagnostics
3. Consult HIBERNATION_MODES.md for technical details

Enjoy using Hibernate App! Your Mac's battery life and data safety are now under your control.
