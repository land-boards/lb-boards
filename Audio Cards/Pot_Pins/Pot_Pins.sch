EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "AUDIO AMPLIFIER - 2.5W"
Date "2022-03-27"
Rev "3"
Comp "land-boards.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 6241E467
P 5250 2350
F 0 "J1" H 5168 2767 50  0000 C CNN
F 1 "Conn_01x05" H 5168 2676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 5250 2350 50  0001 C CNN
F 3 "~" H 5250 2350 50  0001 C CNN
	1    5250 2350
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 624204D5
P 5950 2350
F 0 "J2" H 6030 2392 50  0000 L CNN
F 1 "Conn_01x03" H 6030 2301 50  0000 L CNN
F 2 "LandBoards_Conns:Pot3" H 5950 2350 50  0001 C CNN
F 3 "~" H 5950 2350 50  0001 C CNN
	1    5950 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2350 5450 2350
Wire Wire Line
	5450 2450 5550 2450
Wire Wire Line
	5450 2550 5550 2550
Wire Wire Line
	5550 2550 5550 2450
Connection ~ 5550 2450
Wire Wire Line
	5550 2450 5750 2450
Wire Wire Line
	5450 2150 5550 2150
Wire Wire Line
	5550 2150 5550 2250
Wire Wire Line
	5550 2250 5750 2250
Wire Wire Line
	5550 2250 5450 2250
Connection ~ 5550 2250
$EndSCHEMATC
