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

    design_1_wrapper dut (
        .clk(clk),
        .reset(rst)
    );
endmodule
