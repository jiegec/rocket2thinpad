
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# rocketchip_wrapper

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tfgg676-2L
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:blk_mem_gen:8.4\
xilinx.com:ip:axi_emc:3.0\
xilinx.com:ip:axi_uart16550:2.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:jtag_axi:1.2\
xilinx.com:ip:proc_sys_reset:5.0\
jiegec.me:user:sram_converter:1.0\
xilinx.com:ip:system_ila:1.1\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:vio:3.0\
xilinx.com:ip:xlconstant:1.1\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
rocketchip_wrapper\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set base_ram_data [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 base_ram_data ]

  set ext_ram_data [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 ext_ram_data ]


  # Create ports
  set base_ram_addr [ create_bd_port -dir O -from 19 -to 0 base_ram_addr ]
  set base_ram_be_n [ create_bd_port -dir O -from 3 -to 0 base_ram_be_n ]
  set base_ram_ce_n [ create_bd_port -dir O base_ram_ce_n ]
  set base_ram_oe_n [ create_bd_port -dir O base_ram_oe_n ]
  set base_ram_we_n [ create_bd_port -dir O base_ram_we_n ]
  set clk_50M [ create_bd_port -dir I -type clk -freq_hz 50000000 clk_50M ]
  set ext_ram_addr [ create_bd_port -dir O -from 19 -to 0 ext_ram_addr ]
  set ext_ram_be_n [ create_bd_port -dir O -from 3 -to 0 ext_ram_be_n ]
  set ext_ram_ce_n [ create_bd_port -dir O ext_ram_ce_n ]
  set ext_ram_oe_n [ create_bd_port -dir O ext_ram_oe_n ]
  set ext_ram_we_n [ create_bd_port -dir O ext_ram_we_n ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set uart_rxd [ create_bd_port -dir I uart_rxd ]
  set uart_txd [ create_bd_port -dir O uart_txd ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 axi_bram_ctrl_0_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {Single_Port_RAM} \
   CONFIG.Port_A_Write_Rate {50} \
   CONFIG.Use_Byte_Write_Enable {true} \
 ] $axi_bram_ctrl_0_bram

  # Create instance: axi_emc_base, and set properties
  set axi_emc_base [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_emc:3.0 axi_emc_base ]
  set_property -dict [ list \
   CONFIG.C_INCLUDE_DATAWIDTH_MATCHING_0 {0} \
   CONFIG.C_MAX_MEM_WIDTH {32} \
   CONFIG.C_MEM0_TYPE {1} \
   CONFIG.C_MEM0_WIDTH {32} \
 ] $axi_emc_base

  # Create instance: axi_emc_ext, and set properties
  set axi_emc_ext [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_emc:3.0 axi_emc_ext ]
  set_property -dict [ list \
   CONFIG.C_INCLUDE_DATAWIDTH_MATCHING_0 {0} \
   CONFIG.C_MAX_MEM_WIDTH {32} \
   CONFIG.C_MEM0_TYPE {1} \
   CONFIG.C_MEM0_WIDTH {32} \
 ] $axi_emc_ext

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.NUM_MI {4} \
   CONFIG.NUM_SI {3} \
 ] $axi_mem_intercon

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]
  set_property -dict [ list \
   CONFIG.C_HAS_EXTERNAL_RCLK {0} \
 ] $axi_uart16550_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {200.0} \
   CONFIG.CLKOUT1_JITTER {192.113} \
   CONFIG.CLKOUT1_PHASE_ERROR {164.985} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
   CONFIG.CLKOUT2_JITTER {285.743} \
   CONFIG.CLKOUT2_PHASE_ERROR {164.985} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {10.000} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLK_OUT1_PORT {cpu_clk} \
   CONFIG.CLK_OUT2_PORT {sram_clk} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {20.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {100} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.PRIM_IN_FREQ {50.000} \
 ] $clk_wiz_0

  # Create instance: jtag_axi_0, and set properties
  set jtag_axi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 jtag_axi_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rocketchip_wrapper_0, and set properties
  set block_name rocketchip_wrapper
  set block_cell_name rocketchip_wrapper_0
  if { [catch {set rocketchip_wrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rocketchip_wrapper_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: sram_converter_base, and set properties
  set sram_converter_base [ create_bd_cell -type ip -vlnv jiegec.me:user:sram_converter:1.0 sram_converter_base ]

  # Create instance: sram_converter_ext, and set properties
  set sram_converter_ext [ create_bd_cell -type ip -vlnv jiegec.me:user:sram_converter:1.0 sram_converter_ext ]

  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {INTERFACE} \
   CONFIG.C_NUM_MONITOR_SLOTS {2} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
   CONFIG.C_SLOT_1_APC_EN {0} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_1_AXI_W_SEL_TRIG {1} \
   CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
 ] $system_ila_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_EN_PROBE_IN_ACTIVITY {0} \
   CONFIG.C_NUM_PROBE_IN {0} \
   CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
 ] $vio_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {2} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_emc_base_EMC_INTF [get_bd_intf_pins axi_emc_base/EMC_INTF] [get_bd_intf_pins sram_converter_base/ram]
  connect_bd_intf_net -intf_net axi_emc_ext_EMC_INTF [get_bd_intf_pins axi_emc_ext/EMC_INTF] [get_bd_intf_pins sram_converter_ext/ram]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M00_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins axi_uart16550_0/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M02_AXI [get_bd_intf_pins axi_emc_base/S_AXI_MEM] [get_bd_intf_pins axi_mem_intercon/M02_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M03_AXI [get_bd_intf_pins axi_emc_ext/S_AXI_MEM] [get_bd_intf_pins axi_mem_intercon/M03_AXI]
  connect_bd_intf_net -intf_net jtag_axi_0_M_AXI [get_bd_intf_pins axi_mem_intercon/S02_AXI] [get_bd_intf_pins jtag_axi_0/M_AXI]
  connect_bd_intf_net -intf_net rocketchip_wrapper_0_M_AXI [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins rocketchip_wrapper_0/M_AXI]
connect_bd_intf_net -intf_net [get_bd_intf_nets rocketchip_wrapper_0_M_AXI] [get_bd_intf_pins rocketchip_wrapper_0/M_AXI] [get_bd_intf_pins system_ila_0/SLOT_0_AXI]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets rocketchip_wrapper_0_M_AXI]
  connect_bd_intf_net -intf_net rocketchip_wrapper_0_M_AXI_MMIO [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins rocketchip_wrapper_0/M_AXI_MMIO]
connect_bd_intf_net -intf_net [get_bd_intf_nets rocketchip_wrapper_0_M_AXI_MMIO] [get_bd_intf_pins rocketchip_wrapper_0/M_AXI_MMIO] [get_bd_intf_pins system_ila_0/SLOT_1_AXI]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets rocketchip_wrapper_0_M_AXI_MMIO]
  connect_bd_intf_net -intf_net sram_converter_0_sram_data [get_bd_intf_ports base_ram_data] [get_bd_intf_pins sram_converter_base/sram_data]
  connect_bd_intf_net -intf_net sram_converter_0_sram_data1 [get_bd_intf_ports ext_ram_data] [get_bd_intf_pins sram_converter_ext/sram_data]

  # Create port connections
  connect_bd_net -net axi_uart16550_0_sout [get_bd_ports uart_txd] [get_bd_pins axi_uart16550_0/sout]
  connect_bd_net -net clk_1 [get_bd_ports clk_50M] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins clk_wiz_0/cpu_clk] [get_bd_pins jtag_axi_0/aclk] [get_bd_pins rocketchip_wrapper_0/clk] [get_bd_pins system_ila_0/clk] [get_bd_pins vio_0/clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net clk_wiz_0_sram_clk [get_bd_pins axi_emc_base/rdclk] [get_bd_pins axi_emc_base/s_axi_aclk] [get_bd_pins axi_emc_ext/rdclk] [get_bd_pins axi_emc_ext/s_axi_aclk] [get_bd_pins axi_mem_intercon/M02_ACLK] [get_bd_pins axi_mem_intercon/M03_ACLK] [get_bd_pins clk_wiz_0/sram_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_mb_reset [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins rocketchip_wrapper_0/reset]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_emc_base/s_axi_aresetn] [get_bd_pins axi_emc_ext/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/M02_ARESETN] [get_bd_pins axi_mem_intercon/M03_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins jtag_axi_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins system_ila_0/resetn]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net sin_0_1 [get_bd_ports uart_rxd] [get_bd_pins axi_uart16550_0/sin]
  connect_bd_net -net sram_converter_0_sram_addr [get_bd_ports base_ram_addr] [get_bd_pins sram_converter_base/sram_addr]
  connect_bd_net -net sram_converter_0_sram_be_n [get_bd_ports base_ram_be_n] [get_bd_pins sram_converter_base/sram_be_n]
  connect_bd_net -net sram_converter_0_sram_ce_n [get_bd_ports base_ram_ce_n] [get_bd_pins sram_converter_base/sram_ce_n]
  connect_bd_net -net sram_converter_0_sram_oe_n [get_bd_ports base_ram_oe_n] [get_bd_pins sram_converter_base/sram_oe_n]
  connect_bd_net -net sram_converter_0_sram_we_n [get_bd_ports base_ram_we_n] [get_bd_pins sram_converter_base/sram_we_n]
  connect_bd_net -net sram_converter_ext_sram_addr [get_bd_ports ext_ram_addr] [get_bd_pins sram_converter_ext/sram_addr]
  connect_bd_net -net sram_converter_ext_sram_be_n [get_bd_ports ext_ram_be_n] [get_bd_pins sram_converter_ext/sram_be_n]
  connect_bd_net -net sram_converter_ext_sram_ce_n [get_bd_ports ext_ram_ce_n] [get_bd_pins sram_converter_ext/sram_ce_n]
  connect_bd_net -net sram_converter_ext_sram_oe_n [get_bd_ports ext_ram_oe_n] [get_bd_pins sram_converter_ext/sram_oe_n]
  connect_bd_net -net sram_converter_ext_sram_we_n [get_bd_ports ext_ram_we_n] [get_bd_pins sram_converter_ext/sram_we_n]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net vio_0_probe_out0 [get_bd_pins proc_sys_reset_0/aux_reset_in] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins rocketchip_wrapper_0/interrupts] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins clk_wiz_0/reset] [get_bd_pins xlconstant_1/dout]

  # Create address segments
  assign_bd_address -offset 0x80800000 -range 0x00008000 -target_address_space [get_bd_addr_spaces jtag_axi_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x80000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces jtag_axi_0/Data] [get_bd_addr_segs axi_emc_base/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x80400000 -range 0x00400000 -target_address_space [get_bd_addr_spaces jtag_axi_0/Data] [get_bd_addr_segs axi_emc_ext/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x60600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces jtag_axi_0/Data] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x80800000 -range 0x00008000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x80800000 -range 0x00008000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI_MMIO] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x80000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI] [get_bd_addr_segs axi_emc_base/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x80000000 -range 0x00400000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI_MMIO] [get_bd_addr_segs axi_emc_base/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x80400000 -range 0x00400000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI] [get_bd_addr_segs axi_emc_ext/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x80400000 -range 0x00400000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI_MMIO] [get_bd_addr_segs axi_emc_ext/S_AXI_MEM/Mem0] -force
  assign_bd_address -offset 0x60600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x60600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces rocketchip_wrapper_0/M_AXI_MMIO] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


