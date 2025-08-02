`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 12:30:18
// Design Name: 
// Module Name: instmem
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


module instmem(
    input [31:0]pc,
    output reg [31:0]instruction
    );
    
    reg [7:0]inst[0:127];       
    
    initial 
    begin
        $readmemh("D:/Documents/misc/TEST_INSTRUCTIONS.mem", inst);
    end
    
    always @(*)
    begin
        instruction <= {inst[pc+3], inst[pc+2], inst[pc+1], inst[pc]};
    end        
endmodule
