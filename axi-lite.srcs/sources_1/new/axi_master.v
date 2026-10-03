`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 07:25:56 PM
// Design Name: 
// Module Name: axi_master
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Source: https://docs.amd.com/api/khub/documents/F883UPFLTb2oRNq5dzMW9w/content
//////////////////////////////////////////////////////////////////////////////////

// AXI naming conventions
// AR = Read Addr Channel, R = Read Data Channel, B = Write Response Channel, AW = Write Addr Channel, W = Write Data Channel
// Notes for learning:
// response channel indicates whether or not slave has received data from the master

module axi_master #(
    parameter C_M_AXI_LITE_ADDR_WIDTH = 32,
    parameter C_M_AXI_LITE_DATA_WIDTH = 32
)(
    // System signals
    input m_axi_lite_aclk,
    input m_axi_lite_aresetn,
    
    // Error signal
    output md_error,
    
    // AXI-lite Master Read Addr Channel
    output [C_M_AXI_LITE_ADDR_WIDTH-1:0] m_axi_lite_araddr,
    output [2:0] m_axi_lite_arprot,                          // channel protection; always driven as output w 3'b0
    output m_axi_lite_arvalid,              // indicates whether read addr out from master is valid (1 = valid)
    input m_axi_lite_arready,               // indicates whether or not target is ready to accept the read addr (1 = ready) 
    
    // AXI-lite Master Read Data Channel
    output [C_M_AXI_LITE_DATA_WIDTH-1:0] m_axi_lite_ardata,
    output [1:0] m_axi_lite_rresp,                          // indicates results for read transfer; 00b = OKAY, 01b = EXOKAY, 10b = SLVERR, 11b = DECERR (see source for more details)
    output m_axi_lite_rrvalid,              // indicates whether read addr out from master is valid
    input m_axi_lite_rready,                // indicates whether or not target is ready to accept the read addr
    
    // AXI-lite Master Write Address Channel
    output [C_M_AXI_LITE_ADDR_WIDTH-1:0] m_axi_lite_awaddr,
    output [2:0] m_axi_lite_awprot,                         //channel protection; always driven as output w 3'b0
    output m_axi_lite_awvalid,              // indicates whether write addr out from master is valid
    input m_axi_lite_awready,               // indicates whether or not target is ready to accept the read addr
    
    // AXI-lite Master Write Data Channel
    output [C_M_AXI_LITE_DATA_WIDTH-1:0] m_axi_lite_wdata,
    output [C_M_AXI_LITE_DATA_WIDTH/8-1:0] m_ax_lite_wstrb, // write channel strobe bus (?)
    output m_axi_lite_wvalid,               // indicates whether write data out from master is valid 
    input m_axi_lite_wready,                // indicates whether or not target is ready to accept the write data 
    
    // AXI-lite Master Write Response Channel
    input [1:0] m_axi_lite_bresp,                           // indicates results for write transfer; 00b = OKAY, 01b = EXOKAY, 10b = SLVERR, 11b = DECERR (see source for more details)
    input m_axi_lite_bvalid,                // indicates whether or not response (bresp_ is valid
    output m_axi_lite_bready                // indicates whether or not target is ready to receive response
);
    assign m_axi_lite_ar_prot = 3'b0;
    assign m_axi_lite_aw_prot = 3'b0;
    
    
    always @(posedge m_axi_lite_aclk) begin
        
    
endmodule
