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
		output reg   [31:0] aso_out0_data,          
		output reg          aso_out0_valid,        
		output reg          aso_out0_endofpacket, 
		output reg          aso_out0_startofpacket,
		input  wire         reset_reset,          
		input  wire         sampling_clk,        
        input  wire  [13:0] adc_data_Real,
        input  wire  [13:0] adc_data_Imag,
        input  wire         pre_sampling
	);
    assign aso_out0_valid=1;
    reg [15:0] tSymbolCounter;
    reg tPacketingState;
    always @(posedge sampling_clk or posedge reset_reset or negedge pre_sampling) begin
        if(reset_reset)begin
            aso_out0_data<=0;
            aso_out0_valid<=0;
            tPacketingState<=0;
            tSymbolCounter<=0;
        end
        else begin
            if(pre_sampling)begin
                tPacketingState<=0;
                tSymbolCounter<=0;
                aso_out0_valid<=1;
                aso_out0_endofpacket<=0;
                aso_out0_data[31:18]<=adc_data_Real;
                aso_out0_data[17:4]<=adc_data_Imag;
            end
            else begin
                if(aso_out0_startofpacket)
                    aso_out0_startofpacket<=0;
                if(aso_out0_endofpacket)
                    aso_out0_endofpacket<=0;
                if(!tPacketingState)begin
                    tPacketingState<=1;
                    aso_out0_startofpacket<=1;
                end

                aso_out0_valid<=1;
                aso_out0_data[31:18]<=adc_data_Real;
                aso_out0_data[17:4]<=adc_data_Imag;
                tSymbolCounter<=tSymbolCounter+1;
                if(tSymbolCounter>=1279)begin
                    aso_out0_endofpacket<=1;
                end
            end
        end
    end
endmodule
