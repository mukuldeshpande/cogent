;# Scheme
configureWindow 0 "25x24+0+0"
menuReload "JupiterXT_dataPrep"
configureWindow 0 "25x24+0+0"
configureWindow 0 "24x23+0+0"
cmCreateLib
setFormField "Create Library" "Library Name" "stdh_mudd"
setFormField "Create Library" "Technology File Name" "mocmos.tf"
setFormField "Create Library" "Set Case Sensitive" "1"
formOK "Create Library"
read_lef
setFormField "Read LEF" "Library Name" "stdh_mudd"
setFormField "Read LEF" "Cell LEF Files" "stdh_mudd.lef"
setFormField "Read LEF" "Layer Mapping" "layer_map.txt"
setFormField "Read LEF" "Cell Options" "Overwrite Existing Cell"
formOK "Read LEF"
menuReload "JupiterXT"
menuQuit
formYes "Dialog Box"
