`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:29:28
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
    output wire [9:0] en_op
    );
    
    reg gnd=0;
    wire [3:0] DI;
    wire [3:0] S;
    wire [799:0] op;
    wire [199:0] to_next;
    wire [3:0] CO;
    wire [3:0] O;
    genvar i,j;
            
    assign S[0]=1;
    assign S[1]=1;
    assign S[2]=1;
    assign S[3]=1;
        
    assign DI[0]=0;
    assign DI[1]=0;
    assign DI[2]=0;
    assign DI[3]=0;
    
    assign to_next[0]=CO[3];
        
    CARRY4 CARRY4_inst1(
        .CO(CO),         //4-bitcarryout
        .O(O),           //4-bitcarrychainXORdataout
        .CI(gnd),         //1-bitcarrycascadeinput
        .CYINIT(start), //1-bitcarryinitialization
        .DI(DI),         //4-bitcarry-MUXdatain
        .S(S)            //4-bitcarry-MUXselectinput
        );
          
    FDRE#(
        .INIT(0),//Initialvalueofregister,1'b0,1'b1
        //ProgrammableInversionAttributes:Specifiestheuseofthebuilt-inprogrammableinversion
        .IS_C_INVERTED(1'b0),//OptionalinversionforC
        .IS_D_INVERTED(1'b0),//OptionalinversionforD
        .IS_R_INVERTED(1'b0)//OptionalinversionforR
        )
    ff0 (
        .Q(op[0]),//1-bitoutput:Data
        .C(stop),//1-bitinput:Clock
        .CE(1),//1-bitinput:Clockenable
        .D(CO[0]),//1-bitinput:Data
        .R(0)//1-bitinput:Synchronousreset
        );
        
    FDRE#(
        .INIT(0),//Initialvalueofregister,1'b0,1'b1
        //ProgrammableInversionAttributes:Specifiestheuseofthebuilt-inprogrammableinversion
        .IS_C_INVERTED(1'b0),//OptionalinversionforC
        .IS_D_INVERTED(1'b0),//OptionalinversionforD
        .IS_R_INVERTED(1'b0)//OptionalinversionforR
        )
    ff1 (
        .Q(op[1]),//1-bitoutput:Data
        .C(stop),//1-bitinput:Clock
        .CE(1),//1-bitinput:Clockenable
        .D(CO[1]),//1-bitinput:Data
        .R(0)//1-bitinput:Synchronousreset
        );
        
    FDRE#(
        .INIT(0),//Initialvalueofregister,1'b0,1'b1
        //ProgrammableInversionAttributes:Specifiestheuseofthebuilt-inprogrammableinversion
        .IS_C_INVERTED(1'b0),//OptionalinversionforC
        .IS_D_INVERTED(1'b0),//OptionalinversionforD
        .IS_R_INVERTED(1'b0)//OptionalinversionforR
        )
    ff2 (
        .Q(op[2]),//1-bitoutput:Data
        .C(stop),//1-bitinput:Clock
        .CE(1),//1-bitinput:Clockenable
        .D(CO[2]),//1-bitinput:Data
        .R(0)//1-bitinput:Synchronousreset
        );
        
    FDRE#(
        .INIT(0),//Initialvalueofregister,1'b0,1'b1
        //ProgrammableInversionAttributes:Specifiestheuseofthebuilt-inprogrammableinversion
        .IS_C_INVERTED(1'b0),//OptionalinversionforC
        .IS_D_INVERTED(1'b0),//OptionalinversionforD
        .IS_R_INVERTED(1'b0)//OptionalinversionforR
        )
    ff3 (
        .Q(op[3]),//1-bitoutput:Data
        .C(stop),//1-bitinput:Clock
        .CE(1),//1-bitinput:Clockenable
        .D(CO[3]),//1-bitinput:Data
        .R(0)//1-bitinput:Synchronousreset
        );
                
    generate
        for (i = 1; i < 200; i = i + 1)
        begin
            //genvar j;
            //j=4*i;
            delay uut(
                .start(to_next[i-1]),
                .stop(stop),
                .to_next(to_next[i]),
                //.CO(CO[i]),
                .latch(op[(4*i)+3:4*i])
                );
        end
    endgenerate
    
    encoder enc(
        .op(op),
        .en_op(en_op)
        );

endmodule
