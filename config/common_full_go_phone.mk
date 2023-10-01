# Set Batik specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Batik stuff
$(call inherit-product, vendor/batik/config/common_full_phone.mk)
