/////////////////////////////////////TOP///////////////////////////////////////////////////////


`include "my_package.svh"
`include "design.sv"
`include "dut_if.sv"


module top();

 import uvm_pkg::*;
 import my_package::*;

 dut_if if1();
 multiplier fl(if1);

 initial begin
   if1.clk = 1'b0;
   forever #5 if1.clk = ~if1.clk;
 end

 initial begin
   uvm_config_db#(virtual dut_if) :: set(null,"*","vif",if1);
   run_test("my_test");
  #600 $finish;
 end


endmodule