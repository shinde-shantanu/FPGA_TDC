`timescale 1ns / 1ps

include "dff.v";
module dff_tb();

reg clock, qin;
wire qout, qoutbar;

initial begin
clock=0; qin=0;
#10  qin=1;
#20  qin=0;
#30  qin=1;
//$finish;
end

always begin
clock=~clock;
#5;
end

dff uut(qin,clock, qout, qoutbar);

endmodule
