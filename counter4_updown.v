module counter4_updown(
    input wire clk,rst,en,dir,load,
    input wire [3:0]data,
    output reg [3:0]count
);
always @(posedge clk) begin
    if (rst)
        count<=4'b0000;
    else if (load)
        count<=data;
    else if (en && dir)
        count<=count+1'b1;
    else if (en && !dir)
        count<=count-1'b1;
end
endmodule
