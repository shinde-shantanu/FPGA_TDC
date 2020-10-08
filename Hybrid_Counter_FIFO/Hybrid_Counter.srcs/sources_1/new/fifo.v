`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2020 16:59:56
// Design Name: 
// Module Name: fifo
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


module fifo(
    input clk,
    input wire [9:0] op_fc1,
    input wire [9:0] op_fc2,
    input wire [15:0] op_cc,
    input [15:0] counter,
    input done,
    input wr_fifo,
    output reg transmit,
    output [63:0] dout
    );

    wire full;
    wire empty;
    reg rd_en;
    reg wr_en;
    reg srst;
    wire [63:0] din;
    reg [11:0] checksum;
    
    assign din = {op_fc1,op_fc2,op_cc,counter,checksum};
    
    fifo_generator_0 uut (
        .clk(clk),      // input wire clk
        .srst(srst),    // input wire srst
        .din(din),      // input wire [63 : 0] din
        .wr_en(wr_en),  // input wire wr_en
        .rd_en(rd_en),  // input wire rd_en
        .dout(dout),    // output wire [63 : 0] dout
        .full(full),    // output wire full
        .empty(empty)  // output wire empty
        );
    /*fifo_generator_0 uut (
        .rst(rst),                  // input wire rst
        .wr_clk(clk),            // input wire wr_clk
        .rd_clk(clk),            // input wire rd_clk
        .din(bitdata),                  // input wire [823 : 0] din
        .wr_en(wr_en),              // input wire wr_en
        .rd_en(rd_en),              // input wire rd_en
        .dout(bitout),                // output wire [823 : 0] dout
        .full(full),                // output wire full
        .empty(empty),              // output wire empty
        .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
        .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
        );*/
    
    initial
    begin
        srst = 0;
        rd_en = 0;
        wr_en = 0;
        transmit=0;
        checksum=3308;
    end

    always @(posedge clk)
    begin
        
        //Reading data by UART and from info source (FIFO)
        if (empty==0 && done == 1)
        begin
            rd_en = 1;
            //transmit=1;
            
            if(dout==0)
            begin 
                transmit=0; 
            end
            else 
            begin
                //bitout1[15:10]=6'b0;
                //bitout1[9:0]=bitout_temp; 
                transmit=1; 
            end
            
        end
        
        if(empty==1 && done == 1) 
        begin
            transmit = 0;   //transmit=0;
            rd_en = 0;
        end
        
        if(empty==1 && done == 0) 
        begin
            transmit = 0;
            rd_en = 0;
        end
        
        if(empty==0 && done == 0) 
        begin
            transmit = 1;//transmit=0;
            rd_en = 0;//rd_en=0;
        end

        //Works
        /*     if (!empty)
        begin
        transmit = 1;
        rd_en = 1;
        end
        if(empty ) 
        begin
        transmit = 0;
        rd_en = 0;
        end */
        
        //FIFO writes
        if (!full && wr_fifo==1)
        begin
            wr_en = 1;
        end
        
        if( full || wr_fifo==0)
        begin
            wr_en = 0;
        end
    
    end
    
endmodule