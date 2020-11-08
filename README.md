# TWRP standard device files for Qualcomm SoCs

This device tree is made for Qualcomm devices which need working decryption in TWRP. It includes the necessary services and prepdecrypt script so that these do not need to be included in the device tree.

To include these files in your device tree, the following flags should be used (only one flag is needed in either case, not both):
### FDE Devices
- BOARD_USES_QCOM_DECRYPTION := true
### FBE Devices
- BOARD_USES_QCOM_FBE_DECRYPTION := true
### Android 10 Build Tree
In the Android-10 tree, the packages will need to be added to the device tree device.mk as indicated below:
```
PRODUCT_PACKAGES_ENG += \
    qcom_decrypt \
    qcom_decrypt_fbe
```
Only the `qcom_decrypt` package should be included for FDE devices, and both should be included for FBE devices.
