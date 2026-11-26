module t_flip_flop(input wire clk,r,t,output reg q);
always @(posedge clk) begin if(r) q<=1'b0; else if(t) q<=~q; end
endmodule
