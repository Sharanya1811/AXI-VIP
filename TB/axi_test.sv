class axi_test extends uvm_test;
  `uvm_component_utils(axi_test)

  axi_env env;
  axi_config cfg;
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual axi_interface)::get(this,"","axi_interface",cfg.vif))
      `uvm_fatal(get_full_name(),"No interface is set")

    uvm_config_db#(axi_config)::set(this,"*","axi_config",cfg);
    env = axi_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);


    phase.drop_objection(this);
  endtask
endclass


class axi_write_test extends axi_test;
  `uvm_component_utils(axi_write_test)
    axi_write_sequence seq1;
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq1=axi_write_sequence::type_id::create("axi_write_sequence");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq1.start(env.vseqr.m_seqr);
    phase.drop_objection(this);
  endtask
endclass
