// OFDM_Symbol_Sync.v


`define SYMBOL_DECISION_THRESHOLD 14'h1fff
`timescale 1 ps / 1 ps
module OFDM_Symbol_Sync (
        //Clock and Reset 
		output wire        sample_clock_reset, //   reset_source.reset
		input  wire        clock_clk,             //          clock.clk
        input  wire        reset_reset,

        //Avalon Sink
		input  wire [31:0] asi_in0_data,           //       asi_in_0.data
		input  wire        asi_in0_valid,          //               .valid
		input  wire        asi_in0_endofpacket,    //               .endofpacket
		input  wire        asi_in0_startofpacket,  //               .startofpacket

        //Avalon Source
		output wire [31:0] aso_out0_data,          //       aso_out0.data
		output reg         aso_out0_valid,         //               .valid
		output reg         aso_out0_endofpacket,   //               .endofpacket
		output reg         aso_out0_startofpacket, //               .startofpacket

        //Feedback Control Signal
		output  reg        pre_sampling            // sample_control.pre_sample_control
	);
    wire signed [13:0]tRealData;
    wire signed [13:0]tImagData;
    assign tRealData=asi_in0_data[31:18];
    assign tImagData=asi_in0_data[17:4];
    always @ (posedge clock_clk or posedge reset_reset)begin
        if(reset_reset)begin
            pre_sampling<=1;
            sample_clock_reset<=1;
        end
        else begin
            if(!sample_clock_reset)
                sample_clock_reset<=1;
            if(pre_sampling)begin
                if(asi_in0_valid)begin
                    if(tRealData>`SYMBOL_DECISION_THRESHOLD && tImagData<`SYMBOL_DECISION_THRESHOLD)begin
                        pre_sampling<=0;
                        sample_clock_reset<=0;
                    end
                end
            end
            else begin
                if(asi_in0_startofpacket)
                    aso_out0_startofpacket<=1; 
                if(asi_in0_endofpacket)begin
                    aso_out0_endofpacket<=1;
                    pre_sampling<=1;
                end
                if(aso_out0_endofpacket)
                    aso_out0_endofpacket<=0;
                if(aso_out0_startofpacket)
                    aso_out0_startofpacket<=0;
                aso_out0_data<=asi_in0_data;
                aso_out0_valid<=asi_in0_valid;
            end
        end
    end
endmodule
