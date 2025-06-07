class axi_slave_sequencer extends uvm_sequencer#(axi_trans);
  `uvm_component_utils(axi_slave_sequencer)
  
   axi_config cfg;

  extern function new(string name="axi_slave_sequencer",uvm_component parent); 
  extern function void build_phase(uvm_phase phase);
  
endclass
      
    function axi_slave_sequencer::new(string name="axi_slave_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void axi_slave_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(axi_config)::get(this,"","axi_config",cfg))
      `uvm_fatal(get_full_name(),"No interface is set")
  endfunction
    
