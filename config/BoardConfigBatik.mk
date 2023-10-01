include vendor/batik/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/batik/config/BoardConfigQcom.mk
endif

include vendor/batik/config/BoardConfigSoong.mk
