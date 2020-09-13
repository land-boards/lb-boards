EESchema Schematic File Version 2
LIBS:DougsSch
LIBS:arduino
LIBS:conn
LIBS:DDS-Mini-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date "7 jun 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7350 2600 2    60   Output ~ 0
DDS-MOSI
Text HLabel 7350 2400 2    60   Output ~ 0
DDS-SCK
Text HLabel 7350 2700 2    60   Output ~ 0
DDS-~CS
Text HLabel 4350 1800 0    60   Input ~ 0
DVDD
Text HLabel 4500 4700 0    60   Input ~ 0
DGND
Wire Wire Line
	6650 2400 7350 2400
Wire Wire Line
	6650 2600 7350 2600
Wire Wire Line
	6650 2700 7350 2700
Wire Wire Line
	6650 2500 7350 2500
Text HLabel 7350 2500 2    60   Input ~ 0
DDS-MISO
$Comp
L CONN_4 H3
U 1 1 51A51831
P 4350 3200
F 0 "H3" V 4300 3200 50  0000 C CNN
F 1 "CONN_4" V 4400 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04" V 4550 3200 60  0000 C CNN
F 3 "~" H 4350 3200 60  0000 C CNN
	1    4350 3200
	-1   0    0    -1  
$EndComp
$Comp
L arduino_mini U3
U 1 1 56D1214F
P 5950 3050
F 0 "U3" H 6450 2100 70  0000 C CNN
F 1 "arduino_mini" H 6700 2000 70  0000 C CNN
F 2 "arduino:arduino_mini" H 6550 1600 60  0000 C CNN
F 3 "" H 5950 3050 60  0000 C CNN
	1    5950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4700 5950 4600
Connection ~ 5950 4700
Wire Wire Line
	4350 1800 6850 1800
Wire Wire Line
	5950 1800 5950 1900
Connection ~ 5950 1800
Wire Wire Line
	4500 4700 7050 4700
Connection ~ 4800 4700
Wire Wire Line
	4700 3350 5250 3350
Wire Wire Line
	5250 3250 4700 3250
Wire Wire Line
	4700 3150 4900 3150
Wire Wire Line
	4900 3150 4900 1800
Connection ~ 4900 1800
Wire Wire Line
	4700 3050 4800 3050
Wire Wire Line
	4800 3050 4800 4700
$Comp
L CONN_01X06 P4
U 1 1 56D140A7
P 7750 3550
F 0 "P4" H 7750 3900 50  0000 C CNN
F 1 "CONN_01X06" H 7750 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 7750 3550 50  0000 C CNN
F 3 "" H 7750 3550 50  0000 C CNN
	1    7750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3300 7550 3300
Wire Wire Line
	7050 4700 7050 3800
Wire Wire Line
	7050 3800 7550 3800
Wire Wire Line
	7550 3400 6850 3400
Wire Wire Line
	6850 3400 6850 1800
Wire Wire Line
	6650 3550 6950 3550
Wire Wire Line
	6950 3550 6950 3300
NoConn ~ 7550 3500
Wire Wire Line
	7050 3600 7550 3600
Wire Wire Line
	7050 3600 7050 3650
Wire Wire Line
	7050 3650 6650 3650
Wire Wire Line
	6650 3450 6850 3450
Wire Wire Line
	6850 3450 6850 3700
Wire Wire Line
	6850 3700 7550 3700
Text Notes 7850 3800 0    60   ~ 0
ENCA\nVCC\nN/C\nENCB\nPBSW\nGND
Text Notes 7400 4050 0    60   ~ 0
NEWPOT-MINUS
$EndSCHEMATC
