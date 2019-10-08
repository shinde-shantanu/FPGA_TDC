`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2019 12:24:31
// Design Name: 
// Module Name: sync
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


module sync(
    input async_ip,
    input clk,
    output reg sync_op,
    output dedge
    );
    reg op1;
    reg op2;
    //reg clk1;
    //reg dedge1;
    initial begin
    op1<=0;
    op2<=0;
    //dedge1<=0;
    assign sync_op=0;
    //assign op2=0;
    end
    
    compare uut2(
        .a(op1),
        .b(op2),
        .clk(clk),
        .c(dedge)
        );
    //assign dedge=dedge1;
    
    always @(posedge clk)
    begin
        op1<=async_ip;
        op2<=op1;
        assign sync_op=op2;
     end
endmodule
