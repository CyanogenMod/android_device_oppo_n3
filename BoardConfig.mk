#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from msm8974-common
-include device/oppo/msm8974-common/BoardConfigCommon.mk

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/oppo/n3/include

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
TARGET_KERNEL_CONFIG := cyanogenmod_n3_defconfig
TARGET_KERNEL_SOURCE := kernel/oppo/n3

# Assert
TARGET_OTA_ASSERT_DEVICE := n3,N5206,N5207

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oppo/n3/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE
BOARD_CAMERA_PLUGIN = device/oppo/n3/camera/plugin

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1577058304
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114510381056 # 114510397440 - 16384 for crypto footer
TARGET_USERIMAGES_USE_F2FS := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Recovery
TARGET_RECOVERY_FSTAB := device/oppo/n3/rootdir/etc/fstab.qcom

AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true
AUDIO_FEATURE_ENABLED_FLUENCE := true

TARGET_INIT_VENDOR_LIB := libinit_n3

# SELinux
BOARD_SEPOLICY_DIRS += device/oppo/n3/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    genfs_contexts \
    mediaserver.te \
    vold.te

# Inherit from the proprietary version
-include vendor/oppo/n3/BoardConfigVendor.mk
