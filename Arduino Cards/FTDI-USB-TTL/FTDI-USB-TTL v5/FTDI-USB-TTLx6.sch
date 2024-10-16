EESchema Schematic File Version 2  date 14/10/2013 13:10:48
LIBS:power
LIBS:conn
LIBS:device
LIBS:DougsSch
LIBS:FTDI-USB-TTLv5-cache
EELAYER 27 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "FTDI USB-TTL Cable"
Date "14 oct 2013"
Rev "X2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 5450 2500
Wire Wire Line
	5450 2800 5450 2500
Connection ~ 4150 4650
Wire Wire Line
	7000 3700 7200 3700
Wire Wire Line
	6500 4400 9650 4400
Wire Wire Line
	7700 3950 8200 3950
Wire Wire Line
	8200 3950 8200 3800
Wire Wire Line
	8200 3800 8600 3800
Connection ~ 7000 2700
Wire Wire Line
	7000 2300 7000 3950
Wire Wire Line
	5450 4650 5450 4450
Wire Wire Line
	5650 4650 5650 4450
Wire Wire Line
	8100 2700 7450 2700
Wire Wire Line
	7450 2700 7450 3350
Wire Wire Line
	7450 3350 6200 3350
Connection ~ 5650 2700
Wire Wire Line
	3800 2700 7000 2700
Wire Wire Line
	4500 3950 4500 2500
Wire Wire Line
	4500 2500 6800 2500
Wire Wire Line
	6800 2500 6800 2300
Wire Wire Line
	7950 3000 7950 2300
Wire Wire Line
	7950 2300 8100 2300
Connection ~ 4150 2700
Wire Wire Line
	4150 3950 4150 2700
Wire Wire Line
	3750 3700 3650 3700
Wire Wire Line
	3650 3600 4950 3600
Wire Wire Line
	3650 3400 3800 3400
Wire Wire Line
	5650 2700 5650 2800
Wire Wire Line
	4950 3300 3950 3300
Wire Wire Line
	3950 3300 3950 3500
Wire Wire Line
	3950 3500 3650 3500
Wire Wire Line
	4150 4650 4150 4350
Wire Wire Line
	8100 2400 7550 2400
Wire Wire Line
	7550 2400 7550 3550
Wire Wire Line
	7550 3550 6200 3550
Wire Wire Line
	6900 2300 6900 2500
Wire Wire Line
	6200 3250 7350 3250
Wire Wire Line
	7350 3250 7350 2600
Wire Wire Line
	7650 2800 7650 3450
Wire Wire Line
	7650 2800 8100 2800
Wire Wire Line
	7650 3450 6200 3450
Connection ~ 7000 3700
Wire Wire Line
	7700 3700 8600 3700
Wire Wire Line
	6750 4200 9550 4200
Wire Wire Line
	3800 3400 3800 2700
Wire Wire Line
	7000 3950 7200 3950
Wire Wire Line
	7350 2600 8100 2600
Wire Wire Line
	4500 4650 4500 4350
Connection ~ 5450 4650
Connection ~ 4500 4650
Wire Wire Line
	6900 2500 8100 2500
