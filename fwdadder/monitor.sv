class mon extends uvm_monitor;
`uvm_component_utils(mon)
virtual intf vif;
seq_item seq;

function new(string name="",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	seq=seq_item::type_id::create("seq",this);
	if(!uvm_config_db #(virtual intf)::get(this,"","if1",vif))
		`uvm_error("MON","interface not available busy")
endfunction

task run_phase(uvm_phase phase);
forever begin
	@(posedge vif.clk)
	seq.a=vif.a;
	seq.b=vif.b;
	seq.sum=vif.sum;
	seq.carry=vif.carry;

 //`uvm_info("monitor",$sformatf("a is %0d\n,b is %od\n sum is %0d\n, carry is %0d",seq.a,seq.b,seq.sum,seq.carry),UVM_NONE)
 $display("-----------------------------------------------------------------------------------------------------");

seq.print();
end
endtask
endclass


