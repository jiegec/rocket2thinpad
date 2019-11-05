#include <stdint.h>

volatile uint32_t *UART_RX = (uint32_t *)0x60600000;
volatile uint32_t *UART_TX = (uint32_t *)0x60600004;
volatile uint32_t *UART_STAT = (uint32_t *)0x60600008;

void putc(char ch) {
  while (*UART_STAT & 0x8)
    ;
  *UART_TX = ch;
}

uint8_t getc() {
  while (!(*UART_STAT & 0x1))
    ;
  return (uint8_t)*UART_RX;
}

uint32_t getlen() {
  uint32_t len = 0;
  len |= getc();
  len = len << 8;
  len |= getc();
  len = len << 8;
  len |= getc();
  len = len << 8;
  len |= getc();
  return len;
}

void puts(char *s) {
  while (*s) {
    putc(*s++);
  }
}

void puthex(uint32_t num) {
  int i, temp;
  for (i = 7; i >= 0; i--) {
    temp = (num >> (i * 4)) & 0xF;
    if (temp <= 10) {
      putc('0' + temp);
    } else if (temp < 16) {
      putc('A' + temp - 10);
    } else {
      putc('.');
    }
  }
}

void bootloader() {
  puts("NO BOOT FAIL\r\n");
  uint32_t len = getlen();
  puts("LEN ");
  puthex(len);
  puts("\r\n");
  volatile uint8_t *MEM = (uint8_t *)0x80000000;
  for (uint32_t i = 0; i < len; i++) {
    *MEM = getc();
    MEM++;
  }
  puts("BOOT\r\n");
}

void halt(uint32_t epc) {
  puts("HALT ");
  puthex(epc);
}
