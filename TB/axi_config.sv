class axi_config extends uvm_object;
  `uvm_object_utils(axi_config)
  
  uvm_active_passive_enum is_active_master= UVM_ACTIVE;
  uvm_active_passive_enum is_active_slave= UVM_PASSIVE;
  virtual axi_interface vif;
  bit axi_as_master=1;
  bit axi_as_slave=0;
  bit has_axi_scoreboard=1;
  int wait_time=0;
  
  extern function new(string name="axi_config");
endclass


    function axi_config::new(string name="axi_config");
    super.new(name);
  endfunction
