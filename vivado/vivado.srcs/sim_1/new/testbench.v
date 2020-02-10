`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2019 07:06:47 PM
// Design Name: 
// Module Name: testbench
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


module testbench(

    );

    reg clk = 1'b0;
    always clk = #10 ~clk;
    reg rst;

    initial begin
        rst = 1'b1;
        repeat (10) @ (posedge clk);
        rst = 1'b0;
    end

    wire [31:0] base_ram_data_tri_io;
    wire [31:0] ext_ram_data_tri_io;

    assign base_ram_data_tri_io = 0;
    assign ext_ram_data_tri_io = 0;

    design_1_wrapper dut (
        .clk_50M(clk),
        .reset(rst),
        .uart_rxd(0),
        .base_ram_data_tri_io(base_ram_data_tri_io),
        .ext_ram_data_tri_io(ext_ram_data_tri_io)
    );
endmodule
