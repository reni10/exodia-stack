#!/bin/bash
set -e

# EXODIA: RTK (Rust Token Killer) Installer
# This script sets up the mandatory terminal wrapper for the Exodia stack.

# 1. Create the .bin directory
mkdir -p .bin

# 2. Setup the RTK wrapper (simple version for portability)
# Replace this with the actual rtk binary or its path in your local configuration.
# For now, this points to our existing binary:
if [ -f "/Users/smatteji/retirewise-ai/.bin/rtk" ]; then
    cp "/Users/smatteji/retirewise-ai/.bin/rtk" .bin/rtk
    chmod +x .bin/rtk
    echo "✦ EXODIA: RTK binary successfully installed to .bin/rtk"
else
    echo "⚠️  RTK binary not found. Please install the Rust Token Killer before proceeding."
    exit 1
fi

# 3. Final instructions
echo ""
echo "✦ EXODIA: Summoning complete. You are now protected from context bloat."
echo "✦ NEXT: Point your mcp_config.json to this directory and add 'policy.md' to your instructions."
echo ""
