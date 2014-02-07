
/*
* Grid is lambda based, if half-lambda is used then
* Electric gets confused.
*/
Technology	 { 
		 name                       = "c8q-3rl" 
		 date                       = "May 19 2006" 
		 unitTimeName               = "ns" 
		 timePrecision              = 1000 
		 unitLengthName             = "micron" 
		 lengthPrecision            = 100
		 gridResolution             = 30
		 unitVoltageName            = "v" 
		 voltagePrecision           = 1000000 
		 unitCurrentName            = "mA" 
		 currentPrecision           = 1000 
		 unitPowerName              = "pw" 
		 powerPrecision             = 1000 
		 unitResistanceName         = "ohm" 
		 resistancePrecision        = 10000000 
		 unitCapacitanceName        = "pf" 
		 capacitancePrecision       = 10000000 
		 unitInductanceName         = "nh" 
		 inductancePrecision        = 100 
}

/*******************************************************/
/******************** Layers Section ********************/
/*******************************************************/


Layer 	 "METAL1" { 
                 layerNumber                     = 10
                 maskName                        = "metal1" 
                 isDefaultLayer                  = 1 
                 visible                         = 1 
                 selectable                      = 1 
                 blink                           = 0
		 color                           = "blue"
		 lineStyle                       = "solid"
		 pattern                         = "slash"
		 pitch                           = 2.70000 
		 defaultWidth                    = 1.20000 
		 minWidth                        = 1.20000 
		 minSpacing                      = 0.90000 
		 minArea			 = 0.36000
		 sameNetMinSpacing               = 0.90000 
		 maxCurrDensity                  = 90.000000 
		 unitMinThickness                = 0.360000 
		 unitNomThickness                = 0.360000 
		 unitMaxThickness                = 0.360000 
		 unitMinResistance               = 0.110000 
		 unitNomResistance               = 0.130000 
		 unitMaxResistance               = 0.150000 
		 fatContactThreshold             = 2.7
}


Layer 	 "VIA1" { 
                 layerNumber                     = 11
                 maskName                        = "via1" 
                 isDefaultLayer                  = 1 
                 visible                         = 1 
                 selectable                      = 1 
                 blink                           = 0
		 color                           = "cyan"
		 lineStyle                       = "solid"
		 pattern                         = "rectangleX"
		 pitch                           = 0 
		 defaultWidth                    = 0.60000 
		 minWidth                        = 0.60000 
		 minSpacing                      = 0.90000 
		 maxCurrDensity                  = 1350000.000000 
		 unitMinResistance               = 1.000000 
		 unitNomResistance               = 3.000000 
		 unitMaxResistance               = 5.000000 

}

Layer 	 "METAL2" { 
                 layerNumber                     = 20 
                 maskName                        = "metal2" 
                 isDefaultLayer                  = 1 
                 visible                         = 1 
                 selectable                      = 1 
                 blink                           = 0
		 color                           = "magenta"
		 lineStyle                       = "solid"
		 pattern                         = "backSlash"
		 pitch                           = 2.40000 
		 defaultWidth                    = 1.20000 
		 minWidth                        = 1.20000 
		 minSpacing                      = 1.20000 
		 minArea			 = 0.36000
		 sameNetMinSpacing               = 1.20000 
		 maxCurrDensity                  = 90.000000 
		 unitMinThickness                = 0.470000 
		 unitNomThickness                = 0.470000 
		 unitMaxThickness                = 0.470000 
		 unitMinResistance               = 0.080000 
		 unitNomResistance               = 0.100000 
		 unitMaxResistance               = 0.120000 
		 fatContactThreshold             = 2.7
}


Layer 	 "VIA2" { 
                 layerNumber                     = 21 
                 maskName                        = "via2" 
                 isDefaultLayer                  = 1 
                 visible                         = 1 
                 selectable                      = 1 
                 blink                           = 0
		 color                           = "brown"
		 lineStyle                       = "solid"
		 pattern                         = "rectangleX"
		 pitch                           = 0 
		 defaultWidth                    = 0.60000 
		 minWidth                        = 0.60000 
		 minSpacing                      = 0.90000 
		 maxCurrDensity                  = 1350000.000000 
		 unitMinResistance               = 1.000000 
		 unitNomResistance               = 3.000000 
		 unitMaxResistance               = 5.000000 

}

