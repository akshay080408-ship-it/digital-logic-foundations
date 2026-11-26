module barrel_shifter(
    input wire [7:0] data_in,
    input wire [2:0] shift_amt,
    input wire dir,shift_en,
    output wire [7:0] data_out
);
    wire [7:0] stage1_out,stage2_out,stage3_out;
    barrel_stage1 stage1(.data_in(data_in),.dir(dir),.shift_en(shift_amt[0]&shift_en),.data_out(stage1_out));
    barrel_stage2 stage2(.data_in(stage1_out),.dir(dir),.shift_en(shift_amt[1]&shift_en),.data_out(stage2_out));
    barrel_stage3 stage3(.data_in(stage2_out),.dir(dir),.shift_en(shift_amt[2]&shift_en),.data_out(stage3_out));
    assign data_out=stage3_out;
endmodule

module barrel_stage1(input wire [7:0] data_in,input wire dir,shift_en,output reg [7:0] data_out);
always @(*) begin
    if(shift_en) begin
        if(!dir) data_out=data_in<<1;
        else data_out=data_in>>1;
    end else data_out=data_in;
end
endmodule

module barrel_stage2(input wire [7:0] data_in,input wire dir,shift_en,output reg [7:0] data_out);
always @(*) begin
    if(shift_en) begin
        if(!dir) data_out=data_in<<2;
        else data_out=data_in>>2;
    end else data_out=data_in;
end
endmodule

module barrel_stage3(input wire [7:0] data_in,input wire dir,shift_en,output reg [7:0] data_out);
always @(*) begin
    if(shift_en) begin
        if(!dir) data_out=data_in<<4;
        else data_out=data_in>>4;
    end else data_out=data_in;
end
endmodule
