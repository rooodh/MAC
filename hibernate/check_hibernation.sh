#!/bin/bash

# Script to check current hibernation settings

echo "=== Current Hibernation Settings ==="
echo ""

# Get hibernation mode
HIBERNATE_MODE=$(pmset -g | grep hibernatemode | awk '{print $2}')
echo "Hibernation Mode: $HIBERNATE_MODE"

# Interpret the mode
case "$HIBERNATE_MODE" in
    0)
        echo "  → Regular sleep (RAM powered, no disk save)"
        ;;
    1)
        echo "  → Full hibernation (disk only, RAM off)"
        ;;
    3)
        echo "  → Safe sleep (RAM + disk, instant wake)"
        ;;
    25)
        echo "  → Enhanced hybrid (RAM for 3h, then disk)"
        ;;
    *)
        echo "  → Unknown mode"
        ;;
esac

echo ""

# Get standby setting
STANDBY=$(pmset -g | grep standby | awk '{print $2}')
echo "Standby: $STANDBY"
if [ "$STANDBY" -eq 0 ]; then
    echo "  → Disabled (no automatic hibernation)"
else
    echo "  → Enabled (automatic hibernation after delay)"
fi

echo ""

# Get autopoweroff setting
AUTOPOWEROFF=$(pmset -g | grep autopoweroff | awk '{print $2}')
echo "Auto Power Off: $AUTOPOWEROFF"
if [ "$AUTOPOWEROFF" -eq 0 ]; then
    echo "  → Disabled"
else
    echo "  → Enabled"
fi

echo ""

# Get standbydelay
STANDBYDELAY=$(pmset -g | grep standbydelay | awk '{print $2}')
echo "Standby Delay: $STANDBYDELAY seconds"
if [ "$STANDBYDELAY" -gt 0 ]; then
    echo "  → Will hibernate after $((STANDBYDELAY / 60)) minutes"
else
    echo "  → No delay (immediate or disabled)"
fi

echo ""

# Check sleepimage size
if [ -f /var/vm/sleepimage ]; then
    SLEEPIMAGE_SIZE=$(du -h /var/vm/sleepimage | cut -f1)
    echo "Sleep Image Size: $SLEEPIMAGE_SIZE"
else
    echo "Sleep Image: Not found"
fi

echo ""

# Show recommendation based on current settings
if [ "$HIBERNATE_MODE" -eq 25 ] && [ "$STANDBY" -eq 0 ]; then
    echo "✅ Your Mac is configured for hibernation mode."
    echo "   It will save state to disk and can power off completely."
elif [ "$HIBERNATE_MODE" -eq 0 ]; then
    echo "⚠️  Your Mac is using regular sleep mode."
    echo "   Consider enabling hibernation for better battery life and safety."
else
    echo "ℹ️  Your Mac is using a hybrid sleep configuration."
fi

echo ""
echo "=== End of Report ==="
