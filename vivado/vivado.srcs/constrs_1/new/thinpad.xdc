#Clock
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports clk_50M] ;#50MHz main clock in

create_clock -period 20.000 -name clk_50M -waveform {0.000 10.000} [get_ports clk_50M]

#Touch Button
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS33} [get_ports reset] ;#BTN6

#Ext serial
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L19} [get_ports uart_txd] ;#GPIO5
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K21} [get_ports uart_rxd] ;#GPIO6