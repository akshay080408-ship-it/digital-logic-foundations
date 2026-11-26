module jk_flip_flop(
    input wire clk,j,k,
    output reg q
);
always @(posedge clk) begin
    if(j && !k) q<=1'b1;
    else if(!j && k) q<=1'b0;
    else if(j && k) q<=~q;
end
endmodule
