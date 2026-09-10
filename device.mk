# Copyright (C) 2025 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/tecno/bf7

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B OTA postinstall (keep this for OTA compatibility)
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (needed for A/B devices)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service \
    bootctrl.mt6761 \
    bootctrl.mt6761.recovery \
    bootctrl

# Update engine (needed for OTA)
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# 🔑 Decryption HALs
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.keymaster@4.1-service \
    vendor.mediatek.hardware.keymaster_attestation@1.1-service \
    vendor.trustonic.tee@1.1-service \
    vendor.trustonic.tee.tui@1.0-service
