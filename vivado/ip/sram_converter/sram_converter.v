`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 09:27:18 AM
// Design Name: 
// Module Name: sram_converter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sram_converter(
    ram_addr,
    ram_adv_ldn,
    ram_ben,
    ram_ce,
    ram_ce_n,
    ram_clken,
    ram_cre,
    ram_dq_i,
    ram_dq_o,
    ram_dq_t,
    ram_lbon,
    ram_oen,
    ram_qwen,
    ram_rnw,
    ram_rpn,
    ram_wait,
    ram_wen,

    sram_addr,
    sram_be_n,
    sram_ce_n,
    sram_oe_n,
    sram_we_n,
    sram_data_i,
    sram_data_o,
    sram_data_t
    );
  input [31:0]ram_addr;
  input ram_adv_ldn;
  input [3:0]ram_ben;
  input [0:0]ram_ce;
  input [0:0]ram_ce_n;
  input ram_clken;
  input ram_cre;
  output [31:0]ram_dq_i;
  input [31:0]ram_dq_o;
  input [31:0]ram_dq_t;
  input ram_lbon;
  input [0:0]ram_oen;
  input [3:0]ram_qwen;
  input ram_rnw;
  input ram_rpn;
  output [0:0]ram_wait;
  input ram_wen;

  output [19:0] sram_addr;
  output [3:0] sram_be_n;
  output sram_ce_n;
  output sram_oe_n;
  output sram_we_n;
  input [31:0]sram_data_i;
  output [31:0]sram_data_o;
  output [31:0]sram_data_t;

  assign sram_addr = ram_addr[21:2];
  assign sram_be_n = ram_ben;
  assign sram_ce_n = ram_ce_n[0];
  assign sram_oe_n = ram_oen[0];
  assign sram_we_n = ram_wen;
  assign ram_dq_i = sram_data_i;
  assign sram_data_o = ram_dq_o;
  assign sram_data_t = ram_dq_t;
  assign ram_wait = 0;
endmodule
