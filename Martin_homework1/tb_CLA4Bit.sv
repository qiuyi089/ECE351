// tb_CLA4Bit.sv - Test bench for 4-bit carry lookahead adder
//
// Author:  Martin Nguyen
// Date: 4/26/2021
//
//Description: 
// This module the top level testbench for the 4-bit carry lookahead adders
// in ECE 351 Homework #1
////////////////////////////////////////////////////////////////////
module tb_CLA4Bit(ain,bin,cin,sum,cout);
//internal variables
input logic [3:0] ain, bin;
input logic       cin;
output logic [3:0] sum;
output logic       cout;

// instantiate the stimulus generator and adder
stimulus #(.nBITS(4)) TESTGEN (.*);
CLA4Bit  DUT (.*, .cin(cin));
endmodule: tb_CLA4Bit;

module CLA4Bit(ain,bin,cin,sum,cout);
// internal variables
input logic [3:0] ain, bin;
input logic       cin;
output logic [3:0] sum;
output logic       cout;

timeunit 1ns/1ns;
wire p[3:0],g[3:0];
wire c0,c1,c2,c3,c4;

assign  p[0] = (ain[0] ^ bin[0]);
assign 	p[1] = (ain[1] ^ bin[1]);
assign 	p[2] = (ain[2] ^ bin[2]);
assign  p[3] = (ain[3] ^ bin[3]);


assign  g[0] = (ain[0] & bin[0]);
assign  g[1] = (ain[1] & bin[1]);
assign  g[2] = (ain[2] & bin[2]);
assign  g[3] = (ain[3] & bin[3]);

assign  c0 = cin;
assign  c1 = c0 & p[0] | g[0];
assign  c2 = (c1 & p[0]| g[0]) & p[1] | g[1];
assign  c3 = (c1 & p[1] | g[1]) & p[2] | g[2];
assign c4 = (c0&p[0]&p[1]&p[2]&p[3]) | (p[3]&p[2]&p[1]&g[0]) + (p[3]&p[2]&g[1]) | (g[2]&p[3]) | g[3];

assign  sum[0] = ain[0] ^ bin[0] ^ cin;
assign  sum[1] = ain[1] ^ bin[1] ^ c1;
assign  sum[2] = ain[2] ^ bin[2] ^ c2;
assign  sum[3] = ain[3] ^ bin[3] ^ c3;

assign cout = c4;
endmodule: CLA4Bit;






