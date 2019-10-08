`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2019 13:22:58
// Design Name: 
// Module Name: compare
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


module compare(
    input a,
    input b,
    input clk,
    output c
    );
    reg ans;
    initial begin
        ans=1;
        //assign c=0;
    end
    assign c=~ans;
    always @(posedge clk)
        ans= (a & b) | (~a & ~b);
endmodule
