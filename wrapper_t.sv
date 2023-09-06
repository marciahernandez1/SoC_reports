`timescale 1ns / 1ps

module wrapper_t();

parameter N = 3;
logic clk;
logic rst;
logic direction;
logic en;
logic [7:0] an;
logic [7:0] sseg;

wrapper #(.N(N))dut(
.clk(clk),
.rst(rst),
.direction(direction),
.en(en),
.an(an),
.sseg(sseg)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rst = 0;
#10;
rst = 1;
#10; 

rst = 0;
direction = 0; 
en = 1;
#70;

rst = 0;
direction = 1;
en = 1;
#70;

rst = 0;
direction = 1;
en = 0;
#30;
$finish;

end

endmodule
