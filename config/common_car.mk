# Inherit common Batik stuff
$(call inherit-product, vendor/batik/config/common.mk)

# Inherit Batik car device tree
$(call inherit-product, device/batik/car/batik_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
