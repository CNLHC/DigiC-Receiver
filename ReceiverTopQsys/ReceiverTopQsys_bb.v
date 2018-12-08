
module ReceiverTopQsys (
	OFDM_Channel_Equalization_0_asi_in0_data,
	OFDM_Channel_Equalization_0_asi_in0_ready,
	OFDM_Channel_Equalization_0_asi_in0_valid,
	OFDM_Channel_Equalization_0_reset_reset,
	clk_clk,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	ofdm_channel_equalization_0_aso_out0_data,
	ofdm_channel_equalization_0_aso_out0_ready,
	ofdm_channel_equalization_0_aso_out0_valid,
	reset_reset_n);	

	output	[31:0]	OFDM_Channel_Equalization_0_asi_in0_data;
	input		OFDM_Channel_Equalization_0_asi_in0_ready;
	output		OFDM_Channel_Equalization_0_asi_in0_valid;
	output		OFDM_Channel_Equalization_0_reset_reset;
	input		clk_clk;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[7:0]	memory_mem_dq;
	inout		memory_mem_dqs;
	inout		memory_mem_dqs_n;
	output		memory_mem_odt;
	output		memory_mem_dm;
	input		memory_oct_rzqin;
	input	[31:0]	ofdm_channel_equalization_0_aso_out0_data;
	output		ofdm_channel_equalization_0_aso_out0_ready;
	input		ofdm_channel_equalization_0_aso_out0_valid;
	input		reset_reset_n;
endmodule
