interface intf();
bit clk;
logic [3:0]a;
logic [3:0]b;
logic [3:0]sum;
logic [3:0]carry;
modport adder (input a,b,clk,output sum,carry);
endinterface
