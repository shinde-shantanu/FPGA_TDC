`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2019 13:55:50
// Design Name: 
// Module Name: counter
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


module counter(
    input async_ip,
    input clk,
    input gate,
    output sync_op,
    output dedge,
    output reg[15:0] count,
    output reg[15:0] count_live
    );
    //reg [15:0] op;
    reg flag;
    
    initial begin
        count=0;
        count_live=0;
        flag=1'b0;
    end
    
    sync uut1(
        .async_ip(async_ip),
        .clk(clk),
        .sync_op(sync_op),
        .dedge(dedge)
        );
    
    always @(negedge gate)
    begin
        count=count_live;
        count_live=0;
    end
    
    always @(posedge dedge)
    begin
        if(flag==1)
        begin
            if(gate==1)
            count_live=count_live+1;
        end
        flag=~flag;
    end
        //assign count=op;
endmodule
