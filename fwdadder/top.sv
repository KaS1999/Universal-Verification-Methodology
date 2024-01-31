`include"package.sv"
`include"interface.sv"
`include"dut.sv"

module top();
import uvm_pkg::*;
import pack::*;

bit clk;
intf if3();
adder dut(if3);

initial begin 
if3.clk=0;
end
always #5 if3.clk=~if3.clk;

initial begin
uvm_config_db #(virtual intf) ::set(null,"*","if1",if3);
run_test("my_test");
end
endmodule
