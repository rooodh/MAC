# Understanding macOS Hibernation Modes

This document explains the different hibernation modes available in macOS and how they work.

## Hibernation Mode Values

macOS uses different hibernation mode values that control how your Mac sleeps:

### Mode 0 (Regular Sleep)
- **Description**: Traditional sleep mode
- **Behavior**: RAM stays powered, system state kept in memory
- **Wake time**: Instant (1-2 seconds)
- **Power usage**: Low (battery drain over time)
- **Recovery**: If power lost, all unsaved work is lost

### Mode 1 (Hibernation)
- **Description**: Traditional hibernation
- **Behavior**: System state saved to disk, RAM powered off
- **Wake time**: Slower (10-30 seconds, depending on disk speed)
- **Power usage**: None (safe for long periods)
- **Recovery**: Full recovery even after power loss

### Mode 3 (Safe Sleep)
- **Description**: Hybrid sleep mode
- **Behavior**: System state saved to disk, RAM stays powered
- **Wake time**: Instant from RAM, falls back to disk if needed
- **Power usage**: Low (but safe if power lost)
- **Recovery**: Full recovery even after power loss

### Mode 25 (Recommended for this app)
- **Description**: Enhanced hybrid sleep
- **Behavior**: System state saved to disk, RAM powered for 3 hours, then hibernates
- **Wake time**: Instant if woken within 3 hours, otherwise from disk
- **Power usage**: Low initially, then none after 3 hours
- **Recovery**: Full recovery in all cases
- **Best for**: Laptops - combines fast wake with safety

## How This App Uses Hibernation Modes

### When "Enable Hibernate Mode" is clicked:
- Sets `hibernatemode` to **25** (enhanced hybrid sleep)
- Disables `standby` and `autopoweroff` for immediate hibernation
- Your Mac will save state to disk and can power off completely

### When "Disable Hibernate Mode" is clicked:
- Sets `hibernatemode` to **0** (regular sleep)
- Enables normal standby behavior
- Your Mac will use traditional sleep with RAM powered

## Technical Details

### Hibernation File
- Location: `/var/vm/sleepimage`
- Size: Approximately equal to your RAM size
- Can be compressed on newer macOS versions

### Commands Used
```bash
# Check current hibernation mode
pmset -g | grep hibernatemode

# Enable hibernation (mode 25)
./execute_with_sudo.sh pmset -a hibernatemode 25
./execute_with_sudo.sh pmset -a standby 0
./execute_with_sudo.sh pmset -a autopoweroff 0

# Disable hibernation (mode 0)
./execute_with_sudo.sh pmset -a hibernatemode 0
./execute_with_sudo.sh pmset -a standby 1
./execute_with_sudo.sh pmset -a autopoweroff 1

# Put to sleep immediately
pmset sleepnow
```

## Troubleshooting

### "Not enough disk space for hibernation"
- The sleepimage file needs space equal to your RAM
- Free up disk space or reduce RAM usage

### "Hibernation not working"
- Check if your Mac supports hibernation (most modern Macs do)
- Verify file system permissions
- Check for sufficient battery level (if on battery)

### "Slow wake from hibernation"
- This is normal for mode 25 after 3 hours
- Consider using mode 3 if you want faster wake but still safe

## Recommendations

- **For desktops**: Mode 0 (regular sleep) is usually fine
- **For laptops on battery**: Mode 25 (enhanced hybrid) is ideal
- **For long-term storage**: Mode 1 (full hibernation) is safest
- **For maximum battery life**: Mode 25 with short standby delay

This app uses mode 25 by default as it provides the best balance between fast wake times and data safety.
