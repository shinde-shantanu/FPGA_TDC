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
    input ip,
    input clk,
    input gate,
    //output sync_op,
    output delay_ip,
    output dedge,
    output reg[15:0] count,
    output reg[15:0] count_live
    );
    //reg [15:0] op;
    //reg flag;
    //wire dedge;
    reg gate_p;
    
    initial begin
        count=0;
        count_live=0;
        gate_p=0;
        //flag=1'b0;
    end
    
    compare uut3(
            .ip(ip),
            .clk(clk),
            //.sync_op(sync_op),
            .delay_ip(delay_ip),
            .dedge(dedge)
            );
        
    always @(posedge clk)
    begin
        if(gate==0&gate_p==1)
        begin
            count=count_live;
            count_live=0;
            //gate_p=gate;
        end
        if(dedge==1)
        begin
            if(gate==1)
            count_live=count_live+1;
        end
        gate_p=gate;
    end
    
    /*always @(negedge gate)
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
    end*/
        //assign count=op;
endmodule
