#!/bin/bash
set -e

DEVICE=bf7
VENDOR=tecno

MY_DIR="$(cd "$(dirname "$0")" && pwd)"
ANDROID_ROOT="$MY_DIR"/../../..

HELPER="$ANDROID_ROOT"/vendor/twrp/build/tools/extract_utils.sh
source "$HELPER"

# Generate vendor makefiles based on proprietary-files.txt
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" false
write_headers
write_makefiles "$MY_DIR"/proprietary-files.txt true
write_footers
