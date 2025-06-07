class axi_vsequencer extends uvm_sequencer#(uvm_sequence_item);
  `uvm_component_utils(axi_vsequencer)
  axi_master_sequencer m_seqr;
  axi_slave_sequencer  s_seqr;
  function new(string name="axi_vsequencer",uvm_component parent);
      super.new(name,parent);
endfunction  
   
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction
      
endclass 
