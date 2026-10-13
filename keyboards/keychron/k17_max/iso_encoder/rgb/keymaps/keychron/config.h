#pragma once

// Keep the former VIA magic/layout bytes reserved when VIA is disabled.
// Dynamic keymaps, encoders, and macro storage retain their existing addresses.
#define DYNAMIC_KEYMAP_EEPROM_ADDR (EECONFIG_SIZE + 4)

// QMK print is debug-only here; the dos console uses sendchar/kmsg directly.
#define NO_PRINT

// The keymap uses no tap-hold (LT/MT/TT/tap dance) or one-shot keycodes.
#define NO_ACTION_TAPPING
#define NO_ACTION_ONESHOT
