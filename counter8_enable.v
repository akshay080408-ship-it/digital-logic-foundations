module counter8_enable(
    input wire clk,rst,en,
    output reg [7:0] count
);
always @(posedge clk) begin
    if (rst) count <= 8'd0;
    else if (en) count <= count + 1'b1;
end
endmodule
