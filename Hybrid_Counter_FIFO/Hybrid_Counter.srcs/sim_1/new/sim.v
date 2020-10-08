`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2020 09:41:23
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


module sim( );

reg sys_rst,clk,tx_wr;
reg [7:0] latch;
wire Tx,tx_done;

initial
begin
    sys_rst=0;
    clk=0;
    latch=8'b00001111;
    tx_wr=0;
    #10 sys_rst=1;
    #20 sys_rst=0;
    #20 tx_wr=1;
    #20 tx_wr=0;
end

always
begin
    #5 clk=~clk;
end

uart_transceiver uut_uart(
        .sys_rst(sys_rst),
        .sys_clk(clk),
        .uart_tx(Tx),
        .divisor(0),
        .tx_data(latch),
        .tx_wr(tx_wr),
        .tx_done(tx_done)
        );

endmodule
