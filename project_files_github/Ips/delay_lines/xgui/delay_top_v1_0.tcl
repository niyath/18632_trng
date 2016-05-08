# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "COARSE_DELAY_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FINE_DELAY_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FINE_DELAY_ON" -parent ${Page_0}


}

proc update_PARAM_VALUE.COARSE_DELAY_LENGTH { PARAM_VALUE.COARSE_DELAY_LENGTH } {
	# Procedure called to update COARSE_DELAY_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COARSE_DELAY_LENGTH { PARAM_VALUE.COARSE_DELAY_LENGTH } {
	# Procedure called to validate COARSE_DELAY_LENGTH
	return true
}

proc update_PARAM_VALUE.FINE_DELAY_LENGTH { PARAM_VALUE.FINE_DELAY_LENGTH } {
	# Procedure called to update FINE_DELAY_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FINE_DELAY_LENGTH { PARAM_VALUE.FINE_DELAY_LENGTH } {
	# Procedure called to validate FINE_DELAY_LENGTH
	return true
}

proc update_PARAM_VALUE.FINE_DELAY_ON { PARAM_VALUE.FINE_DELAY_ON } {
	# Procedure called to update FINE_DELAY_ON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FINE_DELAY_ON { PARAM_VALUE.FINE_DELAY_ON } {
	# Procedure called to validate FINE_DELAY_ON
	return true
}


proc update_MODELPARAM_VALUE.COARSE_DELAY_LENGTH { MODELPARAM_VALUE.COARSE_DELAY_LENGTH PARAM_VALUE.COARSE_DELAY_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COARSE_DELAY_LENGTH}] ${MODELPARAM_VALUE.COARSE_DELAY_LENGTH}
}

proc update_MODELPARAM_VALUE.FINE_DELAY_LENGTH { MODELPARAM_VALUE.FINE_DELAY_LENGTH PARAM_VALUE.FINE_DELAY_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FINE_DELAY_LENGTH}] ${MODELPARAM_VALUE.FINE_DELAY_LENGTH}
}

proc update_MODELPARAM_VALUE.FINE_DELAY_ON { MODELPARAM_VALUE.FINE_DELAY_ON PARAM_VALUE.FINE_DELAY_ON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FINE_DELAY_ON}] ${MODELPARAM_VALUE.FINE_DELAY_ON}
}

