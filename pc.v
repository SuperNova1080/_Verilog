`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 10:41:22
// Design Name: 
// Module Name: pc
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


module pc(
    input [31:0] pc_i, 
    input reset, clk,
    output reg [31:0] pc_o
    );
    
    always@(posedge clk, posedge reset)
    begin   
        if (reset)
            pc_o<=32'b0;
        else
            pc_o<=pc_i;
    end    
endmodule
