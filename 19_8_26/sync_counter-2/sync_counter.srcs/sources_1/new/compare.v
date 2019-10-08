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
    reg delay1;
    //reg delay2;
    
    initial begin
        ans=1;
        delay1=1'b0;
        //assign c=0;
    end
    
    assign dedge=ip & ~delay1;
    assign delay_ip=delay1;
    
    always @(posedge clk)
    begin
        delay1=ip;
        //delay2=delay1;
        //ans= ip & ~delay2;
    end
    
endmodule
