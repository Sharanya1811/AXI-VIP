interface axi_interface();
 
  
 logic        ACLK;
 logic        ARESETn;
  
  
  logic [31:0] AWADDR;
 logic        AWVALID;
  logic        AWREADY;
 /*input logic [3:0]  AWID;
 input logic [3:0]  AWLEN;
 input logic [2:0]  ASIZE;
  input logic [1:0]  ABURST;*/
   logic  [3:0] AWCACHE;
 logic  [2:0]  AWPROT;

 logic [31:0] WDATA;
 logic        WVALID;
 logic        WREADY;

   logic [31:0] ARADDR;
  logic        ARVALID;
 logic        ARREADY;
  logic [3:0] ARCACHE;
  logic [2:0]  ARPROT;

  logic [31:0] RDATA;
  logic        RVALID;
  logic        RREADY;

  logic [1:0]  BRESP;
  logic        BVALID;
  logic        BREADY;
  
endinterface
