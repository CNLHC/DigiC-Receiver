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
		input  wire        clock_clk,               //  clock_1.clk
        input wire  [13:0] buffered_data,
        input wire         pre_sampling
	);
    assign aso_out0_valid<=1;
    assign [15:0] tSymbolCounter;
    assign [2:0]tInnterState;
    assign tPacketingState;
    always @(posedge clock_clk or posedge reset_reset) begin
        if(reset_reset)begin
            aso_out0_data<=0;
            aso_out0_valid<=0;
            tInnterState<=0;
            tPacketingState<=0;
        end
        else begin
            case(tInnterState)
                0:begin
                    aso_out0_valid<=0;
                    tSymbolCounter<=0;
                    tPacketingState<=0;
                    tInnterState<=1;
                end
                1:begin
                    if(!tPacketingState)begin
                        tPacketingState<=1;
                        aso_out0_startofpacket<=1;
                    end

                    if(aso_out0_startofpacket)
                        aso_out0_startofpacket<=0;

                    aso_out0_valid<=1;
                    aso_out0_data<=buffered_data;
                    tSymbolCounter<=tSymbolCounter+1;
                    if(pre_sampling) begin
                        if(tSymbolCounter>=100)begin
                            tPacketingState<=0;
                            tInnterState<=2;
                            aso_out0_valid<=0
                            aso_out0_endofpacket<=1;
                        end
                    end
                    else begin
                        if(tSymbolCounter>=1124)begin
                            tPacketingState<=0;
                            tInnterState<=2;
                            aso_out0_valid<=0
                            aso_out0_endofpacket<=1;
                        end
                    end
                end
                2: begin
                    if(aso_out0_endofpacket==1) 
                        aso_out0_endofpacket<=0;
                    tInnterState<=0;
                end
            endcase
        end
    end
endmodule
