# Inherit mini common Batik stuff
$(call inherit-product, vendor/batik/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/batik/config/telephony.mk)
