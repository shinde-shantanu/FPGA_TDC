`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2019 13:07:19
// Design Name: 
// Module Name: simulation
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


module simulation();
    reg async_ip;
    reg clk;
    wire sync_op;
    wire dedge;
    wire [15:0] count;
    reg gate;
    wire [15:0] count_live;
    
    counter uut(
        .async_ip(async_ip),
        .clk(clk),
        .gate(gate),
        .sync_op(sync_op),
        .dedge(dedge),
        .count(count),
        .count_live(count_live)
        );
    
    initial begin
        clk=0;
        async_ip=0;
        gate=1;
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
        #10000;
    end
    
    always
    begin
        clk=~clk;
        #0.1;
    end
    
endmodule
