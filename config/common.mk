# Copyright (C) 2023 Batik OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_BRAND ?= BatikOS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/batik/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/batik/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/batik/prebuilt/common/bin/50-batik.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-batik.sh \
    vendor/batik/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/batik/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/batik/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/batik/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Copy all Batik-specific init rc files
$(foreach f,$(wildcard vendor/batik/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl
	
#Recorder Permissions
PRODUCT_COPY_FILES += \
    vendor/batik/config/permissions/privapp-permissions-recorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-recorder.xml \
    vendor/batik/config/permissions/org.pixelexperience.recorder.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.pixelexperience.recorder.xml

#Batik Permissions
PRODUCT_COPY_FILES += \
    vendor/batik/config/permissions/privapp-permissions-batik-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-batik.xml \

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/batik/overlay/dictionaries

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/batik/overlay

#Telephony
$(call inherit-product, vendor/batik/config/telephony.mk)

# Packages
include vendor/batik/config/packages.mk

#versioning
include vendor/batik/config/version.mk


