EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "21 feb 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 3400 4650
NoConn ~ 3400 4550
NoConn ~ 3400 4450
NoConn ~ 3400 4350
Connection ~ 4250 1650
Wire Wire Line
	4550 1650 4250 1650
Connection ~ 4250 2400
Wire Wire Line
	4250 2400 4100 2400
Connection ~ 4250 2600
Wire Wire Line
	4250 2600 4100 2600
Connection ~ 4250 1150
Wire Wire Line
	4550 1150 4250 1150
Connection ~ 3450 1450
Connection ~ 3450 1250
Wire Wire Line
	3450 1450 3600 1450
Wire Wire Line
	3450 1250 3600 1250
Wire Wire Line
	3100 1150 3450 1150
Wire Wire Line
	3600 1650 3450 1650
Wire Wire Line
	3450 1350 3600 1350
Wire Wire Line
	3600 1550 3450 1550
Connection ~ 4250 1550
Wire Wire Line
	4100 1550 4250 1550
Connection ~ 4250 1350
Wire Wire Line
	4250 1350 4100 1350
Wire Wire Line
	4250 1650 4250 1550
Wire Wire Line
	4100 1250 4250 1250
Connection ~ 4250 1250
Wire Wire Line
	4250 1450 4100 1450
Connection ~ 4250 1450
Connection ~ 3450 1150
Connection ~ 3450 1350
Wire Wire Line
	3450 1650 3450 1550
Connection ~ 3450 1550
Wire Wire Line
	4100 2200 4250 2200
Wire Wire Line
	4250 2200 4250 2300
Wire Wire Line
	4250 2700 4100 2700
Connection ~ 4250 2200
Wire Wire Line
	4100 2500 4250 2500
Connection ~ 4250 2500
Wire Wire Line
	4100 2300 4250 2300
Connection ~ 4250 2300
$Comp
L PowerDistrib-rescue:CONN_1 MTG4
U 1 1 50095280
P 3550 4650
F 0 "MTG4" H 3630 4650 40  0000 L CNN
F 1 "CONN_1" H 3550 4705 30  0001 C CNN
F 2 "LandBoards_MountHoles:MTG-4-40-SMALL" H 3550 4650 50  0000 C CNN
F 3 "" H 3550 4650 50  0001 C CNN
	1    3550 4650
	1    0    0    -1  
$EndComp
$Comp
L PowerDistrib-rescue:CONN_1 MTG3
U 1 1 5009527D
P 3550 4550
F 0 "MTG3" H 3630 4550 40  0000 L CNN
F 1 "CONN_1" H 3550 4605 30  0001 C CNN
F 2 "LandBoards_MountHoles:MTG-4-40-SMALL" H 3550 4550 50  0000 C CNN
F 3 "" H 3550 4550 50  0001 C CNN
	1    3550 4550
	1    0    0    -1  
$EndComp
$Comp
L PowerDistrib-rescue:CONN_1 MTG2
U 1 1 50095275
P 3550 4450
F 0 "MTG2" H 3630 4450 40  0000 L CNN
F 1 "CONN_1" H 3550 4505 30  0001 C CNN
F 2 "LandBoards_MountHoles:MTG-4-40-SMALL" H 3550 4450 50  0000 C CNN
F 3 "" H 3550 4450 50  0001 C CNN
	1    3550 4450
	1    0    0    -1  
$EndComp
$Comp
L PowerDistrib-rescue:CONN_1 MTG1
U 1 1 5009526E
P 3550 4350
F 0 "MTG1" H 3630 4350 40  0000 L CNN
F 1 "CONN_1" H 3550 4405 30  0001 C CNN
F 2 "LandBoards_MountHoles:MTG-4-40-SMALL" H 3550 4350 50  0000 C CNN
F 3 "" H 3550 4350 50  0001 C CNN
	1    3550 4350
	1    0    0    -1  
$EndComp
Text Label 4300 1150 0    60   ~ 0
GND1
Text Label 3200 1150 0    60   ~ 0
VCC1
Wire Wire Line
	4250 1650 4100 1650
Wire Wire Line
	4250 2400 4250 2500
Wire Wire Line
	4250 2600 4250 2700
Wire Wire Line
	4250 1150 4100 1150
Wire Wire Line
	3450 1450 3450 1350
Wire Wire Line
	3450 1250 3450 1150
Wire Wire Line
	4250 1550 4250 1450
Wire Wire Line
	4250 1350 4250 1250
Wire Wire Line
	4250 1250 4250 1150
Wire Wire Line
	4250 1450 4250 1350
Wire Wire Line
	3450 1150 3600 1150
Wire Wire Line
	3450 1350 3450 1250
Wire Wire Line
	3450 1550 3450 1450
Wire Wire Line
	4250 2200 4250 1750
Wire Wire Line
	4250 2500 4250 2600
Wire Wire Line
	4250 2300 4250 2400
$Comp
L Connector_Generic:Conn_02x06_Odd_Even H1
U 1 1 5FAE8AA0
P 3800 1350
F 0 "H1" H 3850 1857 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 3850 1766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 3850 1675 50  0000 C CNN
F 3 "~" H 3800 1350 50  0001 C CNN
	1    3800 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even H2
U 1 1 5FAE9C8A
P 3800 2400
F 0 "H2" H 3850 2907 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 3850 2816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 3850 2725 50  0000 C CNN
F 3 "~" H 3800 2400 50  0001 C CNN
	1    3800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1750 4550 1750
Wire Wire Line
	3450 2400 3450 2500
Wire Wire Line
	3450 2600 3450 2700
Wire Wire Line
	3450 2500 3450 2600
Wire Wire Line
	3450 2200 3100 2200
Wire Wire Line
	3450 2300 3450 2400
Connection ~ 3450 2400
Connection ~ 3450 2600
Wire Wire Line
	3450 2300 3600 2300
Wire Wire Line
	3600 2200 3450 2200
Wire Wire Line
	3450 2700 3600 2700
Wire Wire Line
	3450 2400 3600 2400
Wire Wire Line
	3450 2600 3600 2600
Wire Wire Line
	3450 2500 3600 2500
Connection ~ 3450 2500
Wire Wire Line
	3450 2200 3450 2300
Connection ~ 3450 2200
Connection ~ 3450 2300
$Comp
L Connector_Generic:Conn_01x02 H3
U 1 1 5FAF5187
P 4750 1650
F 0 "H3" H 4830 1687 50  0000 L CNN
F 1 "Conn_01x02" H 4830 1596 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4830 1505 50  0000 L CNN
F 3 "~" H 4750 1650 50  0001 C CNN
	1    4750 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 H4
U 1 1 5FAF55A4
P 2650 1650
F 0 "H4" H 2568 1957 50  0000 C CNN
F 1 "Conn_01x02" H 2568 1866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2568 1775 50  0000 C CNN
F 3 "~" H 2650 1650 50  0001 C CNN
	1    2650 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 1650 2850 1650
Connection ~ 3450 1650
Wire Wire Line
	3100 2200 3100 1750
Wire Wire Line
	3100 1750 2850 1750
Text Label 3150 2200 0    50   ~ 0
VCC2
Text Label 4300 1750 0    60   ~ 0
GND2
$EndSCHEMATC
