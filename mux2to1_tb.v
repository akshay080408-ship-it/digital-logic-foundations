`timescale 1ns/1ps
module mux2to1_tb;
    reg a,b,sel;
    wire y;
    integer i,j,pass_count,fail_count,test_no;
    reg expected;
    mux2to1 dut(.a(a),.b(b),.sel(sel),.y(y));
    task check_output;
    begin
        test_no=test_no+1;
        if(y!==expected) begin fail_count=fail_count+1; $display("FAIL test=%0d got=%b expected=%b",test_no,y,expected); end
        else pass_count=pass_count+1;
    end
    endtask
    initial begin
        $dumpfile("mux2to1.vcd"); $dumpvars(0,mux2to1_tb);
        pass_count=0; fail_count=0; test_no=0;
        for(i=0;i<2;i=i+1) for(j=0;j<2;j=j+1) begin
            a=i; b=j; sel=0; expected=a; #1; check_output();
            sel=1; expected=b; #1; check_output();
        end
        $display("TOTAL=%0d PASS=%0d FAIL=%0d",test_no,pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        $finish;
    end
endmodule
