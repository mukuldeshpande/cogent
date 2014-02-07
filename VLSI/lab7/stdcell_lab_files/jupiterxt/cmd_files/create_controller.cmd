;# Scheme
configureWindow 0 "25x24+0+0"
menuReload "JupiterXT"
fphFlowManager
fphFMLibrary "AddRefLib" "stdh_mudd"
fphFMLibrary "SetMode" "CREATE"
fphFMLibrary "SetLibraryName" "lib_controller"
fphFMLibrary "SetVerilogFile" "controller.v"
fphFMLibrary "SetUniquifyAll" "1"
fphFMLibrary "SetUniquifyBB" "0"
fphFMLibrary "SetFlatMode" "0"
fphFMLibrary "SetBusNameStyle" "[%d]"
fphFMLibrary "SetB0NetName" "VSS"
fphFMLibrary "SetB1NetName" "VDD"
fphFMLibrary "SetHierSep" "/"
fphFMLibrary "SetBusNameAppend" ""
fphFMLibrary "SetMultPGNets" "0"
fphFMLibrary "SetNoBackslash" "0"
fphFMLibrary "SetRemoveFirstBackslash" "0"
fphFMLibrary "SetCreateBusForUndefined" "FromConnection"
fphFMLibrary "SetHonorFrameView" "0"
fphFMLibrary "SetCaseSensitive" "1"
fphFMLibrary "SetIsVerilogListFile" "0"
fphFMLibrary "SetHandleDirtyNetlist" "0"
fphFMLibrary "CreateApply"

fphFMExec "ShowTab" "hierarchy"
fphFMHierarchy "StartBlock" 
fphFMHierarchy "EndBlock" 

fphFMExec "ShowTab" "constraints"
fphFMConstraints "SetPGCellMastPat" ".*"
fphFMConstraints "SetPGCellInstPat" ".*"
fphFMConstraints "PGConnect" "VDD" "vdd" "VSS" "gnd"
fphFMConstraints "SetPadConstraintsAppend" "No"
fphFMConstraints "PadConstraintsLoad" "controller.tdf"

fphFMExec "ShowTab" "core"
fphFMCore "SetCoreTo" 20.100000 20.100000 20.100000 20.100000
fphFMCore "SetCoreSizingType" "Aspect Ratio/Utilization"
fphFMCore "SetCoreAspectResizeType" "Fixed Aspect Ratio"
fphFMCore "SetCoreAspectRatio" 0.969231
fphFMCore "SetHardUtilization" 0.7
fphFMCore "SetCreateRows" "Yes"
fphFMCore "SetRows" "Horizontal" "Yes" "Yes" "Yes"
fphFMCore "SetRowsCoreRatio" 1
fphFMCore "SetPlacePads" "Yes"
fphFMCore "SetCellBoundary" 5 0 0 196.200000 0 196.200000 191.400000 0 191.400000 0 0
fphFMCore "Apply" 

fphFMExec "ShowTab" "floorplan"
fphFMFloorplan "Apply" 
fphFMExec "ExitLibraryOpen"
configureWindow 3 "826x704+250+100"
configureWindow 3 "826x704+612+108"
configureWindow 0 "23x23+-9+23"
axgCreateRectangularRings
setFormField "Create Rectangular Rings" "L-Width" "6.0000"
setFormField "Create Rectangular Rings" "R-Width" "6.0000"
setFormField "Create Rectangular Rings" "B-Width" "6.0000"
setFormField "Create Rectangular Rings" "T-Width" "6.0000"
setFormField "Create Rectangular Rings" "B-Layer" "30"
setFormField "Create Rectangular Rings" "T-Layer" "30"
setFormField "Create Rectangular Rings" "Net Name(s)" "VDD"
formApply "Create Rectangular Rings"
setFormField "Create Rectangular Rings" "Net Name(s)" "VSS"
formApply "Create Rectangular Rings"
formCancel "Create Rectangular Rings"
astPlaceOptions
formOK "AstroPlace Options"
astPlaceDesign
formOK "AstroPlace - Design"
aprPGConnect
setFormField "Connect/Disconnect PG" "Net Name" "VDD"
setFormField "Connect/Disconnect PG" "Port Pattern" "vdd"
formApply "Connect/Disconnect PG"
setFormField "Connect/Disconnect PG" "Net Name" "VSS"
setFormField "Connect/Disconnect PG" "Port Pattern" "gnd"
setFormField "Connect/Disconnect PG" "Net Type" "Ground"
formApply "Connect/Disconnect PG"
formCancel "Connect/Disconnect PG"
axgPrerouteStandardCells
formOK "Preroute Standard Cells"
configureWindow 3 "826x704+557+140"
menuReload "JupiterXT_Astro"
axgSetRouteOptions
setFormField "Route Common Options" "Same Net Notch" "ignore"
setFormField "Route Common Options" "Same Net Notch" "check and fix"
formOK "Route Common Options"
axgDetailRoute
formOK "Detail Route"
axgAddFillerCell
setFormField "Add Filler Cell" "Master Cell Name(s)" "stdh_wellfill"
formOK "Add Filler Cell"
configureWindow 3 "826x704+202+139"
configureWindow 3 "826x704+589+190"
configureWindow 3 "826x704+257+159"
configureWindow 0 "24x23+44+24"
menuReload "JupiterXT_dataPrep"
write_def
formCancel "write def"
(dbSaveCell (geGetEditCell))
write_def
setFormField "write def" "Library Name" "lib_controller"
setFormField "write def" "Cell Name" "controller"
setFormField "write def" "Output File" "controller.def"
formButton "write def" "Output_Options"
formButton "write def" "Via_Options"
setFormField "write def" "Output All Design Used Vias" "1"
formOK "write def"
menuQuit
formYes "Dialog Box"
formButton "Save Cells" "saveAll"
formOK "Save Cells"

