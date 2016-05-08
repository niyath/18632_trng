# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AVG_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DL_CODE_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DL_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PD_COUNT_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PD_SR_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.AVG_WIDTH { PARAM_VALUE.AVG_WIDTH } {
	# Procedure called to update AVG_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AVG_WIDTH { PARAM_VALUE.AVG_WIDTH } {
	# Procedure called to validate AVG_WIDTH
	return true
}

proc update_PARAM_VALUE.DL_CODE_WIDTH { PARAM_VALUE.DL_CODE_WIDTH } {
	# Procedure called to update DL_CODE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DL_CODE_WIDTH { PARAM_VALUE.DL_CODE_WIDTH } {
	# Procedure called to validate DL_CODE_WIDTH
	return true
}

proc update_PARAM_VALUE.DL_LENGTH { PARAM_VALUE.DL_LENGTH } {
	# Procedure called to update DL_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DL_LENGTH { PARAM_VALUE.DL_LENGTH } {
	# Procedure called to validate DL_LENGTH
	return true
}

proc update_PARAM_VALUE.PD_COUNT_W { PARAM_VALUE.PD_COUNT_W } {
	# Procedure called to update PD_COUNT_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PD_COUNT_W { PARAM_VALUE.PD_COUNT_W } {
	# Procedure called to validate PD_COUNT_W
	return true
}

proc update_PARAM_VALUE.PD_SR_WIDTH { PARAM_VALUE.PD_SR_WIDTH } {
	# Procedure called to update PD_SR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PD_SR_WIDTH { PARAM_VALUE.PD_SR_WIDTH } {
	# Procedure called to validate PD_SR_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.DL_LENGTH { MODELPARAM_VALUE.DL_LENGTH PARAM_VALUE.DL_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DL_LENGTH}] ${MODELPARAM_VALUE.DL_LENGTH}
}

proc update_MODELPARAM_VALUE.DL_CODE_WIDTH { MODELPARAM_VALUE.DL_CODE_WIDTH PARAM_VALUE.DL_CODE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DL_CODE_WIDTH}] ${MODELPARAM_VALUE.DL_CODE_WIDTH}
}

proc update_MODELPARAM_VALUE.PD_SR_WIDTH { MODELPARAM_VALUE.PD_SR_WIDTH PARAM_VALUE.PD_SR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PD_SR_WIDTH}] ${MODELPARAM_VALUE.PD_SR_WIDTH}
}

proc update_MODELPARAM_VALUE.PD_COUNT_W { MODELPARAM_VALUE.PD_COUNT_W PARAM_VALUE.PD_COUNT_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PD_COUNT_W}] ${MODELPARAM_VALUE.PD_COUNT_W}
}

proc update_MODELPARAM_VALUE.AVG_WIDTH { MODELPARAM_VALUE.AVG_WIDTH PARAM_VALUE.AVG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AVG_WIDTH}] ${MODELPARAM_VALUE.AVG_WIDTH}
}

