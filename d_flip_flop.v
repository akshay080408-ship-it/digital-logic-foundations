module d_flip_flop(
    input wire clk,en,rst,
    input wire d,
    output reg q
);
always @(posedge clk) begin
    if(rst) q<=1'b0;
    else if(en) q<=d;
end
endmodule
