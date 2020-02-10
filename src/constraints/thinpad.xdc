# Clock
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports clk_50M]

create_clock -period 20.000 -name clk_50M -waveform {0.000 10.000} [get_ports clk_50M]

# Touch Button
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS33} [get_ports reset]

# Ext serial
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L19} [get_ports uart_txd]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K21} [get_ports uart_rxd]

# BaseRAM
set_property -dict {PACKAGE_PIN F24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[0]}]
set_property -dict {PACKAGE_PIN G24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[1]}]
set_property -dict {PACKAGE_PIN L24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[2]}]
set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[3]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[4]}]
set_property -dict {PACKAGE_PIN G21 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[5]}]
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[6]}]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[7]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[8]}]
set_property -dict {PACKAGE_PIN H23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[9]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[10]}]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[11]}]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[12]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[13]}]
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[14]}]
set_property -dict {PACKAGE_PIN M24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[15]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[16]}]
set_property -dict {PACKAGE_PIN N23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[17]}]
set_property -dict {PACKAGE_PIN N24 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[18]}]
set_property -dict {PACKAGE_PIN P23 IOSTANDARD LVCMOS33} [get_ports {base_ram_addr[19]}]
set_property -dict {PACKAGE_PIN M26 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[0]}]
set_property -dict {PACKAGE_PIN L25 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[1]}]
set_property -dict {PACKAGE_PIN D26 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[2]}]
set_property -dict {PACKAGE_PIN D25 IOSTANDARD LVCMOS33} [get_ports {base_ram_be_n[3]}]
set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[0]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[1]}]
set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[2]}]
set_property -dict {PACKAGE_PIN R20 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[3]}]
set_property -dict {PACKAGE_PIN M25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[4]}]
set_property -dict {PACKAGE_PIN N26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[5]}]
set_property -dict {PACKAGE_PIN P26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[6]}]
set_property -dict {PACKAGE_PIN P25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[7]}]
set_property -dict {PACKAGE_PIN J23 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[8]}]
set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[9]}]
set_property -dict {PACKAGE_PIN E26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[10]}]
set_property -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[11]}]
set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[12]}]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[13]}]
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[14]}]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[15]}]
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[16]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[17]}]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[18]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[19]}]
set_property -dict {PACKAGE_PIN K20 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[20]}]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[21]}]
set_property -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[22]}]
set_property -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[23]}]
set_property -dict {PACKAGE_PIN K26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[24]}]
set_property -dict {PACKAGE_PIN K25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[25]}]
set_property -dict {PACKAGE_PIN J26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[26]}]
set_property -dict {PACKAGE_PIN J25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[27]}]
set_property -dict {PACKAGE_PIN H26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[28]}]
set_property -dict {PACKAGE_PIN G26 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[29]}]
set_property -dict {PACKAGE_PIN G25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[30]}]
set_property -dict {PACKAGE_PIN F25 IOSTANDARD LVCMOS33} [get_ports {base_ram_data_tri_io[31]}]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports base_ram_ce_n]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports base_ram_oe_n]
set_property -dict {PACKAGE_PIN P24 IOSTANDARD LVCMOS33} [get_ports base_ram_we_n]

# ExtRAM
set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[0]}]
set_property -dict {PACKAGE_PIN Y26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[1]}]
set_property -dict {PACKAGE_PIN AA25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[2]}]
set_property -dict {PACKAGE_PIN Y22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[3]}]
set_property -dict {PACKAGE_PIN Y23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[4]}]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[5]}]
set_property -dict {PACKAGE_PIN T23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[6]}]
set_property -dict {PACKAGE_PIN T24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[7]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[8]}]
set_property -dict {PACKAGE_PIN V24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[9]}]
set_property -dict {PACKAGE_PIN W26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[10]}]
set_property -dict {PACKAGE_PIN W24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[11]}]
set_property -dict {PACKAGE_PIN Y25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[12]}]
set_property -dict {PACKAGE_PIN W23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[13]}]
set_property -dict {PACKAGE_PIN W21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[14]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[15]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[16]}]
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[17]}]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[18]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {ext_ram_addr[19]}]
set_property -dict {PACKAGE_PIN U26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[0]}]
set_property -dict {PACKAGE_PIN T25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[1]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[2]}]
set_property -dict {PACKAGE_PIN R21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_be_n[3]}]
set_property -dict {PACKAGE_PIN W20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[0]}]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[1]}]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[2]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[3]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[4]}]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[5]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[6]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[7]}]
set_property -dict {PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[8]}]
set_property -dict {PACKAGE_PIN W25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[9]}]
set_property -dict {PACKAGE_PIN V23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[10]}]
set_property -dict {PACKAGE_PIN V21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[11]}]
set_property -dict {PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[12]}]
set_property -dict {PACKAGE_PIN V26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[13]}]
set_property -dict {PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[14]}]
set_property -dict {PACKAGE_PIN U25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[15]}]
set_property -dict {PACKAGE_PIN AC24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[16]}]
set_property -dict {PACKAGE_PIN AC26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[17]}]
set_property -dict {PACKAGE_PIN AB25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[18]}]
set_property -dict {PACKAGE_PIN AB24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[19]}]
set_property -dict {PACKAGE_PIN AA22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[20]}]
set_property -dict {PACKAGE_PIN AA24 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[21]}]
set_property -dict {PACKAGE_PIN AB26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[22]}]
set_property -dict {PACKAGE_PIN AA23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[23]}]
set_property -dict {PACKAGE_PIN R25 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[24]}]
set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[25]}]
set_property -dict {PACKAGE_PIN R26 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[26]}]
set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[27]}]
set_property -dict {PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[28]}]
set_property -dict {PACKAGE_PIN R22 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[29]}]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[30]}]
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {ext_ram_data_tri_io[31]}]
set_property -dict {PACKAGE_PIN Y20 IOSTANDARD LVCMOS33} [get_ports ext_ram_ce_n]
set_property -dict {PACKAGE_PIN U24 IOSTANDARD LVCMOS33} [get_ports ext_ram_oe_n]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports ext_ram_we_n]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list design_1_i/clk_wiz_0/inst/cpu_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 64 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[0]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[1]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[2]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[3]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[4]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[5]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[6]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[7]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[8]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[9]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[10]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[11]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[12]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[13]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[14]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[15]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[16]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[17]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[18]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[19]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[20]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[21]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[22]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[23]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[24]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[25]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[26]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[27]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[28]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[29]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[30]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[31]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[32]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[33]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[34]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[35]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[36]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[37]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[38]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[39]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[40]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[41]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[42]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[43]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[44]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[45]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[46]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[47]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[48]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[49]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[50]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[51]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[52]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[53]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[54]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[55]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[56]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[57]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[58]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[59]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[60]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[61]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[62]} {design_1_i/rocketchip_wrapper_0/inst/top/target/tile/core/coreMonitorBundle_pc[63]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
