`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2020 18:33:42
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
    output wire to_next,
    output wire [3:0] latch
    );

    wire [3:0] CO;
    wire [3:0] O;
    reg gnd=0;
    wire [3:0] DI;
    wire [3:0] S;
     
    assign S[0]=1;
    assign S[1]=1;
    assign S[2]=1;
    assign S[3]=1;
        
    assign DI[0]=0;
    assign DI[1]=0;
    assign DI[2]=0;
    assign DI[3]=0;
    
    //assign gnd=0;
    
    assign to_next=CO[3];
    
    CARRY4 CARRY4_inst(
            .CO(CO),         //4-bitcarryout
            .O(O),           //4-bitcarrychainXORdataout
            .CI(start),         //1-bitcarrycascadeinput
            .CYINIT(gnd), //1-bitcarryinitialization
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
        .Q(latch[0]),//1-bitoutput:Data
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
        .Q(latch[1]),//1-bitoutput:Data
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
        .Q(latch[2]),//1-bitoutput:Data
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
        .Q(latch[3]),//1-bitoutput:Data
        .C(stop),//1-bitinput:Clock
        .CE(1),//1-bitinput:Clockenable
        .D(CO[3]),//1-bitinput:Data
        .R(0)//1-bitinput:Synchronousreset
        );

endmodule
