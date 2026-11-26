`timescale 1ns/1ps
module priority_encoder4to2_tb;
    reg d3,d2,d1,d0;
    wire y0,y1,valid;
    integer i,pass_count,fail_count,test_no;
    reg [1:0] expected;
    reg valid_expected;
    priority_encoder4to2 dut(
        .d3(d3),.d2(d2),.d1(d1),.d0(d0),
        .y0(y0),.y1(y1),.valid(valid)
    );
    task check_output;
    begin
        if ({y1,y0,valid} !== {expected,valid_expected}) begin
            fail_count=fail_count+1;
            $display("FAIL: Test=%0d got=%b expected=%b",test_no,{y1,y0,valid},{expected,valid_expected});
        end else begin
            pass_count=pass_count+1;
            $display("PASS: Test=%0d got=%b",test_no,{y1,y0,valid});
        end
    end
    endtask
    initial begin
        $dumpfile("priority_encoder4to2.vcd");
        $dumpvars(0,priority_encoder4to2_tb);
        test_no=0; pass_count=0; fail_count=0;
        for(i=0;i<16;i=i+1) begin
            {d3,d2,d1,d0}=i;
            if(d3) begin expected=2'b11; valid_expected=1; end
            else if(d2) begin expected=2'b10; valid_expected=1; end
            else if(d1) begin expected=2'b01; valid_expected=1; end
            else if(d0) begin expected=2'b00; valid_expected=1; end
            else begin expected=2'b00; valid_expected=0; end
            test_no=test_no+1;
            #1;
            check_output();
        end
        $display("TOTAL=%0d PASS=%0d FAIL=%0d",test_no,pass_count,fail_count);
        if(fail_count!=0) $fatal(1,"TEST FAILED");
        else $display("ALL TESTS PASSED");
        $finish;
    end
endmodule
