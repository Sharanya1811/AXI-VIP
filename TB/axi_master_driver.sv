class axi_master_driver extends uvm_driver#(axi_trans);
  `uvm_component_utils(axi_master_driver)
   int time_out;
  virtual axi_interface  vif;
  axi_config cfg;

  function new(string name="axi_master_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(axi_config)::get(this,"","axi_config",cfg))
      `uvm_fatal(get_full_name(),"No interface is set")
  endfunction 
      
       
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif=cfg.vif;
  endfunction 
      
  task run_phase(uvm_phase phase);
    reset();
    forever begin
      seq_item_port.get_next_item(req);
      drive_item(req);
      seq_item_port.item_done();
    end
  endtask
  
  task reset();
    @(posedge vif.ARESETn);
     vif.AWADDR<=0;
     vif.AWVALID<=0;
  /*   vif.AWID<=0;
     vif.AWLEN<=0;
     vif.ASIZE<=0;
     vif.ABURST<=0;*/
    
     vif.WDATA<=0;
     vif.WVALID<=0;
    
     vif.ARADDR<=0;
     vif.ARVALID<=0;  
     vif.RREADY<=0;
    
     vif.BRESP<=0;
     vif.BREADY<=0;
  endtask
  
  task drive_item(axi_trans req);
    if(req.WR) begin 
      write_trans();
    end
    else begin
      read_trans();
    end   
  endtask
  
  task read_trans();
  endtask
  
  task write_trans();
    fork
    write_addr_hs();
    write_data_response_hs();
    join
  endtask
  
  task write_addr_hs();
    int time_out;
    @(posedge vif.ACLK)
      vif.AWVALID<= req.AWVALID;
      vif.AWADDR <=req.AWADDR;
      vif.AWCACHE <=req.AWCACHE;
      vif.AWPROT <=req.AWPROT;
      vif.WDATA<=req.WDATA;
    for(time_out=0;time_out<30;time_out=time_out+1) begin
      @(posedge vif.ACLK)
      if(vif.AWREADY) begin
         break;
      end
    end
    `uvm_info(get_full_name(),$sformatf("AWVALID=%d",vif.AWVALID),UVM_LOW);      `uvm_info(get_full_name(),$sformatf("AWADDR=%d",vif.AWADDR),UVM_LOW);
              `uvm_info(get_full_name(),$sformatf("AWDATA=%d",vif.WDATA),UVM_LOW);

    vif.AWVALID<=0;
  endtask
      
  
  task write_data_response_hs();
    int time_out;
    @(posedge vif.ACLK)
      vif.WVALID<= req.WVALID;
      vif.BREADY<=req.BREADY;
    for(time_out=0;time_out<30;time_out=time_out+1) begin
      @(posedge vif.ACLK)
      if(vif.WREADY) begin
         break;
      end
    end  
    //if(time_out==30)
     // `uvm_error()
    vif.WVALID<=0;
    @(posedge vif.ACLK)
     vif.BVALID<=req.BVALID;
    
   vif.BREADY<=0;
  endtask
  
  task write_reponse_hs();
    int time_out;
    
    for(time_out=0;time_out<30;time_out=time_out+1) begin
      @(posedge vif.ACLK)
      if(vif.WVALID && vif.WREADY)
        vif.BVALID<= req.BVALID;
    end
    for(time_out=0;time_out<30;time_out=time_out+1) begin
      @(posedge vif.ACLK)
      if(vif.BREADY) begin
         break;
      end
    end
   // req.print();
  endtask

  
endclass
