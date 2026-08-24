module decoder2to4(
   input wire a,
   input wire b,
   output reg y0,
   output reg y1,
   output reg y2,
   output reg y3
);
 always @(*) begin 
  case ({a,b})
     2'b00 : 
      begin
        y0=1'b1;
        y1=1'b0;
        y2=1'b0;
        y3=1'b0;
     end

     2'b01 : 
      begin
        y0=1'b0;
        y1=1'b1;
        y2=1'b0;
        y3=1'b0;
     end

     2'b10 : 
      begin
        y0=1'b0;
        y1=1'b0;
        y2=1'b1;
        y3=1'b0;
     end

     2'b11 : 
      begin
        y0=1'b0;
        y1=1'b0;
        y2=1'b0;
        y3=1'b1;
     end
  endcase
end

endmodule
