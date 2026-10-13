# Keychron Launcher configures dynamic debounce and Snap Click over Raw HID,
# which this build disables. keychron_common.mk adds both before this file
# is read, so remove them here, reserving their EEPROM bytes so the regions
# after them (custom RGB, wireless, keymaps) sit at Keychron's addresses. The
# fixed debounce is Keychron's default: eager per key, DEBOUNCE (info.json) ms.
# The filters copy each variable unexpanded, as later rules fill in parts of
# SRC (the bootloader) that must not be expanded yet.
$(eval KEYMAP_SRC = $(value SRC))
SRC = $(filter-out $(DEBOUNCE_DIR)/% $(SNAP_CLICK_DIR)/%,$(KEYMAP_SRC))
$(eval KEYMAP_OPT_DEFS = $(value OPT_DEFS))
OPT_DEFS = $(filter-out -DDYNAMIC_DEBOUNCE_ENABLE -DSNAP_CLICK_ENABLE,$(KEYMAP_OPT_DEFS))
DEBOUNCE_TYPE = sym_eager_pk
# Sizes from eeconfig_debounce.h and eeconfig_snap_click.h (20 entries of 3
# bytes). Flags rather than config.h: the keyboard's config.h includes
# eeconfig_kb.h before the keymap's is read.
OPT_DEFS += -DEECONFIG_RESERVE_DEBOUNCE=2 -DEECONFIG_RESERVE_SNAP_CLICK=60

# The keymap uses none of these keycodes.
MAGIC_ENABLE = no
SPACE_CADET_ENABLE = no
GRAVE_ESC_ENABLE = no
TRI_LAYER_ENABLE = no

include $(TOP_DIR)/../dos/drivers/device-qmk/qmk.mk

# Keep the assembly bridge's static symbols intact while optimizing the firmware.
LTO_ENABLE = yes
$(INTERMEDIATE_OUTPUT)/$(DOS_DIR)/drivers/device-qmk/c/user.o: NOLTO_CFLAGS += -fno-lto
