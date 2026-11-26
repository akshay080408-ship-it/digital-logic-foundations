module quiet_counter(
    input wire clk,rst,loud,
    output reg [1:0] quiet_count
);
always @(posedge clk) begin
    if(rst) quiet_count<=2'b00;
    else if(loud) quiet_count<=2'b00;
    else if(quiet_count!=2'b11) quiet_count<=quiet_count+1'b1;
end
endmodule
