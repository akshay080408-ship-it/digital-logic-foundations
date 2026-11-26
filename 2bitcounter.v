module two_bit_counter (
    input wire clk,rst,en,
    output reg [1:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 2'b00;
        else if (en && count != 2'b11)
            count <= count + 1'b1;
    end
endmodule
