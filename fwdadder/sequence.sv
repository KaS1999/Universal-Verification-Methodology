class my_sequence extends uvm_sequence #(seq_item);
`uvm_object_utils(my_sequence)
seq_item seq;

function new(string name="");
	super.new();
endfunction


task body();
seq=seq_item::type_id::create("seq");
begin 

	repeat(5)
begin
	`uvm_do(seq)	


			/*start_item(seq);
			seq.randomize();
			seq.print();
		finish_item(seq);*/
end
end
endtask
endclass

