class axi_slave_driver extends uvm_driver #(axi_trans);
  `uvm_component_utils(axi_slave_driver)

 // virtual axi_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   // if (!uvm_config_db#(virtual axi_if)::get(this, "", "vif", vif))
    //  `uvm_fatal("NOVIF", "Virtual interface not set for axi_slave_driver!")
  endfunction

  task run_phase(uvm_phase phase);
   /* axi_seq_item req;

    forever begin
      // Slave waits for request from Master (e.g., AWVALID and WVALID for writes)
      @(posedge vif.ACLK);
      if (vif.AWVALID && vif.WVALID && vif.BREADY) begin
        req = axi_seq_item::type_id::create("req");

        req.addr = vif.AWADDR;
        req.data = vif.WDATA;
        req.is_write = 1;

        // Respond with BVALID & BRESP
        vif.BVALID <= 1;
        vif.BRESP  <= 2'b00;  // OKAY response
        wait (vif.BREADY);
        vif.BVALID <= 0;

        `uvm_info("AXI_SLAVE_DRV", $sformatf("Handled Write Req: %s", req.convert2string()), UVM_MEDIUM)
      end

      // Read request
      if (vif.ARVALID && vif.RREADY) begin
        req = axi_seq_item::type_id::create("req");
        req.addr = vif.ARADDR;
        req.is_write = 0;

        // Respond with dummy read data
        vif.RVALID <= 1;
        vif.RDATA  <= 32'hCAFE_BABE; // Example data
        vif.RRESP  <= 2'b00;
        wait (vif.RREADY);
        vif.RVALID <= 0;

        `uvm_info("AXI_SLAVE_DRV", $sformatf("Handled Read Req: %s", req.convert2string()), UVM_MEDIUM)
      end
    end*/
  endtask
endclass
