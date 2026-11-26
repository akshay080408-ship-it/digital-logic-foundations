`timescale 1ns/1ps
module shift_register_tb;
    reg clk,rst,serial_in;
    wire serial_out,q0,q1,q2,q3;
    shift_register_4bit dut(.clk(clk),.rst(rst),.serial_in(serial_in),.q0(q0),.q1(q1),.q2(q2),.q3(q3),.serial_out(serial_out));
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        $dumpfile("shift_register.vcd"); $dumpvars(0,shift_register_tb);
        rst=1; serial_in=0; @(negedge clk); rst=0;
        serial_in=1; @(negedge clk);
        serial_in=0; @(negedge clk);
        serial_in=1; @(negedge clk);
        serial_in=1; @(negedge clk);
        $finish;
    end
    initial $monitor("t=%0t clk=%b rst=%b serial_in=%b q=%b%b%b%b serial_out=%b",$time,clk,rst,serial_in,q3,q2,q1,q0,serial_out);
endmodule
