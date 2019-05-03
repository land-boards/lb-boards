// spi_slave_to_avalon_mm_master_bridge_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

`timescale 1 ps / 1 ps
module spi_slave_to_avalon_mm_master_bridge_0 (
		input  wire        clk,                                                                    //           clk.clk
		input  wire        reset_n,                                                                //     clk_reset.reset_n
		input  wire        mosi_to_the_spislave_inst_for_spichain,                                 //      export_0.export
		input  wire        nss_to_the_spislave_inst_for_spichain,                                  //              .export
		inout  wire        miso_to_and_from_the_spislave_inst_for_spichain,                        //              .export
		input  wire        sclk_to_the_spislave_inst_for_spichain,                                 //              .export
		output wire [31:0] address_from_the_altera_avalon_packets_to_master_inst_for_spichain,     // avalon_master.address
		output wire [3:0]  byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain,  //              .byteenable
		output wire        read_from_the_altera_avalon_packets_to_master_inst_for_spichain,        //              .read
		input  wire [31:0] readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain,      //              .readdata
		input  wire        readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain, //              .readdatavalid
		input  wire        waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain,   //              .waitrequest
		output wire        write_from_the_altera_avalon_packets_to_master_inst_for_spichain,       //              .write
		output wire [31:0] writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain    //              .writedata
	);

	SPISlaveToAvalonMasterBridge #(
		.SYNC_DEPTH (2)
	) spi_slave_to_avalon_mm_master_bridge_0 (
		.clk                                                                    (clk),                                                                    //           clk.clk
		.reset_n                                                                (reset_n),                                                                //     clk_reset.reset_n
		.mosi_to_the_spislave_inst_for_spichain                                 (mosi_to_the_spislave_inst_for_spichain),                                 //      export_0.export
		.nss_to_the_spislave_inst_for_spichain                                  (nss_to_the_spislave_inst_for_spichain),                                  //              .export
		.miso_to_and_from_the_spislave_inst_for_spichain                        (miso_to_and_from_the_spislave_inst_for_spichain),                        //              .export
		.sclk_to_the_spislave_inst_for_spichain                                 (sclk_to_the_spislave_inst_for_spichain),                                 //              .export
		.address_from_the_altera_avalon_packets_to_master_inst_for_spichain     (address_from_the_altera_avalon_packets_to_master_inst_for_spichain),     // avalon_master.address
		.byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  (byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain),  //              .byteenable
		.read_from_the_altera_avalon_packets_to_master_inst_for_spichain        (read_from_the_altera_avalon_packets_to_master_inst_for_spichain),        //              .read
		.readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      (readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain),      //              .readdata
		.readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain (readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain), //              .readdatavalid
		.waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   (waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain),   //              .waitrequest
		.write_from_the_altera_avalon_packets_to_master_inst_for_spichain       (write_from_the_altera_avalon_packets_to_master_inst_for_spichain),       //              .write
		.writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   (writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain)    //              .writedata
	);

endmodule
