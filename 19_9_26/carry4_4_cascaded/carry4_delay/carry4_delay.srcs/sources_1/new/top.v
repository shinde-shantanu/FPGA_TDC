`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2019 19:22:54
// Design Name: 
// Module Name: top
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


module top(
    output wire [3:0] CO,
    output wire [3:0] O,
    //input CI,
    input CYINIT
    //input wire [3:0] DI,
    //input wire [3:0] S
    );
    
    wire CI;
    //wire CYINIT;
    wire [3:0] DI;
    wire [3:0] S;
    wire [3:0] CO1;
    wire [3:0] CO2;
    wire [3:0] CO3;
    //wire [3:0] CO3;
    wire [3:0] O1;
    wire [3:0] O2;
    wire [3:0] O3;
    
    assign CI=0;
    //assign CYINIT=0;
    
    assign S[0]=1;
    assign S[1]=1;
    assign S[2]=1;
    assign S[3]=1;
    
    assign DI[0]=0;
    assign DI[1]=0;
    assign DI[2]=0;
    assign DI[3]=0;

    CARRY4 CARRY4_inst1(
        .CO(CO1),         //4-bitcarryout
        .O(O1),           //4-bitcarrychainXORdataout
        .CI(CI),         //1-bitcarrycascadeinput
        .CYINIT(CYINIT), //1-bitcarryinitialization
        .DI(DI),         //4-bitcarry-MUXdatain
        .S(S)            //4-bitcarry-MUXselectinput
        );
    
    CARRY4 CARRY4_inst2(
        .CO(CO2),        //4-bitcarryout
        .O(O2),          //4-bitcarrychainXORdataout
        .CI(CO1[3]),     //1-bitcarrycascadeinput
        .CYINIT(CI),     //1-bitcarryinitialization
        .DI(DI),         //4-bitcarry-MUXdatain
        .S(S)            //4-bitcarry-MUXselectinput
        );
        
    CARRY4 CARRY4_inst3(
        .CO(CO3),        //4-bitcarryout
        .O(O3),          //4-bitcarrychainXORdataout
        .CI(CO2[3]),     //1-bitcarrycascadeinput
        .CYINIT(CI),     //1-bitcarryinitialization
        .DI(DI),         //4-bitcarry-MUXdatain
        .S(S)            //4-bitcarry-MUXselectinput
        );
            
    CARRY4 CARRY4_inst4(
        .CO(CO),         //4-bitcarryout
        .O(O),           //4-bitcarrychainXORdataout
        .CI(CO3[3]),     //1-bitcarrycascadeinput
        .CYINIT(CI),     //1-bitcarryinitialization
        .DI(DI),         //4-bitcarry-MUXdatain
        .S(S)            //4-bitcarry-MUXselectinput
        );

endmodule