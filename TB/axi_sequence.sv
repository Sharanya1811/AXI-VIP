class axi_sequence extends uvm_sequence#(axi_trans);
  `uvm_object_utils(axi_sequence)
  function new(string name="axi_sequence");
    super.new(name); 
  endfunction
endclass

class axi_write_sequence extends uvm_sequence#(axi_trans);
  `uvm_object_utils(axi_write_sequence)
  
  function new(string name="");
    super.new(name);
  endfunction
  
  task body();
    axi_trans req;
    repeat(2) begin
      req=new();
      start_item(req);
      assert(req.randomize() with {AWVALID==1;AWCACHE==4'b0011;AWPROT==3'b000;WVALID==1;WR==1;BREADY==1;});
      finish_item(req);
      end
  endtask
endclass
