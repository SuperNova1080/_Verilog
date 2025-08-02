`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2025 10:09:51
// Design Name: 
// Module Name: mux5bit
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


module mux5bit(
    input [4:0]a,
    input [4:0]b,
    input sel,
    output [4:0]out
    );
    
    assign out = sel ? b : a;
    
endmodule
