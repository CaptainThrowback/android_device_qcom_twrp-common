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

To import the decryption rc files into your device tree, add this line to your `init.recovery.$(ro.hardware).rc` file:
`import /init.recovery.qcom_decrypt.rc`

If you forget to add the above import, the build tree will add it for you if it can find your init.recovery.qcom.rc file. Otherwise, there will be a warning near the end of the build system output that the import needed to be added.

If for some reason these scripts do not work for you, increase the loglevel to 2 in prepdecrypt.sh and review the additional logging in the recovery.log to see where the process is failing.
