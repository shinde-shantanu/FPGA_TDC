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
    input ip,
    //input b,
    input clk,
    output delay_ip,
    output dedge
    );
    reg ans;
    reg delay[0:3];
    //reg delay2;
    
    initial begin
        ans=1;
        delay[0]=1'b0;
        delay[1]=1'b0;
        delay[2]=1'b0;
        delay[3]=1'b0;
        //assign c=0;
    end
    
    assign dedge=ip & delay[0] & delay[1] & delay[2] & ~delay[3];
    assign delay_ip=delay[3];
    
    always @(posedge clk)
    begin
        delay[3]=delay[2];
        delay[2]=delay[1];
        delay[1]=delay[0];
        delay[0]=ip;
        //delay2=delay1;
        //ans= ip & ~delay2;
    end
    
endmodule