Layer    "METAL3" {
                 layerNumber                     = 30
                 maskName                        = "metal3"
                 isDefaultLayer                  = 1
                 visible                         = 1
                 selectable                      = 1
                 blink                           = 0
                 color                           = "cyan"
                 lineStyle                       = "solid"
                 pattern                         = "wave"
                 pitch                           = 2.700000
                 defaultWidth                    = 1.80000
                 minWidth                        = 1.80000
                 minSpacing                      = 0.90000
                 sameNetMinSpacing               = 0.90000
		 minArea			 = 0.36000
                 maxCurrDensity                  = 90.000000
                 unitMinThickness                = 0.470000
                 unitNomThickness                = 0.470000
                 unitMaxThickness                = 0.470000
                 unitMinResistance               = 0.080000
                 unitNomResistance               = 0.100000
                 unitMaxResistance               = 0.120000
		 fatContactThreshold             = 3.3
}


ContactCode "VIA12" { 
		 contactCodeNumber               = 4
		 cutLayer                        = "VIA1"
		 lowerLayer                      = "METAL1"
		 upperLayer                      = "METAL2"
		 isDefaultContact                = 1
		 cutWidth                        = 0.60000
		 cutHeight                       = 0.60000
		 upperLayerEncWidth              = 0.30000
		 upperLayerEncHeight             = 0.30000
		 lowerLayerEncWidth              = 0.30000
		 lowerLayerEncHeight             = 0.30000
		 minCutSpacing                   = 1.50000
		 unitMinResistance               = 1.000000
		 unitNomResistance               = 3.000000
		 unitMaxResistance               = 5.000000
}

ContactCode "VIA23" { 
		 contactCodeNumber               = 6
		 cutLayer                        = "VIA2"
		 lowerLayer                      = "METAL2"
		 upperLayer                      = "METAL3"
		 cutWidth                        = 0.60000
		 cutHeight                       = 0.60000
		 upperLayerEncWidth              = 0.60000
		 upperLayerEncHeight             = 0.60000
		 lowerLayerEncWidth              = 0.60000
		 lowerLayerEncHeight             = 0.60000
		 minCutSpacing                   = 1.50000
		 unitMinResistance               = 1.000000 
		 unitNomResistance               = 3.000000 
		 unitMaxResistance               = 5.000000 
}



ContactCode "viaGenVia" { 
		 contactCodeNumber               = 13
		 cutLayer                        = "VIA1"
		 lowerLayer                      = "METAL1"
		 upperLayer                      = "METAL2"
		 isFatContact                    = 1
		 cutWidth                        = 0.60000
		 cutHeight                       = 0.60000
		 upperLayerEncWidth              = 0.30000
		 upperLayerEncHeight             = 0.30000
		 lowerLayerEncWidth              = 0.30000
		 lowerLayerEncHeight             = 0.30000
		 unitMinResistance               = 1.000000 
		 unitNomResistance               = 3.000000 
		 unitMaxResistance               = 5.000000 
		 minCutSpacing                   = 1.50000
}

ContactCode "viaGenVia2" { 
		 contactCodeNumber               = 14
		 cutLayer                        = "VIA2"
		 lowerLayer                      = "METAL2"
		 upperLayer                      = "METAL3"
		 isFatContact                    = 1
		 cutWidth                        = 0.60000
		 cutHeight                       = 0.60000
		 upperLayerEncWidth              = 0.60000
		 upperLayerEncHeight             = 0.60000
		 lowerLayerEncWidth              = 0.60000
		 lowerLayerEncHeight             = 0.60000
		 unitMinResistance               = 1.000000 
		 unitNomResistance               = 3.000000 
		 unitMaxResistance               = 5.000000 
		 minCutSpacing                   = 1.50000
}


DesignRule 	 {
		 layer1				 = "VIA1" 
		 layer2				 = "VIA2" 
		 minSpacing			 = 0 
		 minEnclosure			 = 0 
		 stackable			 = 1 
}


/*******************************************************/
/**************** Special rules Section ****************/
/*******************************************************/
Tile	"unit" {
	width	= 2.4
	height	= 21.6
}
