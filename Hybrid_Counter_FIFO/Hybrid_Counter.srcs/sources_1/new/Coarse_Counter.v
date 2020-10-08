`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:36:15
// Design Name: 
// Module Name: Coarse_Counter
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


module Coarse_Counter(
    input clk,
    input start,
    input stop,
    output reg[15:0] latch,
    output wire done
    );

    wire TxD1;
    wire TxD2;
    
    reg TxDreg;
    wire txdone;
    wire txdone1;
    wire var;
    reg reset;
    wire reset2;
    wire txwr;
    //integer done;
    reg [15:0] outp;
    parameter [1:0] IDLE = 2'b00, RUN = 2'b01, FIN = 2'b10;
    reg [1:0] state;
    integer count;
    reg flag;
    reg latchset;
    wire T0;
    reg flagop;
    
    
    wire T4;
    
    assign done = flagop;
    
    initial begin
        count = 0;
        flag=0;
        outp =0;
        latch =0;
        reset=1;
        flagop=0;
        state=2'b00;
     end
    
    DFF uut4(
        T0,
        start,
        clk
        );
    
    DFF uut5(
        T4,
        stop,
        clk
        );
    
    always @(posedge clk)
    begin
        count=count+1;
        if(count==5)
            reset=0;
        flagop =0;
        
        case(state)
            
            IDLE:
            begin
                if(T0==1)
                begin
                    state=2'b01;
                    outp=outp+1;
                    latch=0;
                    flag=0;
                end
                else if (T4==1)
                begin
                    state=2'b00;
                end
                else 
                begin
                    state=2'b00;
                end
            end
            
            RUN:
            begin
                if (T4 == 1) 
                begin
                    state=2'b10;
                end
                else
                begin
                    outp=outp+1;
                end
            end
            
            FIN: 
            begin
                if(flag==0)
                begin
                    latch=outp;
                    flagop=1;
                end
                outp=0;
                flag=1;
                state=2'b00;
            end
            default:
            begin
                state=2'b00;
            end
        endcase   
    end
    
endmodule
