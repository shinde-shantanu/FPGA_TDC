`timescale 1ns / 1ps

module mux41_tb();

reg[3:0] d;
reg[1:0] select;
wire q;

integer i;

mux41 uut(select,d,q);

initial begin
$monitor("d=%b",d," | select=",select,"|q=",q);
for(i=0; i<=5; i=i+1)
begin
    d=i;
    select=0; #1;
    select=1; #1;
    select=2; #1;
    select=3; #1;
    $display("---------------------------------------------------------------");
end

end

endmodule
