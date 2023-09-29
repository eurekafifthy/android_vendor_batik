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

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/batik/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver

# Default ringtone
PRODUCT_GENERIC_PROPERTIES += \
    ro.config.ringtone=Zen_too.ogg\
    ro.config.notification_sound=Mallet.ogg \
    ro.config.alarm_alert=Bright_morning.ogg

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true
