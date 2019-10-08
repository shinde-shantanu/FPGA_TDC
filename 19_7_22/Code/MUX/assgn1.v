`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2019 12:11:25
// Design Name: 
// Module Name: assgn1
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

module comparator(
    input x,
    input y,
    input a,
    input b,
    input c,
    input d,
    output z
    );
    assign z=(~x&~y&a)|(~x&y&b)|(x&~y&c)|(x&y&d);
endmodule