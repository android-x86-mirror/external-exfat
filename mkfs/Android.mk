LOCAL_PATH := $(call my-dir)

common_src_files := cbm.c fat.c main.c mkexfat.c rootdir.c uct.c uctc.c vbr.c

include $(CLEAR_VARS)
LOCAL_MODULE := mkfs.exfat
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_SHARED_LIBRARIES := libexfat libfuse-lite
include $(BUILD_EXECUTABLE)

ifneq ($(TARGET_NO_RECOVERY),true)
include $(CLEAR_VARS)
LOCAL_MODULE := libexfat_mkfs_static
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64 -Dmain=mkfs_exfat_main
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_C_INCLUDES := external/fuse/include
LOCAL_STATIC_LIBRARIES := libfuse_static libexfat_static
include $(BUILD_STATIC_LIBRARY)
endif
