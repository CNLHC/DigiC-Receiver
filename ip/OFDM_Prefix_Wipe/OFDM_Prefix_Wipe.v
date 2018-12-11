`timescale 1 ps / 1 ps
module OFDM_Prefix_Wipe (
        //Clock and Reset
		input  wire        clock_clk,                
		input  wire        reset_reset,              
        //Avalon Sink
		input  wire [31:0] asi_in0_data,             
		output wire        asi_in0_ready,            
		input  wire        asi_in0_valid,            
		input  wire        asi_in0_endofpacket,      
		input  wire        asi_in0_startofpacket,    
        //Avalon Source
		output reg  [28:0] aso_out0_data,            
		input  wire        aso_out0_ready,           
		output reg         aso_out0_valid,           
		output reg         aso_out0_startofpacket, 
		output reg         aso_out0_endofpacket,
        output reg  [1:0]  aso_out0_error
    );
    reg tInnerState;
    reg [15:0]tBytesCounter;
    reg tPacketState;
    assign asi_in0_ready=1;

    always @(posedge reset_reset or posedge clock_clk) begin
        if(reset_reset)begin
            //async reset 
            tInnerState<=0;
            tPacketState<=0;
        end
        else begin
            case(tInnerState)
                0:begin//IDLE
                    tPacketState<=0;
                    aso_out0_endofpacket<=0;
                    if(asi_in0_startofpacket)
                        tInnerState<=1;
                    if(asi_in0_valid)
                        tBytesCounter<=tBytesCounter+1;
                    else
                        tBytesCounter<=0;
                end
                1:begin //Packeting
                    aso_out0_valid<=0;
                    if(aso_out0_startofpacket)
                        aso_out0_startofpacket<=0;
                    if(aso_out0_endofpacket)begin
                        if(!asi_in0_endofpacket)
                            aso_out0_error<=2'b01;
                        aso_out0_endofpacket<=0;
                        aso_out0_valid<=0;
                    end
                    if(asi_in0_valid)begin
                        tBytesCounter<=tBytesCounter+1;
                        if (tBytesCounter>=255)begin
                            if(!tPacketState)begin
                                aso_out0_startofpacket<=1;
                                tPacketState<=1;
                            end
                            aso_out0_data[28:1]<=asi_in0_data[31:4];
                            aso_out0_data[0]<=0;
                            aso_out0_valid<=1;
                        end
                        if(tBytesCounter>=1278)begin
                            aso_out0_endofpacket<=1;
                        end
                    end
                end
            endcase
        end
    end
endmodule
