`timescale 1ns / 1ps

module mux41( input[1:0] select, input[3:0] d, output q);

reg q;
wire[1:0] select;
wire[3:0] d;

always @(select or d)
begin
    if(select==0)
        q=d[0];
    if(select==1)
        q=d[1];
    if(select==2)
        q=d[2];
    if(select==3)
        q=d[3];
 end       

endmodule
