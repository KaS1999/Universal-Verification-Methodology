class my_test extends uvm_test ;
`uvm_component_utils(my_test)
my_env env;
//my_sequence seq;

function new( string name="",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
env = my_env::type_id::create("env",this);
//seq=my_sequence::type_id::create("seq");
endfunction

 task run_phase(uvm_phase phase);

		phase.raise_objection(this);
		`uvm_info("TEST", "Starting the sequence", UVM_NONE)
		phase.drop_objection(this);
	endtask

endclass

