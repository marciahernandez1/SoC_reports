`timescale 1ns / 1ps

module clockwise#(parameter N = 28)(
    input logic clk,
    input logic rst,
    input logic enable,
    output logic [7:0] an,
    output logic [7:0] sseg
    );
   
    //localparam N = 28;
    
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    assign an[7:4] = 4'b1111;
    
    always_ff @(posedge clk, posedge rst)
       if(rst)
          q_reg <= 0;
       else if (enable)
          q_reg <= q_next;
          
   //next state logic 
   assign q_next = q_reg +1; //for each state 
   
   //
   always_comb //8cases
      case(q_reg[N-1:N-3])  //q_reg[N-1:N-3]
         3'b000:
         begin
            an[3:0] = 4'b0111; 
            sseg =  8'b10011100;
         end
         
         3'b001:
         begin
            an[3:0] = 4'b1011; 
            sseg = 8'b10011100;
         end
         
         3'b010:
         begin
            an[3:0] = 4'b1101;
            sseg = 8'b10011100;
         end
         
         3'b011:
         begin
            an[3:0] = 4'b1110;
            sseg = 8'b10011100;
         end
         
         3'b100:
         begin
            an[3:0] = 4'b1110;
            sseg = 8'b10100011; //bottom fourth
         end
         
         3'b101:
         begin
            an[3:0] = 4'b1101;
            sseg = 8'b10100011; //bottom 
         end
         
         3'b110:
         begin
            an[3:0] = 4'b1011;
            sseg = 8'b10100011; //bottom 
         end
         
         default:
         begin
            an[3:0] = 4'b0111;
            sseg = 8'b10100011; //bottom 
         end
         
      endcase   
      
endmodule
