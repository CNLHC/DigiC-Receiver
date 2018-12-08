// OFDM_ADC_Control.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module OFDM_ADC_Control (
		output wire [31:0] aso_out0_data,          // aso_out0.data
		output wire        aso_out0_valid,         //         .valid
		output wire        aso_out0_endofpacket,   //         .endofpacket
		output wire        aso_out0_startofpacket, //         .startofpacket
		input  wire        reset_reset,            //    reset.reset
		input  wire        clock_clk               //  clock_1.clk
	);

	// TODO: Auto-generated HDL template

	assign aso_out0_valid = 1'b0;

	assign aso_out0_data = 32'b00000000000000000000000000000000;

	assign aso_out0_startofpacket = 1'b0;

	assign aso_out0_endofpacket = 1'b0;

endmodule
