`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2019 20:24:42
// Design Name: 
// Module Name: delay_line
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


module delay_line(
    input start,
    input stop,
    output wire [0:99] latch
    );
    wire [0:99] op;
    genvar i;
    //genvar x;
    
    //initial begin
        //assign op[0]=0;
        //op=100'b0;
    //end
    
    delay uut1(
        .start(start),
        .stop(stop),
        .delay_start(op[0])
        );
    for(i=1;i<100;i=i+1)
    begin
        delay uut1(
            .start(op[i-1]),
            .stop(stop),
            .delay_start(op[i])
            );
    end
    
    assign latch=op;
    
endmodule
