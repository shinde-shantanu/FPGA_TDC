`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 19:04:21
// Design Name: 
// Module Name: Hybrid_Counter
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


module Hybrid_Counter(
    input wire start,
    input wire stop,
    input wire clk,
    output wire [9:0] op_fc1,
    output wire [9:0] op_fc2,
    output wire [15:0] op_cc
    //output wire done
    );
    
    wire done_fc1,done_fc2,done_cc;
    
    //assign done = done_fc1 & done_fc2 & done_cc;
    
    Fine_Counter uut_fc1(
        .clk(clk),
        .start(start),
        .en_op(op_fc1),
        .done(done_fc1)
        );
    
    Fine_Counter uut_fc2(
        .clk(clk),
        .start(stop),
        .en_op(op_fc2),
        .done(done_fc2)
        );
    
    Coarse_Counter uut_cc(
        .clk(clk),
        .start(start),
        .stop(stop),
        .latch(op_cc),
        .done(done_cc)
        );
    
endmodule
