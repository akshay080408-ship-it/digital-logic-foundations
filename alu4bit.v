module alu4bit(
input wire [3:0]a,
input wire [3:0]b,
input wire [1:0]sel,
output reg [3:0]result,
output reg cout
);
always @(*) begin
 case(sel)
   2'b00 :
      begin 
      {cout,result} = a+b;
  end
2'b01 :
      begin 
      {cout,result} = a-b;
  end
2'b10 :
      begin 
      result = a&b;
      cout=1'b0;
  end
2'b11 :
      begin 
      result = a|b;
      cout=1'b0;
  end
  endcase
end
endmodule


