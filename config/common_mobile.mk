# Inherit common mobile Batik stuff
$(call inherit-product, vendor/batik/config/common.mk)

# Default notification/alarm sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

# Apps
PRODUCT_PACKAGES += \
    Eleven

ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    TrebuchetQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStepGo
else
PRODUCT_PACKAGES += \
    TrebuchetQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep
endif

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

ifneq ($(WITH_LINEAGE_CHARGER),false)
PRODUCT_PACKAGES += \
    lineage_charger_animation
endif

# Customizations
PRODUCT_PACKAGES += \
    NavigationBarMode2ButtonOverlay

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
