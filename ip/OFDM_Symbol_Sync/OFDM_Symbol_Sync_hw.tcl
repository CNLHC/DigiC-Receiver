# TCL File Generated by Component Editor 16.1
# Sun Dec 09 13:50:35 GMT+08:00 2018
# DO NOT MODIFY


# 
# OFDM_Symbol_Sync "OFDM Symbol Synchronizer" v1.0
# CNLHC 2018.12.09.13:50:35
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module OFDM_Symbol_Sync
# 
set_module_property DESCRIPTION ""
set_module_property NAME OFDM_Symbol_Sync
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP DigiC/OFDM
set_module_property AUTHOR CNLHC
set_module_property DISPLAY_NAME "OFDM Symbol Synchronizer"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL OFDM_Symbol_Sync
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE true
add_fileset_file OFDM_Symbol_Sync.v VERILOG PATH OFDM_Symbol_Sync.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset_source
# 
add_interface reset_source reset start
set_interface_property reset_source associatedClock clock
set_interface_property reset_source associatedDirectReset ""
set_interface_property reset_source associatedResetSinks ""
set_interface_property reset_source synchronousEdges DEASSERT
set_interface_property reset_source ENABLED true
set_interface_property reset_source EXPORT_OF ""
set_interface_property reset_source PORT_NAME_MAP ""
set_interface_property reset_source CMSIS_SVD_VARIABLES ""
set_interface_property reset_source SVD_ADDRESS_GROUP ""

add_interface_port reset_source reset_source_reset_req reset Output 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clock_clk clk Input 1


# 
# connection point aso_out0
# 
add_interface aso_out0 avalon_streaming start
set_interface_property aso_out0 associatedClock clock
set_interface_property aso_out0 associatedReset reset_source
set_interface_property aso_out0 dataBitsPerSymbol 8
set_interface_property aso_out0 errorDescriptor ""
set_interface_property aso_out0 firstSymbolInHighOrderBits true
set_interface_property aso_out0 maxChannel 0
set_interface_property aso_out0 readyLatency 0
set_interface_property aso_out0 ENABLED true
set_interface_property aso_out0 EXPORT_OF ""
set_interface_property aso_out0 PORT_NAME_MAP ""
set_interface_property aso_out0 CMSIS_SVD_VARIABLES ""
set_interface_property aso_out0 SVD_ADDRESS_GROUP ""

add_interface_port aso_out0 aso_out0_data data Output 32
add_interface_port aso_out0 aso_out0_ready ready Input 1
add_interface_port aso_out0 aso_out0_valid valid Output 1
add_interface_port aso_out0 aso_out0_endofpacket endofpacket Output 1
add_interface_port aso_out0 aso_out0_startofpacket startofpacket Output 1


# 
# connection point asi_in_0
# 
add_interface asi_in_0 avalon_streaming end
set_interface_property asi_in_0 associatedClock clock
set_interface_property asi_in_0 associatedReset reset_source
set_interface_property asi_in_0 dataBitsPerSymbol 8
set_interface_property asi_in_0 errorDescriptor ""
set_interface_property asi_in_0 firstSymbolInHighOrderBits true
set_interface_property asi_in_0 maxChannel 0
set_interface_property asi_in_0 readyLatency 0
set_interface_property asi_in_0 ENABLED true
set_interface_property asi_in_0 EXPORT_OF ""
set_interface_property asi_in_0 PORT_NAME_MAP ""
set_interface_property asi_in_0 CMSIS_SVD_VARIABLES ""
set_interface_property asi_in_0 SVD_ADDRESS_GROUP ""

add_interface_port asi_in_0 asi_in0_data data Input 32
add_interface_port asi_in_0 asi_in0_ready ready Output 1
add_interface_port asi_in_0 asi_in0_valid valid Input 1
add_interface_port asi_in_0 asi_in_0_endofpacket endofpacket Input 1
add_interface_port asi_in_0 asi_in_0_startofpacket startofpacket Input 1
add_interface_port asi_in_0 asi_in_0_empty empty Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

