//=======================================================
//  	QMTECH SDRAM Test Program
//=======================================================

module CYCLONE_IV_SDRAM_RTL_Test(
      ///////// Input CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output    [12:0]	DRAM_ADDR,
      output    [1:0] 	DRAM_BA,
      output            DRAM_CAS_N,
      output          	DRAM_CKE,
      output            DRAM_CLK,
      output        		DRAM_CS_N,
      inout     [15:0]	DRAM_DQ,
      output            DRAM_LDQM,
      output            DRAM_RAS_N,
      output            DRAM_UDQM,
      output            DRAM_WE_N,

      ///////// Start Test KEY /////////
      input       		KEY,

      ///////// LEDR /////////
      output      		LEDR,

      ///////// RESET /////////
      input            	RESET_N
);


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire  [15:0]  writedata;
wire  [15:0]  readdata;
wire          write;
wire          read;
wire          clk_test;

//	SDRAM frame buffer
Sdram_Control	u1	(	//	HOST Side
						   .REF_CLK(CLOCK_50),
					      .RESET_N(RESET_N),
							//	FIFO Write Side 
						   .WR_DATA(writedata),
							.WR(write),
							.WR_ADDR(0),
							.WR_MAX_ADDR(24'h1ffffff),
							.WR_LENGTH(9'h80),
							.WR_LOAD(!RESET_N ),
							.WR_CLK(clk_test),
							//	FIFO Read Side 
						   .RD_DATA(readdata),
				        	.RD(read),
				        	.RD_ADDR(0),			//	Read odd field and bypess blanking
							.RD_MAX_ADDR(24'h1ffffff),
							.RD_LENGTH(9'h80),
				        	.RD_LOAD(!RESET_N ),
							.RD_CLK(clk_test),
                     //	SDRAM Side
						   .SA(DRAM_ADDR),
						   .BA(DRAM_BA),
						   .CS_N(DRAM_CS_N),
						   .CKE(DRAM_CKE),
						   .RAS_N(DRAM_RAS_N),
				         .CAS_N(DRAM_CAS_N),
				         .WE_N(DRAM_WE_N),
						   .DQ(DRAM_DQ),
				         .DQM({DRAM_UDQM,DRAM_LDQM}),
							.SDR_CLK(DRAM_CLK)	);

wire  test_start_n;

wire  sdram_test_pass;
wire  sdram_test_fail;
wire  sdram_test_complete;

PLL01 u0(
	.areset(1'b0),
	.inclk0(CLOCK_50),
	.c0(clk_test),
	.locked()
);

RW_Test u2(
      .iCLK(clk_test),
		.iRST_n(RESET_N),
		.iBUTTON(test_start_n),
      .write(write),
		.writedata(writedata),
	   .read(read),
		.readdata(readdata),
      .drv_status_pass(sdram_test_pass),
		.drv_status_fail(sdram_test_fail),
		.drv_status_test_complete(sdram_test_complete)
);

assign test_start_n = KEY;

assign LEDR = !(sdram_test_complete & sdram_test_pass);

endmodule
