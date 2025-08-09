`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 20:27:03
// Design Name: 
// Module Name: SingleCycleCPU
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


module SingleCycleCPU(
    input reset, clk
    );
    
    wire [31:0]pc_i, pc_o, pc_w, ALUSrc_out; //pc_w is intermediate pc for adder
    wire [31:0]instruction, writeData, ALUResult, readData1, readData2, readData_datamem;
    wire [31:0]shift_out, sign_extend_out, shift_add;
    wire [15:0]sign_extend_in;
    wire [5:0]opcode, funct; 
    wire [4:0]readReg_1, readReg_2, writeReg;
    wire [3:0]ALUCtl;
    wire [1:0]ALUOp;
    wire zero, RegDst, PCSrc, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Branch;
    
    assign opcode = {instruction[31:26]};
    assign sign_extend_in = {instruction[15:0]};
    assign readReg_1 = {instruction[25:21]};
    assign readReg_2 = {instruction[20:16]};
    assign funct = {instruction[5:0]};
    
    pc pc_m(
            .pc_i(pc_i), 
            .pc_o(pc_o), 
            .clk(clk), 
            .reset(reset)
            );
            
    adder pc_adder(
            .a(pc_o),
            .b(32'b100),
            .o(pc_w)
            );
    
    instmem instmem_m(
            .pc(pc_o),
            .instruction(instruction)
            );
    
    control control_m(
            .opcode(opcode),
            .ALUOp(ALUOp),
            .RegDst(RegDst), 
            .Branch(Branch),
            .MemRead(MemRead),
            .MemtoReg(MemtoReg),
            .MemWrite(MemWrite),
            .ALUSrc(ALUSrc),
            .RegWrite(RegWrite)
            );
            
    datamem datamem_m(
            .address(ALUResult),
            .writeData(readData2),
            .MemRead(MemRead),
            .MemWrite(MemWrite),
            .clk(clk),
            .reset(reset),
            .readData(readData_datamem)
            );
             
    aluctl aluctl_m(
            .ALUOp(ALUOp),
            .funct(funct),  
            .ALUCtl(ALUCtl)
            );
            
    alu alu_m(
            .a(readData1),
            .b(ALUSrc_out),
            .zero(zero),
            .result(ALUResult),
            .ALUCtl(ALUCtl)
            );
            
     reg_file reg_file_m(
            .readReg_1(readReg_1),
            .readReg_2(readReg_2),
            .writeReg(writeReg),
            .writeData(writeData),
            .RegWrite(RegWrite),
            .clk(clk),
            .reset(reset),
            .readData1(readData1),
            .readData2(readData2)
            );
            
     sign_extend sign_extend_m(
            .extend_in(sign_extend_in),
            .extend_out(sign_extend_out)
            );
            
     address_shift address_shift_m(
            .shift_in(sign_extend_out),
            .shift_out(shift_out)
            );
     
     adder alu_res_m(
            .a(pc_w),
            .b(shift_out),
            .o(shift_add)
            );
            
     mux5bit RegDst_mux(
            .a(readReg_2),
            .b(instruction[15:11]),
            .sel(RegDst),
            .out(writeReg)
            );
            
     mux ALUSrc_mux(
            .a(readData2),
            .b(sign_extend_out),
            .sel(ALUSrc),
            .out(ALUSrc_out)
            );
            
     mux MemtoReg_mux(
            .a(ALUResult),
            .b(readData_datamem),
            .sel(MemtoReg),
            .out(writeData)
            );
            
     assign PCSrc = zero & Branch;
     mux PCSrc_mux(
            .a(pc_w),
            .b(shift_add),
            .sel(PCSrc),
            .out(pc_i)
            );
endmodule
