// tb_CLA8Bit.sv - Test bench for 8-bit carry lookahead adder
//
// Author:  Martin Nguyen
// Date: 4/28/2021
//
// This module the top level testbench for the 8-bit carry lookahead adders
// in ECE 351 Homework #1
////////////////////////////////////////////////////////////////////
module tb_CLA8BIT;
// internal variables
logic [7:0] ain, bin;
logic       cin;
logic [7:0] sum;
logic       cout;

// instantiate the stimulus generator and adder
stimulus #(.nBITS(8)) TESTGEN (.*);
CLA8Bit  DUT (.*, .cin(cin));

endmodule: tb_CLA8BIT;

module CLA8Bit(
// internal variables
input [7:0] ain, bin,
input  cin,
output logic [7:0] sum,
output logic       cout
);
wire con;

CLA4Bit num1(.ain(ain[3:0]),.bin(bin[3:0]),.cin(cin),.sum(sum[3:0]),.cout(con));
CLA4Bit num2(.ain(ain[7:4]),.bin(bin[7:4]),.cin(con),.sum(sum[7:4]),.cout(cout));

endmodule : CLA8Bit;



