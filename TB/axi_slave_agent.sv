class axi_slave_agent extends uvm_agent;
  `uvm_component_utils(axi_slave_agent)

  axi_slave_driver    driver;
  axi_slave_monitor   monitor;
  axi_slave_sequencer sequencer;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    driver    = axi_slave_driver::type_id::create("driver", this);
    monitor   = axi_slave_monitor::type_id::create("monitor", this);
    sequencer = axi_slave_sequencer::type_id::create("sequencer", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
