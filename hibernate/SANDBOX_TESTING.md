# 🧪 Sandbox Testing Guide

## Safe Testing Without System Changes

This guide explains how to test the Hibernate App in a safe sandbox environment without making any actual system changes.

## 🔒 Sandbox Mode Features

### What Sandbox Mode Does
- **Simulates all commands** - Shows what would be executed
- **No system changes** - Completely safe for testing
- **Realistic feedback** - Same interface as real mode
- **Detailed logging** - Shows exact commands that would run

### What Sandbox Mode Doesn't Do
- ❌ No actual `pmset` commands executed
- ❌ No system settings changed
- ❌ No administrator privileges required
- ❌ No risk to your system

## 🎯 How to Use Sandbox Mode

### Option 1: Use the GUI with Test Mode

1. **Launch the application** (build and run in Xcode)
2. **Toggle "Test Mode (Safe)" to ON** (green switch)
3. **Use the buttons normally**
4. **See simulated results** with 🔒 [TEST MODE] prefix

```
🔵 Enable Hibernate Mode
   → Shows: "🔒 [TEST MODE] Hibernation would be enabled..."
   → Logs: "TEST MODE: Would execute - sudo pmset -a hibernatemode 25"

🔴 Disable Hibernate Mode  
   → Shows: "🔒 [TEST MODE] Hibernation would be disabled..."
   → Logs: "TEST MODE: Would execute - sudo pmset -a hibernatemode 0"

🟢 Put to Sleep Now
   → Shows: "🔒 [TEST MODE] Mac would go to sleep..."
   → Logs: "TEST MODE: Would execute - pmset sleepnow"
```

### Option 2: Use the Sandbox Script

```bash
# Show all available sandbox commands
./test_sandbox.sh

# Simulate enabling hibernation
./test_sandbox.sh enable

# Simulate disabling hibernation  
./test_sandbox.sh disable

# Simulate putting Mac to sleep
./test_sandbox.sh sleep

# Show simulated system state
./test_sandbox.sh state

# Show usage scenarios
./test_sandbox.sh scenarios

# Run all tests
./test_sandbox.sh all
```

## 📊 Sandbox Test Results

### Example Output

```bash
$ ./test_sandbox.sh enable
=== Hibernate App - Sandbox Test Mode ===

🔒 [SANDBOX] Enabling hibernation mode...
   Would execute: sudo pmset -a hibernatemode 25
   Would execute: sudo pmset -a standby 0
   Would execute: sudo pmset -a autopoweroff 0
   Would execute: sudo pmset -a standbydelay 0

✅ [SANDBOX] Hibernation mode would be enabled.
   Your Mac would save state to disk and power off completely.

=== End of Sandbox Test ===
All operations were simulated. No system changes were made.
```

## 🧪 Test Scenarios

### Scenario 1: Basic Functionality Test
```bash
# Test enabling hibernation
./test_sandbox.sh enable

# Test disabling hibernation
./test_sandbox.sh disable

# Test sleep command
./test_sandbox.sh sleep
```

### Scenario 2: Complete Workflow Test
```bash
# Test the full workflow
./test_sandbox.sh all
```

### Scenario 3: GUI Test
```bash
# Build and run in Xcode
# Toggle Test Mode ON
# Click all buttons and verify alerts
```

## 🔍 What to Verify in Sandbox Mode

### GUI Tests
- ✅ Test Mode toggle works (switches between green/red)
- ✅ Buttons show appropriate test mode messages
- ✅ Alerts display with 🔒 [TEST MODE] prefix
- ✅ Interface remains responsive
- ✅ State changes are simulated (isHibernating toggle)

### Command Tests
- ✅ Correct commands are displayed in console
- ✅ All pmset parameters are correct
- ✅ Command sequences are complete
- ✅ No actual system changes occur

### Scenario Tests
- ✅ Laptop battery scenario works
- ✅ Desktop power outage scenario works
- ✅ Regular use scenario works
- ✅ All scenarios show expected behavior

## 🎓 Sandbox vs Real Mode Comparison

| Feature | Sandbox Mode | Real Mode |
|---------|-------------|-----------|
| **System Changes** | ❌ None | ✅ Actual changes |
| **Admin Required** | ❌ No | ✅ Yes |
| **Command Execution** | ❌ Simulated | ✅ Real |
| **Safety** | ✅ 100% Safe | ⚠️ Requires caution |
| **Testing** | ✅ Perfect | ❌ Risky |
| **Feedback** | ✅ Detailed | ✅ Real results |

## 🛡️ When to Use Each Mode

### Use Sandbox Mode When
- ✅ Testing application logic
- ✅ Learning how the app works
- ✅ Demonstrating functionality
- ✅ Developing new features
- ✅ Running automated tests

### Use Real Mode When
- ✅ You want actual hibernation
- ✅ Testing on a real system
- ✅ Final user testing
- ✅ Production use
- ✅ Performance testing

## 🔧 Advanced Sandbox Testing

### Test Edge Cases
```bash
# Test rapid mode switching
./test_sandbox.sh enable
./test_sandbox.sh disable
./test_sandbox.sh enable
./test_sandbox.sh disable
```

### Test Command Sequences
```bash
# Test the complete sequence
./test_sandbox.sh enable
./test_sandbox.sh sleep
./test_sandbox.sh disable
```

### Test Error Handling
```bash
# In GUI mode, toggle rapidly and verify no crashes
# Click buttons multiple times quickly
```

## 📚 Sandbox Testing Benefits

### For Developers
- Safe environment for development
- No risk of system corruption
- Easy to test edge cases
- Fast iteration cycle

### For Testers
- Can test without admin rights
- No impact on real system
- Repeatable test scenarios
- Detailed logging for debugging

### For Users
- Learn how app works safely
- Understand commands before real use
- Build confidence in the app
- See exactly what will happen

## 🎯 Transitioning from Sandbox to Real Mode

### When You're Ready for Real Testing

1. **Understand the commands** - Review what will be executed
2. **Check current settings** - Run `./check_hibernation.sh`
3. **Backup important work** - Just in case
4. **Toggle Test Mode OFF** - Switch to red position
5. **Use buttons normally** - Now makes real changes

### First Real Mode Test
```bash
# Check current state first
./check_hibernation.sh

# Then try in GUI with Test Mode OFF
# Start with enabling hibernation
# Verify it works, then disable it
```

## ⚠️ Important Notes

### Sandbox Limitations
- Cannot test actual hibernation behavior
- Cannot test wake from hibernation
- Cannot test battery impact
- Cannot test performance differences

### Real Mode Requirements
- Administrator privileges required
- Sufficient disk space needed
- May require password entry
- Actual system changes occur

## 🏁 Conclusion

The sandbox mode provides a **completely safe** way to test all aspects of the Hibernate App without any risk to your system. It's perfect for:

- **Developers** - Safe development and testing
- **Testers** - Comprehensive testing without risk
- **Users** - Learning and understanding the app
- **Demonstrations** - Showing functionality safely

Use sandbox mode extensively to understand how the app works, then transition to real mode when you're comfortable with the functionality and ready to make actual system changes.

**Remember**: All sandbox operations are simulated. No system changes are made. It's 100% safe for testing!
