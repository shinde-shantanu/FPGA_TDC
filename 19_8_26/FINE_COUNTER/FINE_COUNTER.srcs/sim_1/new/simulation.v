`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2019 20:40:38
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


module simulation( );
    reg start;
    reg stop;
    wire [0:99] latch;
    
    //assign latch={100{1'b0}};
    
    delay_line uut(
        .start(start),
        .stop(stop),
        .latch(latch)
        );
    
    initial begin
        start=0;
        stop=0;
        #1 start=1;
        #0.5 stop=1;
    end
    
endmodule
