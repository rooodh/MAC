# 🚀 Quick Start Guide

## Get Started in 3 Simple Steps

### 1️⃣ Build the App

**Option A: Using Xcode (Recommended)**
```bash
# Open the project in Xcode
open HibernateApp.xcodeproj

# Press ⌘+R to build and run
```

**Option B: Using Terminal**
```bash
# Make the build script executable
chmod +x build_and_install.sh

# Run the build script
./build_and_install.sh
```

### 2️⃣ Launch the App

- Find "HibernateApp" in your Applications folder
- Double-click to launch
- Or run from Xcode after building

### 3️⃣ Use the App

```
🔵 Enable Hibernate Mode
   → Your Mac will hibernate to disk (safe, no battery drain)

🔴 Disable Hibernate Mode  
   → Your Mac will use regular sleep (fast wake, some battery use)

🟢 Put to Sleep Now
   → Immediately sleep using current mode
```

## 🎯 Common Use Cases

### For Laptop Users
```bash
# Before closing lid for travel
1. Click "Enable Hibernate Mode"
2. Click "Put to Sleep Now"
3. Safe even if battery dies!

# When working at desk (plugged in)
1. Click "Disable Hibernate Mode"
2. Enjoy fast wake times
```

### For Desktop Users
```bash
# Before power outage expected
1. Click "Enable Hibernate Mode"
2. Click "Put to Sleep Now"
3. Safe even if power cuts

# Normal use
1. Click "Disable Hibernate Mode"
2. Use regular sleep
```

## 🔧 Command Line Quick Reference

```bash
# Check current hibernation settings
./check_hibernation.sh

# Enable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 25

# Disable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 0

# Sleep immediately
./hibernate.sh sleep

# Check current mode
pmset -g | grep hibernatemode
```

## ⚡ Quick Tips

- **Hibernation saves battery** - Use when on battery power
- **Regular sleep is faster** - Use when plugged in
- **All work is preserved** - Safe in both modes
- **Admin password required** - For changing modes
- **One-click operation** - Simple and fast

## 📊 Mode Comparison

| Action | Wake Time | Battery Use | Safety |
|-------|-----------|-------------|--------|
| Enable Hibernate | ~10-30s | None | ✅ Safe |
| Disable Hibernate | ~1-2s | Low | ❌ Lost if power off |

## 🎓 Learn More

- Read `INSTRUCTIONS.md` for detailed guide
- Read `HIBERNATION_MODES.md` for technical details
- Read `README.md` for project overview

Enjoy your new hibernation control! 🚀
