# Set Lineage specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Batik stuff
$(call inherit-product, vendor/batik/config/common_mini_phone.mk)
