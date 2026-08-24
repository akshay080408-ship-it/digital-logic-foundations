module encoder4to2(
     input wire a,
     input wire b,
     input wire c,
     input wire d,
     output reg y0,
     output reg y1
);

always @(*) begin 
  case ({a,b,c,d})

     4'b0001: begin
        y0 = 1'b0;
        y1 = 1'b0;
     end

     4'b0010: begin
        y0 = 1'b1;
        y1 = 1'b0;
     end

     4'b0100: begin
        y0 = 1'b0;
        y1 = 1'b1;
     end

     4'b1000: begin
        y0 = 1'b1;
        y1 = 1'b1;
     end
     
     default: begin
     y0 = 1'b0;
     y1 = 1'b0;
     end 
  endcase
end

endmodule