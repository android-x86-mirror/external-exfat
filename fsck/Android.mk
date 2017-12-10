LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := fsck.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64
LOCAL_SRC_FILES := main.c
LOCAL_SHARED_LIBRARIES := libexfat libfuse-lite
include $(BUILD_EXECUTABLE)

ifneq ($(TARGET_NO_RECOVERY),true)
include $(CLEAR_VARS)
LOCAL_MODULE := libexfat_fsck_static
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64 -Dmain=fsck_exfat_main
LOCAL_SRC_FILES := main.c
LOCAL_C_INCLUDES := external/fuse/include
LOCAL_STATIC_LIBRARIES := libfuse_static libexfat_static
include $(BUILD_STATIC_LIBRARY)
endif
