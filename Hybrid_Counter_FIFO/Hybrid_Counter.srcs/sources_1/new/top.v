`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:06:55
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
    input wire start,
    input wire stop,
    input wire clk,
    output wire TxD
    );
    
    wire done;
    reg wr_fifo,flag1,flag2,flag3;
    reg [15:0] counter;
    
    initial
    begin
        wr_fifo=0;
        flag1=0;
        flag2=0;
        flag3=0;
        counter=0;
    end
    
    Hybrid_Counter uut1(
        .start(start),
        .stop(stop),
        .clk(clk),
        .op_fc1(op_fc1),
        .op_fc2(op_fc2),
        .op_cc(op_cc)
        //.done(done)
        );
    
    fifo uut2(
        .clk(clk),
        .op_fc1(op_fc1),
        .op_fc2(op_fc2),
        .op_cc(op_cc),
        .counter(counter),
        .done(done),
        .wr_fifo(wr_fifo),
        .transmit(transmit),
        .dout(dout)
        );
    
    transmitter uut3(
        .clk(clk),
        .transmit(transmit),
        .datain(bitout),
        .TXD(TXD),
        .done(done)
        );
    
    always @(posedge clk)
    begin
        if(wr_fifo)
        begin
            wr_fifo=0;
            flag3=0;
        end
        
        if(flag3)
        begin
            wr_fifo=1;
        end
        if(start)
        begin
            flag1=1;
        end
        if(stop)
        begin
            flag2=1;
        end
        if(!stop & flag1 & flag2)
        begin
            counter = counter + 1;
            flag3=1;
            flag1=0;
            flag2=0;
        end
        
    end
    
endmodule
