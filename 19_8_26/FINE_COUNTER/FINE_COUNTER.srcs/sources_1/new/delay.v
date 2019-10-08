`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2019 20:20:33
// Design Name: 
// Module Name: delay
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


module delay(
    input start,
    input stop,
    output delay_start
    );
    reg buff;
    reg i;
    
    //initial begin
    //    assign buff=0;
    //end
    
    assign delay_start=buff;
    
    always @(posedge start)
    begin
        if(stop==0)
        begin
            //i=2147483648*2147483648;
            #0.1 buff=start;
        end
    end
endmodule
