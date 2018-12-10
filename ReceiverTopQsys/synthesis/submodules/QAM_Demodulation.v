// QAM_Demodulation.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module QAM_Demodulation (
        //Clock and Reset
		input  wire        clock_clk,      //    clock.clk
		input  wire        reset_reset,    //    reset.reset

        //Avalon Sink
		input  wire [31:0] asi_in0_data,   
		output wire        asi_in0_ready,  
		input  wire        asi_in0_valid,  
        input  wire        asi_in0_startofpacket,
        input  wire        asi_in0_endofpacket,

        //Avalon Source
		output reg  [31:0] aso_out0_data,  
		input  wire        aso_out0_ready, 
		output reg         aso_out0_valid,  
        output reg         aso_out0_startofpacket,
        output reg         aso_out0_endofpacket
	);
    wire signed [15:0]realInput;
    wire signed [15:0]imagInput;
    assign realInput=asi_in0_data[31:16];
    assign imagInput=asi_in0_data[15:0];
    reg tPacketState;
    reg [1:0]tInnerState;

    reg tRealCord;
    reg tImagineCord;
    reg [4:0] tOutBytesCounter;

    always @ (posedge clock_clk or posedge reset_reset)begin
        if(reset_reset)begin
            tOutBytesCounter<=0;
            tPacketState<=0;
            tInnerState<=0;
        end
        else begin
            case(tInnerState)
                0:begin
                    tPacketState<=0;
                    tInnerState<=0;
                    if(asi_in0_startofpacket)
                        tInnerState<=1;
                end
                1:begin
                    if(realInput>0)
                        tRealCord<=1;
                    else
                        tRealCord<=0;

                    if(imagInput>0)
                        tImagineCord<=1;
                    else
                        tImagineCord<=0;

                    if(!tPacketState)begin
                        aso_out0_startofpacket<=1;
                        tPacketState<=1;
                    end

                    if(aso_out0_startofpacket)
                        aso_out0_startofpacket<=0;

                    if(asi_in0_valid)begin
                        if(tOutBytesCounter>=15)begin
                            aso_out0_valid<=1;
                            tOutBytesCounter<=0;
                        end

                        else begin
                            aso_out0_valid<=0;
                            tOutBytesCounter<=tOutBytesCounter+1;
                        end

                        case({tRealCord,tImagineCord})begin
                            2'b11:begin
                                aso_out0_data[(16-tOutBytesCounter)*2-1-:2]<=2'b00;
                            end
                            2'b01:begin
                                aso_out0_data[(16-tOutBytesCounter)*2-1-:2]<=2'b01;
                            end
                            2'b00:begin
                                aso_out0_data[(16-tOutBytesCounter)*2-1-:2]<=2'b11;
                            end
                            2'b10:begin
                                aso_out0_data[(16-tOutBytesCounter)*2-1-:2]<=2'b10;
                            end
                        end
                    end
                    if(aso_out0_endofpacket)begin
                        tPacketState<=0;
                        tInnerState<=0;
                    end
                end
            endcase
        end
    end
endmodule
