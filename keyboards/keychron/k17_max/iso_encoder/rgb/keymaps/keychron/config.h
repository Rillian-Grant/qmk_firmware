#pragma once

// Keep the former VIA magic/layout bytes reserved when VIA is disabled.
// Dynamic keymaps, encoders, and macro storage retain their existing addresses.
#define DYNAMIC_KEYMAP_EEPROM_ADDR (EECONFIG_SIZE + 4)
