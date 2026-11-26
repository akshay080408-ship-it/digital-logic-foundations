module sr_flip_flop(input wire clk,s,r,output reg q);
always @(posedge clk) begin
    if(s && !r) q<=1'b1;
    else if(!s && r) q<=1'b0;
    else if(s && r) q<=1'bx;
end
endmodule
