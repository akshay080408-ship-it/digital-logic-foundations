 `timescale 1ns/1ps
module encoder4to2_tb;
    reg a, b, c, d;
    wire y0, y1;
    encoder4to2 uut (
        .a(a), .b(b), .c(c), .d(d),
        .y0(y0), .y1(y1)
    );
    initial begin
        $dumpfile("encoder4to2.vcd");
        $dumpvars(0, encoder4to2_tb);
        a=0; b=0; c=0; d=1;  #10;   
        a=0; b=0; c=1; d=0;  #10;   
        a=0; b=1; c=0; d=0;  #10;   
        a=1; b=0; c=0; d=0;  #10;   
        a=0; b=0; c=0; d=0;  #10;    
        a=1; b=0; c=1; d=0;  #10; 
        $finish;
    end
    initial
        $monitor("t=%0t a=%b b=%b c=%b d=%b | y0=%b y1=%b", $time, a, b, c, d, y0, y1);
endmodule