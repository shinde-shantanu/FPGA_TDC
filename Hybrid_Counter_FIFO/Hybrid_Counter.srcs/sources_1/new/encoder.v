`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:31:47
// Design Name: 
// Module Name: encoder
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


module encoder(
    input wire [799:0] op,
    output wire [9:0] en_op
    );
    
    integer i;
    reg [9:0] temp;
    
    initial 
    begin
        temp=0;
    end
    
    assign en_op = temp;
    
    always @ (op) 
    begin
        
        if (op[0]==0)
        begin
            temp=0;
        end
        
        if(op[799]==1)
        begin
            temp=800;
        end
        
        begin
            for (i = 0; i < 799; i = i + 1)
            begin
                if(op[i+1]==0)
                begin
                    if(op[i]==1)
                    begin
                        temp = i+1;
                    end
                end
            end
        end
    end
    
endmodule
