// OFDM_Symbol_Sync.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module OFDM_Symbol_Sync (
		input  wire        clock_clk,      //        clock.clk
		output wire        reset_reset,    // reset_source.reset

		input  wire [31:0] asi_in0_data,   //      asi_in0.data
		output wire        asi_in0_ready,  //             .ready
		input  wire        asi_in0_valid,  //             .valid
        input wire         asi_in0_startofpacket,
        input wire         asi_in0_endofpacket,
        input wire         asi_in0_empty,

		output wire [31:0] aso_out0_data,  //     aso_out0.data
		input  wire        aso_out0_ready, //             .ready
		output wire        aso_out0_valid  //             .valid
	);

	// TODO: Auto-generated HDL template

	assign reset_reset = 1'b0;

	assign asi_in0_ready = 1'b0;

	assign aso_out0_valid = 1'b0;

	assign aso_out0_data = 32'b00000000000000000000000000000000;

endmodule
