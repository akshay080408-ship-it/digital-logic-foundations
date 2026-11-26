module shift_register_4bit(
    input wire clk,serial_in,rst,
    output reg q0,q1,q2,q3,
    output wire serial_out
);
always @(posedge clk) begin
    if(rst) begin q0<=0; q1<=0; q2<=0; q3<=0; end
    else begin q0<=serial_in; q1<=q0; q2<=q1; q3<=q2; end
end
assign serial_out=q3;
endmodule
