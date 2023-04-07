# rocket2thinpad

Run Rocket Chip on Thinpad

## Installation

```bash
$ git clone https://github.com/jiegec/rocket2thinpad.git
$ git submodue update --init --recursive
$ make
$ # alternatively
$ make ROCKET_DIR=/path/to/rocket-chip
```


## Usage

The CPU will jump to 0x80000000 at boot. You can download firmware to SRAM and reset the CPU.

The serial port is located at 0x60601000 with byte shift of 4. DLAB should be set to 27 for 115200 baudrate.

## License

Licensed under MIT License. The directory `bootrom` is originated from [ucb-bar/testchipip](https://github.com/ucb-bar/testchipip), `verilator` comes from chisel3, and the build script is originated from [ucb-bar/fpga-zynq](https://github.com/ucb-bar/fpga-zynq).
