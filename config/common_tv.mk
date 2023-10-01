# Inherit common Batik stuff
$(call inherit-product, vendor/batik/config/common.mk)

# Inherit Batik atv device tree
$(call inherit-product, device/batik/atv/batik_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Lineage packages
PRODUCT_PACKAGES += \
    LineageCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/batik/overlay/tv
