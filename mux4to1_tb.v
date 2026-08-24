`timescale 1ns/1ps
module mux4to1_tb;
        reg a,b,c,d;
        reg [1:0] sel;
        wire y;
        mux4to1 uut(
            .a(a),
            .b(b),
            .c(c),
            .d(d),
            .sel(sel),
            .y(y)
        );
        initial begin
            $dumpfile("mux4to1.vcd");
            $dumpvars(0,mux4to1_tb);
            a=1; b=0; c=0; d=0; sel=2'b00; #10;
            a=0; b=1; c=0; d=0; sel=2'b01; #10;
            a=0; b=0; c=1; d=0; sel=2'b10; #10;
            a=0; b=0; c=0; d=1; sel=2'b11; #10;
            $finish;
        end  
        initial 
            $monitor("time=%0t a=%b b=%b c=%b d=%b sel=%b y=%b",$time,a,b,c,d,sel,y);
endmodule            