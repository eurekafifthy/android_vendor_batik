# Inherit full common Batik stuff
$(call inherit-product, vendor/batik/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Batik LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/batik/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/batik/config/telephony.mk)
