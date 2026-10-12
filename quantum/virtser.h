#pragma once

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

void virtser_init(void);

/* Define this function in your code to process incoming bytes */
void virtser_recv(const uint8_t ch);

/* Call this to send a character over the Virtual Serial Device */
void virtser_send(const uint8_t byte);

/* True when USB is active and the host has asserted DTR (terminal open). */
bool virtser_is_connected(void);

/* Nonblocking, returns bytes accepted; caller retains and retries the rest. */
size_t virtser_write(const uint8_t *bytes, size_t length);

/* Nonblocking, returns bytes available now; unread input stays queued in USB. */
size_t virtser_read(uint8_t *bytes, size_t capacity);
