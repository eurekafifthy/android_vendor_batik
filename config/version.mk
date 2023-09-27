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

#Batik OS Versioning :
BATIK_MOD_VERSION = Alpha

ifndef BATIK_BUILD_TYPE
    BATIK_BUILD_TYPE := UNOFFICIAL
endif

# Test Build Tag
ifeq ($(BATIK_TEST),true)
    BATIK_BUILD_TYPE := DEVELOPER
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
BATIK_DATE_YEAR := $(shell date -u +%Y)
BATIK_DATE_MONTH := $(shell date -u +%m)
BATIK_DATE_DAY := $(shell date -u +%d)
BATIK_DATE_HOUR := $(shell date -u +%H)
BATIK_DATE_MINUTE := $(shell date -u +%M)
BATIK_BUILD_DATE_UTC := $(shell date -d '$(BATIK_DATE_YEAR)-$(BATIK_DATE_MONTH)-$(BATIK_DATE_DAY) $(BATIK_DATE_HOUR):$(BATIK_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(BATIK_DATE_YEAR)$(BATIK_DATE_MONTH)$(BATIK_DATE_DAY)-$(BATIK_DATE_HOUR)$(BATIK_DATE_MINUTE)


ifeq ($(BATIK_OFFICIAL), true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/Batik-OS/android_vendor_batik/tiramisu/batik.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      BATIK_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       BATIK_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(FOUND)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst batik_,,$(BATIK_BUILD))

BATIK_VERSION := BatikOS-$(BATIK_MOD_VERSION)-$(CURRENT_DEVICE)-$(BATIK_BUILD_TYPE)-$(CUSTOM_BUILD_DATE)

BATIK_FINGERPRINT := BatikOS/$(BATIK_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.batik.version=$(BATIK_VERSION) \
  ro.batik.releasetype=$(BATIK_BUILD_TYPE) \
  ro.modversion=$(BATIK_MOD_VERSION)

BATIK_DISPLAY_VERSION := BatikOS-$(BATIK_MOD_VERSION)-$(BATIK_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.batik.display.version=$(BATIK_DISPLAY_VERSION)\
  ro.batik.fingerprint=$(BATIK_FINGERPRINT)
