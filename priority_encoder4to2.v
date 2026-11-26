module priority_encoder4to2(
    input wire d3,d2,d1,d0,
    output reg y0,y1,valid
);
always @(*) begin
    if (d3) begin
        y0=1'b1; y1=1'b1; valid=1'b1;
    end else if (d2) begin
        y0=1'b0; y1=1'b1; valid=1'b1;
    end else if (d1) begin
        y0=1'b1; y1=1'b0; valid=1'b1;
    end else if (d0) begin
        y0=1'b0; y1=1'b0; valid=1'b1;
    end else begin
        y0=1'b0; y1=1'b0; valid=1'b0;
    end
end
endmodule
