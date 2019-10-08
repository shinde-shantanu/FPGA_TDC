`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2019 17:29:11
// Design Name: 
// Module Name: sim
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


module sim(

    );
    
    reg CYINIT;
    wire [3:0] CO;
    wire [3:0] O;
    
    top uut(
        .CO(CO),
        .O(O),
        .CYINIT(CYINIT)
        );
        
    initial begin
    CYINIT = 0;
    #1 CYINIT = 1;
    end
    
endmodule
