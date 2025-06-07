class axi_master_monitor extends uvm_monitor;
  `uvm_component_utils(axi_master_monitor)
  uvm_analysis_port#(axi_trans)master_mon2sb;
   int time_out;
  virtual axi_interface  vif;
  axi_config cfg;

  function new(string name="axi_master_monitor", uvm_component parent);
    super.new(name,parent);
    master_mon2sb=new("master_mon2sb",this);
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
    axi_trans req;
    req=new();
//    req = axi_trans::type_id::create("req");
    forever begin
      collect_data(req);
    end
  endtask

  task collect_data(axi_trans req);
    if(req.WR)
      write_trans(req);
    else
      read_trans(req);
  endtask
  
  task write_trans(axi_trans req);
    @(posedge vif.ACLK)
    if(vif.AWVALID && vif.AWREADY && vif.WVALID &&  vif.WREADY) begin
      req.AWVALID=vif.AWVALID;
      req.AWREADY=vif.AWREADY;
      req.AWADDR=vif.AWADDR;
      req.WDATA=vif.WDATA;
      req.AWCACHE=vif.AWCACHE;
      req.AWPROT=vif.AWPROT;
    
      @(posedge vif.ACLK)
    if(vif.BREADY && vif.BVALID) begin     
      req.BREADY=vif.BREADY;
      req.BVALID=vif.BVALID;
      req.BRESP=vif.BRESP;

      master_mon2sb.write(req);
    end  
    end
    `uvm_info(get_full_name(),$sformatf("AWVALID=%d",req.AWVALID),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("AWREADY=%d",req.AWREADY),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("AWADDR%d",req.AWADDR),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("WVALID=%d",req.WVALID),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("WREADY=%d",req.WREADY),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("WDATA=%d",req.WDATA),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("BREADY=%d",req.BREADY),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("BVALID=%d",req.BVALID),UVM_LOW);
    `uvm_info(get_full_name(),$sformatf("BRESP=%d",req.BRESP),UVM_LOW);

    //req.print();
  endtask
  
  task read_trans(axi_trans req);
  endtask
  
endclass
