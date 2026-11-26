module register4bit(
    input wire clk,en,rst,
    input wire [3:0] d,
    output reg [3:0] q
);
always @(posedge clk) begin
    if(rst) q<=4'b0000;
    else if(en) q<=d;
end
endmodule
