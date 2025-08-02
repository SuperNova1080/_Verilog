`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 07:44:09
// Design Name: 
// Module Name: datamem
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


module datamem(
    input [6:0]address, 
    input [31:0]writeData,
    input MemRead, MemWrite, clk, reset,
    output reg [31:0]readData
    );
    
    reg [31:0]memory[0:127];
    integer i;
    
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin
                for (i=0; i<128; i=i+1)
                memory[i]<=32'b0;
            end
        else
            if (MemRead)
                readData<=memory[address];
            else if (MemWrite)
                memory[address]<=writeData;            
    end
endmodule
