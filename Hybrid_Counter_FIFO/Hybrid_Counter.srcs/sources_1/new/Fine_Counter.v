`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:20:02
// Design Name: 
// Module Name: Fine_Counter
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


module Fine_Counter(
    input wire clk,
    input wire start,
    output wire [9:0] en_op,
    output wire done
    );
    
    reg flag1,flag2,flag3;
    wire flag;
    wire [9:0] temp_en_op;
    reg [9:0] op;
    reg done_temp;
    
    assign en_op=op;
    assign done=done_temp;
    
    initial 
    begin
        flag1=0;
        flag2=0;
        done_temp=0;
    end
    
    delay_line uut3(
        .start(start),
        .stop(clk),
        .en_op(temp_en_op)
        );
        
    always @(posedge clk)
    begin
        if(flag1==1)
        begin
            /*if(flag2==1)
            begin
                if(flag3==0)
                begin
                    op=temp_en_op;
                    flag3=1;
                end
            end
            flag2=1;*/
            if(flag2==0)
            begin
                op=temp_en_op;
                flag2=1;
                done_temp=1;
            end
        end
        if(start==1)
        begin
            flag1=1;
            done_temp=0;
        end
        else
        begin
            flag1=0;
            flag2=0;
        end
    end
        
endmodule