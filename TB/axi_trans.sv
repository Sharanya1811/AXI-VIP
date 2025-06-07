class axi_trans extends uvm_sequence_item;
  `uvm_object_utils(axi_trans)
  
  rand logic [31:0] AWADDR;
  rand logic        AWVALID;
  logic        AWREADY;
  rand logic [3:0]  AWID;
  rand logic [3:0]  AWLEN;
  rand logic [2:0]  ASIZE;
  rand logic [1:0]  ABURST;
  rand logic  [3:0] AWCACHE;
  rand logic  [2:0]  AWPROT;

  
  rand logic [31:0] WDATA;
  rand logic        WVALID;
  logic        WREADY;

  rand logic [31:0] ARADDR;
  rand logic        ARVALID;
  logic        ARREADY;
  rand logic  [3:0] ARCACHE;
  rand logic  [2:0]  ARPROT;

  logic [31:0] RDATA;
  logic        RVALID;
  rand logic        RREADY;

  logic [1:0]  BRESP;
  logic        BVALID;
  rand logic        BREADY;
  
 rand logic        WR; //WR=1 for write transaction WR=0 read transaction
  //4 byte alignment and with 4kb specific address boundary
  constraint aligned_addr{AWADDR%4==0; AWADDR inside {[32'h0000_0000:32'h000F_FFFF]};}
  
  /*
  `uvm_object_utils_begin(axi_trans)
  `uvm_field_int  (AWVALID,UVM_DEFAULT)
  `uvm_field_int  (AWREADY,UVM_DEFAULT)
  `uvm_field_int  (AWADDR,UVM_DEFAULT)
  `uvm_field_int  (WVALID,UVM_DEFAULT)
  `uvm_field_int  (WREADY,UVM_DEFAULT)
  `uvm_field_int  (WDATA,UVM_DEFAULT)
  `uvm_field_int  (BVALID,UVM_DEFAULT)
  `uvm_field_int  (BREADY,UVM_DEFAULT)
  `uvm_field_int  (BRESP,UVM_DEFAULT)
  `uvm_field_int  (ARVALID,UVM_DEFAULT)
  `uvm_field_int  (ARREADY,UVM_DEFAULT)
  `uvm_field_int  (ARADDR,UVM_DEFAULT)
  `uvm_field_int  (RDATA,UVM_DEFAULT)
  `uvm_field_int  (RVALID,UVM_DEFAULT)
  `uvm_field_int  (RREADY,UVM_DEFAULT)
  `uvm_field_int  (addr,UVM_DEFAULT)
  `uvm_field_int  (addr,UVM_DEFAULT)
  `uvm_field_int(WR,UVM_DEFAULT)
   `uvm_object_utils_end
  */
  function new(string name="axi_trans");
    super.new(name);
  endfunction
  
endclass