Text Notes 8600 2350 0    60   ~ 0
GND\nCTS(I)\nVCC(O)\nTX(O)\nRX(I)\nRTS(O)
Text Label 7150 2500 0    60   ~ 0
VCC
NoConn ~ 2650 3450
Text Label 4650 3600 0    60   ~ 0
DP
Text Label 4650 3300 0    60   ~ 0
DM
Text Label 7850 3950 0    60   ~ 0
PUP1
Text Label 7850 3700 0    60   ~ 0
PUP0
Text Label 7100 4400 0    60   ~ 0
TXLED*
Text Label 7100 4200 0    60   ~ 0
RXLED*
Text Label 6450 3450 0    60   ~ 0
RTS
Text Label 6450 3550 0    60   ~ 0
CTS
Text Label 6450 3350 0    60   ~ 0
RX
Text Label 6450 3250 0    60   ~ 0
TX
NoConn ~ 9750 7000
NoConn ~ 9750 6900
$Comp
L CONN_1 MTG2
U 1 1 4FF369AF
P 9900 7000
F 0 "MTG2" H 9980 7000 40  0000 L CNN
F 1 "CONN_1" H 9900 7055 30  0001 C CNN
F 2 "MTG-4-40" H 9900 7000 60  0001 C CNN
F 3 "" H 9900 7000 60  0001 C CNN
	1    9900 7000
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 MTG1
U 1 1 4FF369A7
P 9900 6900
F 0 "MTG1" H 9980 6900 40  0000 L CNN
F 1 "CONN_1" H 9900 6955 30  0001 C CNN
F 2 "MTG-4-40" H 9900 6900 60  0001 C CNN
F 3 "" H 9900 6900 60  0001 C CNN
F 4 "N/A" H 9900 6900 60  0001 C CNN "Mfg"
F 5 "N/A" H 9900 6900 60  0001 C CNN "MfgPN"
F 6 "N/A" H 9900 6900 60  0001 C CNN "Vendor"
F 7 "N/A" H 9900 6900 60  0001 C CNN "VendorPN"
	1    9900 6900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4FF314D2
P 7450 3950
F 0 "R2" V 7530 3950 50  0000 C CNN
F 1 "270" V 7450 3950 50  0000 C CNN
F 2 "SM0805" V 7400 3650 60  0000 C CNN
F 3 "" H 7450 3950 60  0001 C CNN
	1    7450 3950
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 4FF314CB
P 7450 3700
F 0 "R1" V 7530 3700 50  0000 C CNN
F 1 "270" V 7450 3700 50  0000 C CNN
F 2 "SM0805" V 7400 3400 60  0000 C CNN
F 3 "" H 7450 3700 60  0001 C CNN
F 4 "TE" H 7450 3700 60  0001 C CNN "Mfg"
F 5 "CRG0805F270R" H 7450 3700 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 7450 3700 60  0001 C CNN "Vendor"
F 7 "279-CRG0805F270R" H 7450 3700 60  0001 C CNN "VendorPN"
	1    7450 3700
	0    -1   -1   0   
$EndComp
Text Label 4650 4650 0    60   ~ 0
GND
Text Label 4700 2700 0    60   ~ 0
+5V
Text Label 4700 2500 0    60   ~ 0
+3.3V
$Comp
L C C2
U 1 1 4FF31376
P 4500 4150
F 0 "C2" H 4550 4250 50  0000 L CNN
F 1 "0.1uF" H 4550 4050 50  0000 L CNN
F 2 "SM0805" H 4500 4150 60  0000 C CNN
F 3 "" H 4500 4150 60  0001 C CNN
F 4 "Murata" H 4500 4150 60  0001 C CNN "Mfg"
F 5 "GRM155F51E104ZA1J " H 4500 4150 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 4500 4150 60  0001 C CNN "Vendor"
F 7 "81-GRM155F51E104ZA1J " H 4500 4150 60  0001 C CNN "VendorPN"
	1    4500 4150
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 H1
U 1 1 4FF31320
P 6900 1950
F 0 "H1" V 6850 1950 50  0000 C CNN
F 1 "CONN_3" V 6950 1950 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" V 6750 1400 60  0000 C CNN
F 3 "" H 6900 1950 60  0001 C CNN
F 4 "FCI" H 6900 1950 60  0001 C CNN "Mfg"
F 5 "68002-103HLF" H 6900 1950 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 6900 1950 60  0001 C CNN "Vendor"
F 7 "649-68002-103HLF" H 6900 1950 60  0001 C CNN "VendorPN"
	1    6900 1950
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 4FF312F5
P 7950 3000
F 0 "#PWR01" H 7950 3000 30  0001 C CNN
F 1 "GND" H 7950 2930 30  0001 C CNN
F 2 "" H 7950 3000 60  0001 C CNN
F 3 "" H 7950 3000 60  0001 C CNN
	1    7950 3000
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P1
U 1 1 4FF312DA
P 8450 2550
F 0 "P1" V 8400 2550 60  0000 C CNN
F 1 "CONN_6" V 8500 2550 60  0000 C CNN
F 2 "PIN_ARRAY-6X1" H 8450 2150 60  0000 C CNN
F 3 "" H 8450 2550 60  0001 C CNN
F 4 "FCI" H 8450 2550 60  0001 C CNN "Mfg"
F 5 "68002-106HLF" H 8450 2550 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 8450 2550 60  0001 C CNN "Vendor"
F 7 "649-68002-106HLF" H 8450 2550 60  0001 C CNN "VendorPN"
	1    8450 2550
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 4FF312AD
P 4150 4150
F 0 "C1" H 4200 4250 50  0000 L CNN
F 1 "10uF" H 4200 4050 50  0000 L CNN
F 2 "SM1210" H 4150 4150 60  0000 C CNN
F 3 "" H 4150 4150 60  0001 C CNN
F 4 "Yaego" H 4150 4150 60  0001 C CNN "Mfg"
F 5 "CC121ZKY5V8BB106" H 4150 4150 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 4150 4150 60  0001 C CNN "Vendor"
F 7 "603-CC121ZKY5V8BB106" H 4150 4150 60  0001 C CNN "VendorPN"
	1    4150 4150
	1    0    0    -1  
