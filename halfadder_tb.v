`timescale 1ns/1ps
module halfadder_tb;
    reg a,b;
    wire sum,cout;
    integer i,j,pass_count,fail_count;
    reg [1:0]expected;
    halfadder dut(
        .a(a),.b(b),
        .sum(sum),.cout(cout)
    );
    task check_output;
    begin
        if ({sum,cout}!==expected) begin
            fail_count=fail_count+1;
            $display("FAIL: a=%b b=%b got=%b expected=%b",a,b,{sum,cout},expected);
        end else begin
            pass_count=pass_count+1;
            $display("PASS: a=%b b=%b got=%b expected=%b",a,b,{sum,cout},expected);
        end
    end
    endtask
    initial begin
        $dumpfile("halfadder.vcd");
        $dumpvars(0,halfadder_tb);
        pass_count=0;
        fail_count=0;
        for(i=0;i<2;i=i+1) begin
            for(j=0;j<2;j=j+1) begin
                a=i; b=j;
                expected={a^b,a&b};
                #1;
                check_output();
            end
        end
        $display("PASS=%0d FAIL=%0d",pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        else $display("ALL TESTS PASSED");
        $finish;
    end
endmodule
