#!/bin/bash
set -e

DEVICE=bf7
VENDOR=tecno

# Path to your device tree
MY_DIR="$(cd "$(dirname "$0")" && pwd)"
ANDROID_ROOT="$MY_DIR"/../../..

# Use helper script from AOSP/TWRP build system
HELPER="$ANDROID_ROOT"/vendor/twrp/build/tools/extract_utils.sh
source "$HELPER"

# Default to pulling from a connected device
SRC=${SRC:-adb}

# Read proprietary-files.txt and extract blobs
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" false
extract "$MY_DIR"/proprietary-files.txt "$SRC"
