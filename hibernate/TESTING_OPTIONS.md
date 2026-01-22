# 🧪 Testing Options for Hibernate App

## Choose the Right Testing Method for Your Needs

This guide helps you choose the best way to test the Hibernate App based on your goals and comfort level.

## 🎯 Testing Methods Overview

| Method | Safety | Complexity | Requirements | Best For |
|--------|--------|------------|--------------|----------|
| **Sandbox GUI** | ✅ 100% Safe | ⭐ Easy | None | Learning, Development |
| **Sandbox Script** | ✅ 100% Safe | ⭐ Easy | Terminal | CLI Testing, Automation |
| **Real GUI** | ⚠️ System Changes | ⭐⭐ Medium | Admin Rights | Final Testing |
| **Real CLI** | ⚠️ System Changes | ⭐⭐ Medium | Admin Rights | Advanced Users |

## 🔍 Detailed Testing Options

### 1. Sandbox GUI Mode (Recommended for Beginners)

**How to Use:**
```bash
# Build and run in Xcode
open HibernateApp.xcodeproj
# Press ⌘+R to run
```

**Features:**
- ✅ Visual interface with Test Mode toggle
- ✅ Realistic button interactions
- ✅ Detailed alerts with test mode indication
- ✅ Console logging of simulated commands
- ✅ No system changes made

**Best For:**
- Learning how the app works
- Testing UI/UX design
- Understanding the workflow
- Safe experimentation

### 2. Sandbox Script Mode (Recommended for Developers)

**How to Use:**
```bash
# Make script executable
chmod +x test_sandbox.sh

# Run tests
./test_sandbox.sh enable
./test_sandbox.sh disable  
./test_sandbox.sh sleep
./test_sandbox.sh all
```

**Features:**
- ✅ Command-line interface
- ✅ Detailed command simulation
- ✅ Scenario testing
- ✅ Batch testing capability
- ✅ No system changes made

**Best For:**
- Automated testing
- CI/CD integration
- Script development
- Quick command verification

### 3. Real GUI Mode (For Final Testing)

**How to Use:**
```bash
# Build and run in Xcode
open HibernateApp.xcodeproj
# Press ⌘+R to run
# Toggle Test Mode OFF (red position)
```

**Features:**
- ✅ Actual system changes
- ✅ Real hibernation functionality
- ✅ Admin password prompt
- ✅ Real performance testing
- ✅ Full functionality

**Requirements:**
- Administrator privileges
- Sufficient disk space
- Understanding of hibernation

**Best For:**
- Final user testing
- Performance evaluation
- Real-world usage testing
- Production readiness

### 4. Real CLI Mode (For Advanced Users)

**How to Use:**
```bash
# Enable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 25

# Disable hibernation (requires admin)
./execute_with_sudo.sh pmset -a hibernatemode 0

# Put to sleep immediately
./hibernate.sh sleep

# Check current settings
./check_hibernation.sh
```

**Features:**
- ✅ Direct system control
- ✅ Scriptable operations
- ✅ Batch processing
- ✅ Automation friendly
- ✅ Full system integration

**Requirements:**
- Terminal familiarity
- Administrator privileges
- Command-line comfort

**Best For:**
- Advanced users
- System administrators
- Automation scripts
- Remote management

## 📊 Testing Progression Recommendation

```
1. Start with Sandbox GUI → Learn the interface
2. Try Sandbox Script → Understand commands
3. Use Real GUI → Test real functionality
4. Use Real CLI → Advanced control
```

## 🧪 Test Scenarios by Method

### Sandbox GUI Tests
```
✅ Test Mode toggle functionality
✅ Button click responses
✅ Alert messages and formatting
✅ Interface responsiveness
✅ Visual feedback
```

### Sandbox Script Tests
```
✅ Command simulation accuracy
✅ Parameter validation
✅ Error handling
✅ Scenario testing
✅ Batch processing
```

### Real GUI Tests
```
✅ Actual hibernation enable/disable
✅ Sleep functionality
✅ Wake from hibernation
✅ Performance testing
✅ Battery impact
```

