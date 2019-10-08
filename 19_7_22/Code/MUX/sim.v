`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2019 12:38:52
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
module sim;
    reg x;
    reg y;
    reg a;
    reg b;
    reg c;
    reg d;
    wire z;
    comparator uut(
        .x(x),
        .y(y),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .z(z)
    );
    initial begin
    
    a=0;
    b=1;
    c=0;
    d=1;
    
    x=0;
    y=0;
    
    #20 x=1;
    #20 y=1;
    #20 x=0;
    #40;
    end
    
    initial begin
    $monitor("x=%d,y=%d,z=%d\n",x,y,z);
    end
    
endmodule