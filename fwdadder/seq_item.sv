class seq_item extends uvm_sequence_item;

randc bit [3:0]a;
randc bit [3:0]b;
bit [3:0]sum;
bit [3:0]carry;

`uvm_object_utils_begin(seq_item)
`uvm_field_int(a,UVM_ALL_ON)
`uvm_field_int(b,UVM_ALL_ON)
`uvm_field_int(sum,UVM_ALL_ON)
`uvm_field_int(carry,UVM_ALL_ON)
`uvm_object_utils_end

constraint c1{a<8;b<8;}

function new(string name="");
	super.new(name);
endfunction
endclass


