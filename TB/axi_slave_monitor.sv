class axi_slave_monitor extends uvm_monitor;
  `uvm_component_utils(axi_slave_monitor)

  // Interface to capture the AXI signals
 // axi_if intf;

  // Constructor
  function new(string name = "axi_slave_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
/*
  // Set interface for monitor to observe
  function void set_intf(axi_if intf_in);
    intf = intf_in;
  endfunction

  // Monitor the AXI interface for slave responses
  task run_phase(uvm_phase phase);
    axi_seq_item tr;
    forever begin
      // Create transaction object
      tr = axi_seq_item::type_id::create("tr");

      // Monitor for slave-side transactions, e.g., read response or write ack
      if (intf.BVALID && intf.BREADY) begin
        // Capture the write response (B channel)
        tr.is_write = 1; // Write transaction response
        // Capture response values if needed
      end

      if (intf.RVALID && intf.RREADY) begin
        // Capture read response (R channel)
        tr.is_write = 0; // Read transaction response
        tr.data = intf.RDATA;
      end

      // Send the captured transaction to the analysis
      analysis_port.write(tr);
    end
  endtask
  */
endclass
