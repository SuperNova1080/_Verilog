`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 13:03:56
// Design Name: 
// Module Name: aluctl
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


module aluctl(
    input [1:0]ALUOp,
    input [5:0]funct,
    output reg [3:0]ALUCtl
    );
    
    always @(*)
    begin
        case (ALUOp)
            2'b00: ALUCtl = 4'b0010;
            2'b01: ALUCtl = 4'b0110;
            2'b10: begin
                   casez(funct)
                       6'b??0000: ALUCtl = 4'b0010;
                       6'b??0010: ALUCtl = 4'b0110;
                       6'b??0100: ALUCtl = 4'b0000;
                       6'b??0101: ALUCtl = 4'b0001;
                       6'b??1010: ALUCtl = 4'b0111;
                       default:   ALUCtl = 4'b0000;
                   endcase
                   end
            2'b11: begin
                   casez(funct)
                        6'b??0010: ALUCtl = 4'b0110;
                        6'b??1010: ALUCtl = 4'b0111;
                        default:   ALUCtl = 4'b0000;
                   endcase
                   end
            default: ALUCtl = 4'b0; 
        endcase
    end
endmodule

