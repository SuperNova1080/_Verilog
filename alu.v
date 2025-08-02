`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 10:33:16
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0]a, b,
    input [3:0]ALUCtl,
    output reg [31:0]result,
    output zero
    );
    
    always @(*)
    case (ALUCtl)
        4'b0010: result = a+b;
        4'b0110: result = a-b;
        4'b0000: result = a&b;
        4'b0001: result = a|b;
        4'b0111: result = a<b?1:0;
        default: result = 32'b0; 
    endcase
    
    assign zero = (result==0)?1:0;
    
endmodule
