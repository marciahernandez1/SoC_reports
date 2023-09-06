`timescale 1ns / 1ps

module sseg_mux(
 input logic [7:0] sseg1,
 input logic [7:0] sseg2,
 input logic sel,
 output logic [7:0] sseg
 );
    
 assign sseg = sel ? sseg1 : sseg2;
endmodule