$EndComp
$Comp
L USB-B J1
U 1 1 4FF311FD
P 3200 3950
F 0 "J1" H 3300 4700 60  0000 C CNN
F 1 "USB-B" H 3400 4050 60  0000 C CNN
F 2 "J1" H 3200 3950 60  0000 C CNN
F 3 "" H 3200 3950 60  0001 C CNN
F 4 "Hirose" H 3200 3950 60  0001 C CNN "Mfg"
F 5 "UX60SC-MB-5ST(80)" H 3200 3950 60  0001 C CNN "MfgPN"
F 6 "Mouser" H 3200 3950 60  0001 C CNN "Vendor"
F 7 "798-UX60SC-MB-5ST80 " H 3200 3950 60  0001 C CNN "VendorPN"
	1    3200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3100 6350 3100
Wire Wire Line
	6350 3100 6350 2500
Connection ~ 6350 2500
Wire Wire Line
	6200 3850 6750 3850
Wire Wire Line
	6750 3850 6750 4200
Wire Wire Line
	6500 4400 6500 3950
Wire Wire Line
	6500 3950 6200 3950
Text Notes 6850 1800 1    60   ~ 0
+3.3V\n\n+5V
$Comp
L CONN_2X2 H2
U 1 1 5245770A
P 9000 3750
F 0 "H2" H 9000 3900 50  0000 C CNN
F 1 "CONN_2X2" H 9010 3620 40  0000 C CNN
F 2 "PIN_ARRAY_2X2" H 9000 3550 60  0000 C CNN
F 3 "" H 9000 3750 60  0000 C CNN
	1    9000 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3800 9550 3800
Wire Wire Line
	9550 3800 9550 4200
Wire Wire Line
	9400 3700 9650 3700
Wire Wire Line
	9650 3700 9650 4400
Wire Wire Line
	3750 4650 5650 4650
Wire Wire Line
	3750 4650 3750 3700
$Comp
L FT230XS IC?
U 1 1 525C3657
P 5550 3650
F 0 "IC?" H 5150 4300 50  0000 L BNN
F 1 "FT230XS" H 5550 3650 50  0000 L BNN
F 2 "ssop-16" H 5850 3100 50  0001 C CNN
F 3 "~" H 5550 3650 60  0000 C CNN
	1    5550 3650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
