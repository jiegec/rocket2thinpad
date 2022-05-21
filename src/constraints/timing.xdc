set_output_delay -clock [get_clocks sram_clk_design_1_clk_wiz_0_0] -min -5.000 [get_ports base_ram_we_n]
set_property IOB FALSE [get_cells design_1_i/axi_emc_base/U0/EMC_CTRL_I/IO_REGISTERS_I/mem_wen_reg_reg]

set_output_delay -clock [get_clocks sram_clk_design_1_clk_wiz_0_0] -min -5.000 [get_ports ext_ram_we_n]
set_property IOB FALSE [get_cells design_1_i/axi_emc_ext/U0/EMC_CTRL_I/IO_REGISTERS_I/mem_wen_reg_reg]
