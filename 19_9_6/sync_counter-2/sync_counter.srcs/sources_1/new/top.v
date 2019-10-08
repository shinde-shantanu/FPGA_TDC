`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2019 16:47:18
// Design Name: 
// Module Name: top
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


module top(
    input async_ip,
    input clk,
    input gate,
    output wire [15:0] count
    );
    //reg async_ip;
    //reg clk;
    wire sync_op;
    wire delay_ip;
    wire dedge;
    //wire [15:0] count;
    //reg gate;
    wire [15:0] count_live;
    //output reg uart_tx;
    
    //assign uart_tx = count[0:7];
    
    sync uut1(
        .async_ip(async_ip),
        .clk(clk),
        .sync_op(sync_op));
    
    counter uut2(
        .ip(sync_op),
        .clk(clk),
        .gate(gate),
        //.sync_op(sync_op),
        .delay_ip(delay_ip),
        .dedge(dedge),
        .count(count),
        .count_live(count_live)
        );
    
    //initial begin
        /*clk=0;
        async_ip=0;
        gate=0;
        #0.35 async_ip=1;
        #1 async_ip=0;
        #1.35 async_ip=1;
        #1 async_ip=0;
        #0.1 gate=0;
        #0.1 gate=1;
        #0.35 async_ip=1;
        #1 async_ip=0;
        #0.1 gate=0;
        #1.35 async_ip=1;
        #1 async_ip=0;
        #0.1 gate=0;
        #10000
        clk=0;
        async_ip=0;
        gate=0;
        #0.35 async_ip=1;
        #1 async_ip=0;
        #1 gate=1;
        #1.35 async_ip=1;
        #1 async_ip=0;
        #1.35 async_ip=1;
        #1 async_ip=0;
        #1 gate=0;
    end*/
    
    /*always
    begin
        clk=~clk;
        #0.1;
    end*/
    
endmodule
