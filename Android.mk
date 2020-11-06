#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(BOARD_USES_QCOM_DECRYPTION),true)

LOCAL_PATH := $(call my-dir)

# Dummy file to apply post-install patch for qcom_decrypt
include $(CLEAR_VARS)

LOCAL_MODULE := qcom_decrypt
LOCAL_MODULE_TAGS := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin
LOCAL_REQUIRED_MODULES := teamwin

# Cannot send to TARGET_RECOVERY_ROOT_OUT since build system wipes init*.rc
# during ramdisk creation and only allows init.recovery.*.rc files to be copied
# from TARGET_ROOT_OUT thereafter
LOCAL_POST_INSTALL_CMD += \
    $(hide) cp $(LOCAL_PATH)/recovery/root/init.recovery* $(TARGET_ROOT_OUT) && cp -Ra $(LOCAL_PATH)/recovery/root/. $(TARGET_RECOVERY_ROOT_OUT);
include $(BUILD_PHONY_PACKAGE)

endif
