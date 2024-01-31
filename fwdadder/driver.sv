class my_driver extends uvm_driver #(seq_item);
`uvm_component_utils(my_driver)
seq_item req;

virtual intf vif;
function new( string name="",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	uvm_config_db #(virtual intf)::get(this,"","if1",vif);
endfunction

task run_phase(uvm_phase phase);
	

forever begin
@(negedge vif.clk)
		seq_item_port.get_next_item(req);

		vif.a=req.a;
		vif.b=req.b;	
		req.print();		

		seq_item_port.item_done(req);
	end
endtask

endclass
