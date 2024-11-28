puts {Running create_all_sgmii_ports}

variable iproot [file normalize [file dirname [info script]]]
variable ipcores $iproot/ipcores
variable sgmii_gtx_refclk_mhz 156.25



variable sgmii_gtx_loc X0Y0
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y1
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y2
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y3
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y4
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y5
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y6
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y7
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y8
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y9
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y10
source $ipcores/create_port_sgmii_gtx.tcl
variable sgmii_gtx_loc X0Y11
source $ipcores/create_port_sgmii_gtx.tcl

