`timescale 1ns / 1ps

module wrapper#(parameter N = 28)(
input logic clk,
input logic rst,
input logic direction,
input logic en,
output logic [7:0] an,
output logic [7:0] sseg
);
    
//local declarations
logic [7:0] an1; //[3;0]
logic [7:0] an2;
logic [7:0] sseg1;
logic [7:0] sseg2;
    
clockwise #(.N(N))cw_unit(
.clk(clk),
.rst(rst),
.enable(en),
.an(an1),
.sseg(sseg1)
 );
 
counter_clock #(.N(N))ccw_unit(
.clk(clk),
.rst(rst),
.enable(en),
.an(an2),
.sseg(sseg2)
);

an_mux a_mux_unit(
.an1(an1),
.an2(an2),
.sel(direction),
.an(an)
 );
 
sseg_mux s_mux_unit(
.sseg1(sseg1),
.sseg2(sseg2),
.sel(direction),
.sseg(sseg)
);

assign an[7:4] = 4'b1111;
 
endmodule