### Real CLI Tests
```
✅ Command execution
✅ Parameter effects
✅ System integration
✅ Automation scripts
✅ Remote management
```

## 🛡️ Safety Comparison

### Safe Operations (No Risk)
- Sandbox GUI Mode
- Sandbox Script Mode
- Reading current settings
- Checking documentation

### Caution Required (System Changes)
- Real GUI Mode (Test Mode OFF)
- Real CLI commands
- Changing hibernation settings
- Putting system to sleep

## 🎓 When to Use Each Method

### Use Sandbox GUI When...
- You're new to the application
- You want to learn the interface
- You're testing UI changes
- You want visual feedback
- You're demonstrating the app

### Use Sandbox Script When...
- You prefer command-line tools
- You're writing automated tests
- You want to test command sequences
- You're integrating with other scripts
- You need batch processing

### Use Real GUI When...
- You're ready for real testing
- You want to test actual hibernation
- You're evaluating performance
- You're preparing for production
- You want the full experience

### Use Real CLI When...
- You're comfortable with Terminal
- You need advanced control
- You're writing automation scripts
- You're managing remote systems
- You prefer command-line tools

## 🔧 Advanced Testing Strategies

### Combined Testing Approach
```bash
# 1. Start with sandbox GUI to learn interface
# 2. Use sandbox script for command testing
# 3. Check current system state
./check_hibernation.sh
# 4. Try real GUI with caution
# 5. Use real CLI for advanced control
```

### Regression Testing
```bash
# Create test script
cat > regression_test.sh << 'EOF'
#!/bin/bash
echo "Running regression tests..."
./test_sandbox.sh enable
./test_sandbox.sh sleep
./test_sandbox.sh disable
echo "All tests passed!"
EOF

chmod +x regression_test.sh
./regression_test.sh
```

### Performance Testing
```bash
# Test wake times (real mode only)
echo "Testing wake performance..."
# Enable hibernation
./execute_with_sudo.sh pmset -a hibernatemode 25
# Put to sleep and time wake
time ./hibernate.sh sleep
# Note: This requires manual wake and timing
```

## 📚 Testing Resources

### Documentation
- `SANDBOX_TESTING.md` - Complete sandbox guide
- `README.md` - Project overview
- `INSTRUCTIONS.md` - User instructions
- `HIBERNATION_MODES.md` - Technical details

### Tools
- `test_sandbox.sh` - Sandbox testing script
- `check_hibernation.sh` - System state checker
- `hibernate.sh` - Real hibernation control

### Xcode Features
- Preview mode for SwiftUI
- Debug console for logging
- Breakpoints for code inspection
- Performance tools

## 🏁 Choosing Your Testing Path

### For Beginners
```
Start with Sandbox GUI → Learn interface → Try Sandbox Script → Understand commands
```

### For Developers
```
Use Sandbox Script → Test logic → Try Sandbox GUI → Verify UI → Use Real GUI cautiously
```

### For Advanced Users
```
Use Real CLI → Test commands → Verify with check_hibernation.sh → Use Real GUI for full testing
```

### For System Administrators
```
Use Real CLI → Automate tasks → Integrate with scripts → Use Sandbox for safe testing
```

## ⚠️ Important Safety Reminders

### Always Remember
- Sandbox modes are **100% safe** - no system changes
- Real modes **change your system** - use with caution
- Hibernation affects **power management** - understand the impact
- Administrator privileges **required** for real changes

### Before Using Real Mode
1. Read all documentation
2. Understand the commands
3. Check current settings
4. Backup important work
5. Start with sandbox testing

## 🎯 Final Recommendation

**Start with sandbox testing, then progress to real testing when comfortable:**

```
🟢 Sandbox GUI → Safe learning
🟢 Sandbox Script → Safe command testing  
🟡 Real GUI → Cautious real testing
🔴 Real CLI → Advanced users only
```

Choose the testing method that best fits your experience level and testing goals. The sandbox options provide completely safe environments for learning and development, while the real modes offer full functionality for final testing and production use.
