class my_agent extends uvm_agent ;
`uvm_component_utils(my_agent)

my_driver drive;
mon monitor;
my_sequence seq;
uvm_sequencer #(seq_item) seqr;

function new( string name="",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
//if(get_is_active() == UVM_ACTIVE)
//begin
	drive=my_driver::type_id::create("drive",this);
	seqr=uvm_sequencer #(seq_item)::type_id::create("seqr",this);
	
//end
monitor=mon::type_id::create("monitor",this);
endfunction

task run_phase(uvm_phase phase);

	
		phase.raise_objection(this);

		seq=my_sequence::type_id::create("seq");
			seq.start(seqr);
		phase.drop_objection(this);

endtask

function void connect_phase(uvm_phase phase);
//if(get_is_active() == UVM_ACTIVE)
	drive.seq_item_port.connect(seqr.seq_item_export);
endfunction
endclass
