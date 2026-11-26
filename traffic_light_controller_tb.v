`timescale 1ns/1ps
module traffic_light_controller_tb;
reg clk,rst; wire [1:0] state; integer i,pass_count,fail_count; reg [1:0] expected;
traffic_light_controller dut(.clk(clk),.rst(rst),.state(state));
initial clk=0; always #5 clk=~clk;
task check_output; begin if(state!==expected) begin fail_count=fail_count+1; $display("FAIL got=%b expected=%b",state,expected); end else pass_count=pass_count+1; end endtask
initial begin
$dumpfile("traffic_light_controller.vcd"); $dumpvars(0,traffic_light_controller_tb);
pass_count=0; fail_count=0; expected=2'b00;
@(negedge clk); rst=1; @(posedge clk); #1; check_output();
for(i=0;i<3;i=i+1) begin
@(negedge clk); rst=0;
expected=(expected==2'b00)?2'b01:(expected==2'b01)?2'b10:2'b00;
@(posedge clk); #1; check_output();
end
$display("PASS=%0d FAIL=%0d",pass_count,fail_count);
if(fail_count!=0) $fatal(1,"TEST FAILED");
$finish;
end
endmodule
