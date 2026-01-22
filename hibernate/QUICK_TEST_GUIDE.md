# ⚡ Quick Test Guide

## Test the Hibernate App in 30 Seconds

### 🟢 Safe Sandbox Testing (No System Changes)

#### Option 1: GUI Sandbox (Easiest)
```bash
# 1. Open project in Xcode
open HibernateApp.xcodeproj

# 2. Press ⌘+R to run

# 3. Toggle "Test Mode (Safe)" to ON (green)

# 4. Click buttons and see simulated results
🔵 Enable Hibernate Mode → Shows what would happen
🔴 Disable Hibernate Mode → Shows what would happen  
🟢 Put to Sleep Now → Shows what would happen
```

#### Option 2: CLI Sandbox (Quick)
```bash
# Run sandbox tests
./test_sandbox.sh enable
./test_sandbox.sh sleep
./test_sandbox.sh disable
```

### 🟡 Real Testing (System Changes)

#### Option 1: GUI Real Mode
```bash
# 1. Open project in Xcode
open HibernateApp.xcodeproj

# 2. Press ⌘+R to run

# 3. Toggle "Test Mode (Safe)" to OFF (red)

# 4. Click buttons (requires admin password)
🔵 Enable Hibernate Mode → Actually enables hibernation
🔴 Disable Hibernate Mode → Actually disables hibernation
🟢 Put to Sleep Now → Actually puts Mac to sleep
```

#### Option 2: CLI Real Mode
```bash
# Enable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 25

# Put to sleep
./hibernate.sh sleep

# Disable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 0
```

## 📊 Quick Test Results

### Sandbox Mode (Safe)
```
✅ No system changes
✅ No admin required
✅ Shows exact commands
✅ Perfect for learning
```

### Real Mode (Caution)
```
⚠️ Changes system settings
⚠️ Requires admin password
⚠️ Actual hibernation occurs
⚠️ Use with caution
```

## 🎯 Recommended Test Sequence

```
1️⃣  Start with GUI Sandbox → Learn interface
2️⃣  Try CLI Sandbox → Understand commands
3️⃣  Check current settings → ./check_hibernation.sh
4️⃣  Use GUI Real Mode → Test carefully
5️⃣  Use CLI Real Mode → Advanced control
```

## ⚡ Quick Commands Cheat Sheet

### Safe Commands (No Risk)
```bash
# Sandbox testing
./test_sandbox.sh enable
./test_sandbox.sh disable
./test_sandbox.sh sleep
./test_sandbox.sh all

# Check current settings (safe)
./check_hibernation.sh

# Build and run in Xcode (safe)
open HibernateApp.xcodeproj
```

### Real Commands (Caution)
```bash
# Enable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 25

# Disable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 0

# Put to sleep immediately
./hibernate.sh sleep

# Build and install
./build_and_install.sh
```

## 🛡️ Safety Reminders

```
✅ Sandbox mode = 100% safe
⚠️  Real mode = system changes
🔒 Always start with sandbox
📖 Read documentation first
```

## 🎓 Learn More

```
📚 Full docs: README.md
🧪 Sandbox guide: SANDBOX_TESTING.md
🔧 Testing options: TESTING_OPTIONS.md
📋 Instructions: INSTRUCTIONS.md
💤 Hibernation modes: HIBERNATION_MODES.md
```

**Start testing safely with sandbox mode, then progress to real mode when ready!**
