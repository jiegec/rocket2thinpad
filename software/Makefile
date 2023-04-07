GCC=riscv64-unknown-elf-gcc
OBJCOPY=riscv64-unknown-elf-objcopy

all: img

img: uart.img

%.img: %.elf
	$(OBJCOPY) -O binary --change-addresses=-0x80000000 $< $@

%.elf: %.c linker.ld init.S
	$(GCC) -mcmodel=medany -mabi=ilp32 -march=rv32ima -Tlinker.ld init.S $< -nostdlib -ffreestanding -static -o $@
