#!/bin/bash

# Test script to check current sleep mode
echo "Testing sleep mode detection..."

# Check current hibernation mode
echo "Current hibernation settings:"
pmset -g | grep hibernatemode

echo ""
echo "Testing regex pattern:"
pmset -g | grep hibernatemode | grep -oE "hibernatemode\s+(\d+)"

# Test different modes
echo ""
echo "Testing mode parsing:"
MODE=$(pmset -g | grep -oE "hibernatemode\s+(\d+)" | grep -oE "\d+")
echo "Detected mode: $MODE"

case $MODE in
    0)
        echo "Mode 0: Normal Sleep (RAM only)"
        ;;
    1|5|7)
        echo "Mode $MODE: Safe Sleep (RAM + Disk)"
        ;;
    3)
        echo "Mode 3: Hibernate (Disk only)"
        ;;
    25)
        echo "Mode 25: Deep Hibernate (Disk only, no RAM)"
        ;;
    *)
        echo "Unknown mode: $MODE"
        ;;
esac