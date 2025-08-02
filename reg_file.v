`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2025 10:53:32
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input [4:0]readReg_1, readReg_2, writeReg,
    input [31:0]writeData,
    input RegWrite, clk, reset,
    output [31:0]readData1, readData2   
    );
    
    reg [31:0]register[0:31];
    integer i;
    
    assign readData1 = register[readReg_1];
    assign readData2 = register[readReg_2];
    
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin 
                for (i=0; i<32; i=i+1)
                register[i]<=32'b0;
            end
        else
            begin
                if (RegWrite)
                    register[writeReg]<=writeData;
            end
    end
endmodule
