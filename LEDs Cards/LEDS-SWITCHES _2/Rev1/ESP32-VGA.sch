EESchema Schematic File Version 4
LIBS:ESP32-VGA-cache
EELAYER 26 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "ESP32-VGA"
Date "2020-02-19"
Rev "1"
Comp "land-boards.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LandBoards:MTG_HOLE MTG?1
U 1 1 586AD5E2
P 9000 10000
F 0 "MTG?1" H 9000 10100 60  0000 C CNN
F 1 "MTG_HOLE" H 9000 9900 60  0000 C CNN
F 2 "LandBoards_MountHoles:MTG-6-32" H 9000 10000 60  0000 C CNN
F 3 "" H 9000 10000 60  0000 C CNN
	1    9000 10000
	1    0    0    -1  
$EndComp
$Comp
L LandBoards:MTG_HOLE MTG2
U 1 1 586AD65D
P 9000 9700
F 0 "MTG2" H 9000 9800 60  0000 C CNN
F 1 "MTG_HOLE" H 9000 9600 60  0000 C CNN
F 2 "LandBoards_MountHoles:MTG-6-32" H 9000 9700 60  0000 C CNN
F 3 "" H 9000 9700 60  0000 C CNN
	1    9000 9700
	1    0    0    -1  
$EndComp
$Comp
L LandBoards:MTG_HOLE MTG3
U 1 1 586AD691
P 9000 10300
F 0 "MTG3" H 9000 10400 60  0000 C CNN
F 1 "MTG_HOLE" H 9000 10200 60  0000 C CNN
F 2 "LandBoards_MountHoles:MTG-6-32" H 9000 10300 60  0000 C CNN
F 3 "" H 9000 10300 60  0000 C CNN
	1    9000 10300
	1    0    0    -1  
$EndComp
$Comp
L LandBoards:MTG_HOLE MTG1
U 1 1 586AD6D2
P 9000 9400
F 0 "MTG1" H 9000 9500 60  0000 C CNN
F 1 "MTG_HOLE" H 9000 9300 60  0000 C CNN
F 2 "LandBoards_MountHoles:MTG-6-32" H 9000 9400 60  0000 C CNN
F 3 "" H 9000 9400 60  0000 C CNN
	1    9000 9400
	1    0    0    -1  
$EndComp
$Comp
L LandBoards:COUPON TEST1
U 1 1 59399B7A
P 11350 10250
F 0 "TEST1" H 11350 10550 60  0000 C CNN
F 1 "COUPON" H 11350 10200 60  0000 C CNN
F 2 "LandBoards_Marking:TEST_BLK-REAR" H 11350 10100 60  0000 C CNN
F 3 "" H 11350 10250 60  0000 C CNN
	1    11350 10250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5C75909D
P 7550 5150
F 0 "#PWR03" H 7550 4900 50  0001 C CNN
F 1 "GND" H 7550 5000 50  0000 C CNN
F 2 "" H 7550 5150 60  0000 C CNN
F 3 "" H 7550 5150 60  0000 C CNN
	1    7550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR08
U 1 1 5C7574C1
P 4900 1700
F 0 "#PWR08" H 4900 1550 50  0001 C CNN
F 1 "+3.3V" H 4900 1840 50  0000 C CNN
F 2 "" H 4900 1700 50  0001 C CNN
F 3 "" H 4900 1700 50  0001 C CNN
	1    4900 1700
	1    0    0    -1  
$EndComp
Text Notes 1550 7900 0    60   ~ 0
FTDI CONNECTOR
Text Label 3500 2150 0    60   ~ 0
VO3
Text Label 2350 950  0    60   ~ 0
DCIN
Wire Wire Line
	1700 1050 1800 1050
Wire Wire Line
	1800 1050 1800 1150
Wire Wire Line
	2650 1150 1800 1150
Connection ~ 1800 1150
Connection ~ 1800 1050
Wire Wire Line
	2800 2650 2800 2700
Wire Wire Line
	3400 2250 3500 2250
Wire Wire Line
	3500 2250 3500 2150
Wire Wire Line
	4900 2250 4900 2000
Wire Wire Line
	1700 6750 1550 6750
Wire Wire Line
	1550 6750 1550 7550
Wire Wire Line
	4800 2150 4800 2250
Wire Wire Line
	1700 6950 950  6950
Wire Wire Line
	1700 7050 950  7050
Wire Wire Line
	1700 7150 950  7150
Wire Wire Line
	10800 4650 10100 4650
Wire Wire Line
	10800 4550 10100 4550
Wire Wire Line
	10800 4450 10100 4450
Wire Wire Line
	10800 4350 10100 4350
Wire Wire Line
	10800 4250 10100 4250
Wire Wire Line
	10800 4150 10100 4150
Wire Wire Line
	10800 4050 10100 4050
Wire Wire Line
	10800 3950 10100 3950
Wire Wire Line
	10800 3850 10100 3850
Wire Wire Line
	10800 3750 10100 3750
Wire Wire Line
	8450 1350 8550 1350
Wire Wire Line
	8450 1150 8450 1250
Wire Wire Line
	8550 1450 8450 1450
Connection ~ 8450 1450
Wire Wire Line
	8550 1550 8450 1550
Connection ~ 8450 1550
Wire Wire Line
	8550 1650 8450 1650
Connection ~ 8450 1650
Wire Wire Line
	8550 1750 8450 1750
Connection ~ 8450 1750
Wire Wire Line
	8550 1850 8450 1850
Connection ~ 8450 1850
$Comp
L power:GND #PWR023
U 1 1 5C77586C
P 8450 1950
F 0 "#PWR023" H 8450 1700 50  0001 C CNN
F 1 "GND" H 8450 1800 50  0000 C CNN
F 2 "" H 8450 1950 60  0000 C CNN
F 3 "" H 8450 1950 60  0000 C CNN
	1    8450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1050 9150 1150
Wire Wire Line
	9050 1150 9150 1150
Connection ~ 9150 1150
Wire Wire Line
	9050 1250 9150 1250
Connection ~ 9150 1250
Wire Wire Line
	9050 1350 9150 1350
Connection ~ 9150 1350
Wire Wire Line
	9050 1450 9150 1450
Connection ~ 9150 1450
Wire Wire Line
	9050 1550 9150 1550
Connection ~ 9150 1550
Wire Wire Line
	9050 1650 9150 1650
Connection ~ 9150 1650
Wire Wire Line
	9050 1750 9150 1750
Connection ~ 9150 1750
Wire Wire Line
	9050 1850 9150 1850
$Comp
L power:+3.3V #PWR024
U 1 1 5C7758EC
P 9150 1050
F 0 "#PWR024" H 9150 900 50  0001 C CNN
F 1 "+3.3V" H 9150 1190 50  0000 C CNN
F 2 "" H 9150 1050 50  0001 C CNN
F 3 "" H 9150 1050 50  0001 C CNN
	1    9150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1150 8550 1150
Connection ~ 8450 1350
Wire Wire Line
	8550 1250 8450 1250
Connection ~ 8450 1250
Wire Wire Line
	1800 1150 1800 1250
Wire Wire Line
	1800 1050 2650 1050
Wire Wire Line
	8450 1450 8450 1550
Wire Wire Line
	8450 1550 8450 1650
Wire Wire Line
	8450 1650 8450 1750
Wire Wire Line
	8450 1750 8450 1850
Wire Wire Line
	9150 1150 9150 1250
Wire Wire Line
	9150 1250 9150 1350
Wire Wire Line
	9150 1350 9150 1450
Wire Wire Line
	9150 1450 9150 1550
Wire Wire Line
	9150 1550 9150 1650
Wire Wire Line
	9150 1650 9150 1750
Wire Wire Line
	9150 1750 9150 1850
Wire Wire Line
	8450 1350 8450 1450
Wire Wire Line
	8450 1250 8450 1350
Text Label 10250 3750 0    50   ~ 0
GP13
Connection ~ 3500 2150
Wire Wire Line
	3500 2150 3750 2150
Wire Wire Line
	3400 2150 3500 2150
$Comp
L Device:C C3
U 1 1 5CA2EF30
P 4200 2400
F 0 "C3" H 4315 2491 50  0000 L CNN
F 1 "10uF" H 4315 2400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3950 2150 30  0000 L CNN
F 3 "~" H 4200 2400 50  0001 C CNN
	1    4200 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CA2F02E
P 3750 2400
F 0 "C2" H 3865 2491 50  0000 L CNN
F 1 "0.1uF" H 3865 2400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3500 1950 30  0000 L CNN
F 3 "~" H 3750 2400 50  0001 C CNN
	1    3750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2250 3750 2150
Connection ~ 3750 2150
Wire Wire Line
	3750 2150 4200 2150
Wire Wire Line
	4200 2250 4200 2150
Connection ~ 4200 2150
Wire Wire Line
	4200 2150 4800 2150
Wire Wire Line
	3750 2550 3750 2600
Wire Wire Line
	3750 2600 4200 2600
Wire Wire Line
	4200 2600 4200 2550
Connection ~ 3750 2600
Wire Wire Line
	3750 2600 3750 2650
$Comp
L Device:C C4
U 1 1 5CAFBAEC
P 11200 9100
F 0 "C4" H 11315 9191 50  0000 L CNN
F 1 "0.1uF" H 11315 9100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10600 8600 30  0000 L CNN
F 3 "~" H 11200 9100 50  0001 C CNN
	1    11200 9100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5CAFC032
P 10750 9100
F 0 "C5" H 10865 9191 50  0000 L CNN
F 1 "0.1uF" H 10865 9100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10400 8850 30  0000 L CNN
F 3 "~" H 10750 9100 50  0001 C CNN
	1    10750 9100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5CAFC0BA
P 2100 2900
F 0 "C6" H 2215 2991 50  0000 L CNN
F 1 "0.1uF" H 2215 2900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1750 2650 30  0000 L CNN
F 3 "~" H 2100 2900 50  0001 C CNN
	1    2100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 9250 10750 9300
Wire Wire Line
	10750 9300 11200 9300
Wire Wire Line
	11200 9250 11200 9300
Wire Wire Line
	10750 9300 10750 9400
Connection ~ 10750 9300
$Comp
L power:GND #PWR0101
U 1 1 5CB6817D
P 10750 9400
F 0 "#PWR0101" H 10750 9150 50  0001 C CNN
F 1 "GND" H 10750 9250 50  0000 C CNN
F 2 "" H 10750 9400 60  0000 C CNN
F 3 "" H 10750 9400 60  0000 C CNN
	1    10750 9400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 5CB685C0
P 10750 8850
F 0 "#PWR0109" H 10750 8700 50  0001 C CNN
F 1 "+3.3V" H 10750 8990 50  0000 C CNN
F 2 "" H 10750 8850 50  0001 C CNN
F 3 "" H 10750 8850 50  0001 C CNN
	1    10750 8850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 8900 11200 8900
Wire Wire Line
	11200 8950 11200 8900
$Comp
L power:+5V #PWR014
U 1 1 5CC79544
P 2200 2050
F 0 "#PWR014" H 2200 2140 20  0001 C CNN
F 1 "+5V" H 2200 2200 50  0000 C CNN
F 2 "" H 2200 2050 60  0000 C CNN
F 3 "" H 2200 2050 60  0000 C CNN
	1    2200 2050
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:ESP32-ESP32 U1
U 1 1 5C875761
P 8850 4250
F 0 "U1" H 8050 5100 50  0000 C CNN
F 1 "ESP32" H 8050 3400 50  0000 C CNN
F 2 "LandBoards_BoardOutlines:ESP32_EXP" H 8850 4250 50  0001 C CNN
F 3 "DOCUMENTATION" H 8850 4250 50  0001 C CNN
	1    8850 4250
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5C875A68
P 3750 2650
F 0 "#PWR0108" H 3750 2400 50  0001 C CNN
F 1 "GND" H 3755 2477 50  0000 C CNN
F 2 "" H 3750 2650 50  0001 C CNN
F 3 "" H 3750 2650 50  0001 C CNN
	1    3750 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5C876006
P 1800 1250
F 0 "#PWR0114" H 1800 1000 50  0001 C CNN
F 1 "GND" H 1805 1077 50  0000 C CNN
F 2 "" H 1800 1250 50  0001 C CNN
F 3 "" H 1800 1250 50  0001 C CNN
	1    1800 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5C876212
P 1550 7550
F 0 "#PWR0115" H 1550 7300 50  0001 C CNN
F 1 "GND" H 1555 7377 50  0000 C CNN
F 2 "" H 1550 7550 50  0001 C CNN
F 3 "" H 1550 7550 50  0001 C CNN
	1    1550 7550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J15
U 1 1 5C905C47
P 1500 1050
F 0 "J15" H 1420 1327 50  0000 C CNN
F 1 "Conn_01x02" H 1420 1236 50  0000 C CNN
F 2 "LandBoards_Conns:TB2-5MM" H 1420 1160 30  0000 C CNN
F 3 "~" H 1500 1050 50  0001 C CNN
	1    1500 1050
	-1   0    0    1   
$EndComp
$Comp
L LandBoards_Conns:DCJ0202 J1
U 1 1 5C9064A0
P 2950 1050
F 0 "J1" H 2793 1153 50  0000 R CNN
F 1 "DCJ0202" H 2793 1062 50  0000 R CNN
F 2 "LandBoards_Conns:DCJ-NEW-Slotted" H 3000 850 30  0000 R CNN
F 3 "" H 2950 1050 60  0000 C CNN
	1    2950 1050
	-1   0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:AP1117 U2
U 1 1 5C906844
P 2900 2150
F 0 "U2" H 2825 2497 60  0000 C CNN
F 1 "AP1117" H 2825 2391 60  0000 C CNN
F 2 "LandBoards_SMD_Packages:SOT223" H 2825 2308 30  0000 C CNN
F 3 "" H 2900 2150 60  0000 C CNN
	1    2900 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5C906B9A
P 2800 2700
F 0 "#PWR0116" H 2800 2450 50  0001 C CNN
F 1 "GND" H 2805 2527 50  0000 C CNN
F 2 "" H 2800 2700 50  0001 C CNN
F 3 "" H 2800 2700 50  0001 C CNN
	1    2800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3650 7550 3650
Wire Wire Line
	7550 3650 7550 5150
$Comp
L power:GND #PWR0110
U 1 1 5CB5EDF0
P 10150 5150
F 0 "#PWR0110" H 10150 4900 50  0001 C CNN
F 1 "GND" H 10150 5000 50  0000 C CNN
F 2 "" H 10150 5150 60  0000 C CNN
F 3 "" H 10150 5150 60  0000 C CNN
	1    10150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5150 10150 3650
Wire Wire Line
	10150 3650 10100 3650
Text Label 10250 3950 0    50   ~ 0
GP14
Text Label 10250 4250 0    50   ~ 0
AUDIO
Text Label 10250 4550 0    50   ~ 0
GP35
Text Label 10250 4650 0    50   ~ 0
GP34
Text Label 10250 3850 0    50   ~ 0
RX2
Text Label 1000 7150 0    50   ~ 0
RX0
Text Label 1000 7050 0    50   ~ 0
TX0
$Comp
L LandBoards_Cards:FTDI-Slave J2
U 1 1 5CF868F5
P 2150 7000
F 0 "J2" H 2100 7400 60  0000 R CNN
F 1 "FTDI" H 2200 6550 60  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 2750 6450 30  0000 R CNN
F 3 "" H 2150 7000 60  0000 C CNN
	1    2150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 4750 10800 4750
Wire Wire Line
	10100 4850 10800 4850
Wire Wire Line
	10800 4950 10100 4950
Text Label 10250 4750 0    50   ~ 0
VN
Text Label 10250 4850 0    50   ~ 0
VP
Text Label 10250 4950 0    50   ~ 0
EN
$Comp
L Device:Polyfuse_Small F1
U 1 1 5D5AF7EE
P 4900 1900
F 0 "F1" H 4968 1946 50  0000 L CNN
F 1 "Polyfuse_Small" H 4968 1855 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4950 1800 30  0000 L CNN
F 3 "~" H 4900 1900 50  0001 C CNN
	1    4900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1700 4900 1800
Wire Wire Line
	1500 2300 900  2300
Wire Wire Line
	1500 2400 900  2400
Text Label 1000 2300 0    60   ~ 0
DCIN
Wire Wire Line
	2000 2400 2100 2400
Wire Wire Line
	2100 2400 2100 2300
Wire Wire Line
	2000 2200 2100 2200
Wire Wire Line
	2000 2300 2100 2300
Connection ~ 2100 2300
Wire Wire Line
	2100 2300 2100 2200
Text Label 1000 6950 0    50   ~ 0
FTDI5V0
Text Label 1000 2400 0    50   ~ 0
FTDI5V0
Wire Wire Line
	2250 2200 2200 2200
Connection ~ 2100 2200
Wire Wire Line
	2200 2050 2200 2200
Connection ~ 2200 2200
Wire Wire Line
	2200 2200 2100 2200
Text Label 10250 3550 0    50   ~ 0
VUSB
Text Label 1000 2200 0    50   ~ 0
VUSB
Wire Wire Line
	900  2200 1500 2200
$Comp
L power:GND #PWR0107
U 1 1 5D61DAE9
P 2100 3100
F 0 "#PWR0107" H 2100 2850 50  0001 C CNN
F 1 "GND" H 2100 2950 50  0000 C CNN
F 2 "" H 2100 3100 60  0000 C CNN
F 3 "" H 2100 3100 60  0000 C CNN
	1    2100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3050 2100 3100
$Comp
L LandBoards_Conns:VGA P3
U 1 1 5DEE8B2B
P 15700 4000
F 0 "P3" H 16077 4041 50  0000 L CNN
F 1 "VGA" H 16077 3950 50  0000 L CNN
F 2 "LandBoards_Conns:DB_15F-VGA-fixed" H 15450 4000 60  0001 C CNN
F 3 "" H 15450 4000 60  0000 C CNN
	1    15700 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DEE8BF6
P 14150 1200
F 0 "R1" V 14050 1200 50  0000 C CNN
F 1 "422" V 14150 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 800 30  0000 C CNN
F 3 "~" H 14150 1200 50  0001 C CNN
	1    14150 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DEE8E1C
P 14150 1600
F 0 "R2" V 14050 1600 50  0000 C CNN
F 1 "845" V 14150 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 1200 30  0000 C CNN
F 3 "~" H 14150 1600 50  0001 C CNN
	1    14150 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DEE8E68
P 14150 2300
F 0 "R3" V 14050 2300 50  0000 C CNN
F 1 "422" V 14150 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 1950 30  0000 C CNN
F 3 "~" H 14150 2300 50  0001 C CNN
	1    14150 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DEE8F5C
P 14150 2700
F 0 "R4" V 14050 2700 50  0000 C CNN
F 1 "845" V 14150 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 2300 30  0000 C CNN
F 3 "~" H 14150 2700 50  0001 C CNN
	1    14150 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5DEE8F62
P 14150 3400
F 0 "R5" V 14050 3400 50  0000 C CNN
F 1 "422" V 14150 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 3000 30  0000 C CNN
F 3 "~" H 14150 3400 50  0001 C CNN
	1    14150 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5DEE8F68
P 14150 3800
F 0 "R6" V 14050 3800 50  0000 C CNN
F 1 "845" V 14150 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14200 3400 30  0000 C CNN
F 3 "~" H 14150 3800 50  0001 C CNN
	1    14150 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	15250 3500 14950 3500
Wire Wire Line
	14650 3400 14950 3400
Wire Wire Line
	14950 3400 14950 3500
Wire Wire Line
	15250 3400 15050 3400
Wire Wire Line
	15250 3300 15150 3300
Wire Wire Line
	15150 1200 14650 1200
Wire Wire Line
	14000 1600 13000 1600
Wire Wire Line
	14000 1200 13000 1200
Wire Wire Line
	14000 2700 13000 2700
Wire Wire Line
	14000 2300 13000 2300
Wire Wire Line
	14000 3800 13000 3800
Wire Wire Line
	14000 3400 13000 3400
Text Label 13050 1200 0    50   ~ 0
REDHI
Text Label 13050 1600 0    50   ~ 0
REDLO
Text Label 13050 2300 0    50   ~ 0
GRNHI
Text Label 13050 2700 0    50   ~ 0
GRNLO
Text Label 13050 3400 0    50   ~ 0
BLUHI
Text Label 13050 3800 0    50   ~ 0
BLULO
Wire Wire Line
	15250 3700 15150 3700
Wire Wire Line
	15150 3700 15150 3800
$Comp
L power:GND #PWR02
U 1 1 5DFC24B3
P 15150 4850
F 0 "#PWR02" H 15150 4600 50  0001 C CNN
F 1 "GND" H 15150 4700 50  0000 C CNN
F 2 "" H 15150 4850 60  0000 C CNN
F 3 "" H 15150 4850 60  0000 C CNN
	1    15150 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	15150 3800 15250 3800
Connection ~ 15150 3800
Wire Wire Line
	15150 3800 15150 3900
Wire Wire Line
	15150 3900 15250 3900
Connection ~ 15150 3900
Wire Wire Line
	15150 3900 15150 4000
Wire Wire Line
	15150 4000 15250 4000
Connection ~ 15150 4000
Wire Wire Line
	15150 4000 15150 4200
Wire Wire Line
	15150 4200 15250 4200
Connection ~ 15150 4200
Wire Wire Line
	15150 4200 15150 4850
Wire Wire Line
	15250 4500 13000 4500
Wire Wire Line
	15250 4600 13000 4600
Text Label 13050 4500 0    50   ~ 0
HSYNC
Text Label 13050 4600 0    50   ~ 0
VSYNC
Text Label 7100 4850 0    50   ~ 0
REDHI
Text Label 7100 4550 0    50   ~ 0
REDLO
Text Label 7100 4450 0    50   ~ 0
GRNHI
Text Label 7100 4350 0    50   ~ 0
GRNLO
Text Label 7100 4250 0    50   ~ 0
BLUHI
Text Label 7100 3950 0    50   ~ 0
BLULO
$Comp
L LandBoards_Conns:PS2_DIN6 J3
U 1 1 5E0DDD97
P 14800 7050
F 0 "J3" H 14800 7450 50  0000 L CNN
F 1 "PS2_DIN6" H 14650 6650 50  0000 L CNN
F 2 "LandBoards_Conns:Connector_Mini-DIN_Female_6Pin_2rows" H 15300 6600 30  0000 C CNN
F 3 "" H 14700 7150 50  0001 C CNN
	1    14800 7050
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Conns:PS2_DIN6 J4
U 1 1 5E0DDE0B
P 14800 8050
F 0 "J4" H 14800 8450 50  0000 L CNN
F 1 "PS2_DIN6" H 14650 7650 50  0000 L CNN
F 2 "LandBoards_Conns:Connector_Mini-DIN_Female_6Pin_2rows" H 15300 7600 30  0000 C CNN
F 3 "" H 14700 8150 50  0001 C CNN
	1    14800 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 7200 14250 7200
Wire Wire Line
	14150 7800 14550 7800
Wire Wire Line
	14050 8200 14550 8200
Wire Wire Line
	14550 7000 14450 7000
Wire Wire Line
	14450 7000 14450 8000
Wire Wire Line
	14550 8000 14450 8000
Connection ~ 14450 8000
Wire Wire Line
	14450 8000 14450 8450
Wire Wire Line
	14550 8100 14350 8100
Wire Wire Line
	14350 8100 14350 7100
$Comp
L power:GND #PWR04
U 1 1 5E1AA3FD
P 14450 8450
F 0 "#PWR04" H 14450 8200 50  0001 C CNN
F 1 "GND" H 14450 8300 50  0000 C CNN
F 2 "" H 14450 8450 60  0000 C CNN
F 3 "" H 14450 8450 60  0000 C CNN
	1    14450 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11750 6800 10850 6800
Wire Wire Line
	11750 6900 10850 6900
Wire Wire Line
	11750 7000 10850 7000
Wire Wire Line
	11750 7100 10850 7100
Text Notes 15050 7150 0    50   ~ 0
PS/2\nKEYBOARD
Text Notes 15050 8100 0    50   ~ 0
PS/2\nMOUSE
Text Label 10900 6800 0    50   ~ 0
KBDAT
Text Label 10900 6900 0    50   ~ 0
KBCLK
Text Label 10900 7000 0    50   ~ 0
MSEDAT
Text Label 10900 7100 0    50   ~ 0
MSECLK
Wire Wire Line
	10100 3550 10800 3550
Text Label 10250 4450 0    50   ~ 0
KBDAT
Text Label 10250 4350 0    50   ~ 0
KBCLK
Text Label 10250 4050 0    50   ~ 0
MSEDAT
Text Label 10250 4150 0    50   ~ 0
MSECLK
Wire Wire Line
	5000 7150 4300 7150
Text Label 4450 7150 0    50   ~ 0
AUDIO
$Comp
L Device:R R11
U 1 1 5E24B595
P 5150 7150
F 0 "R11" V 5050 7150 50  0000 C CNN
F 1 "261" V 5150 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5250 7150 30  0000 C CNN
F 3 "~" H 5150 7150 50  0001 C CNN
	1    5150 7150
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5E24BA59
P 5600 7500
F 0 "C1" H 5715 7591 50  0000 L CNN
F 1 "0.1uF" H 5715 7500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5300 6750 30  0000 L CNN
F 3 "~" H 5600 7500 50  0001 C CNN
	1    5600 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5E24BC5E
P 6000 7500
F 0 "R12" V 5900 7500 50  0000 C CNN
F 1 "150" V 6000 7500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 8150 30  0000 C CNN
F 3 "~" H 6000 7500 50  0001 C CNN
	1    6000 7500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 7150 5600 7150
Wire Wire Line
	6000 7150 6000 7350
Wire Wire Line
	5600 7350 5600 7150
Connection ~ 5600 7150
Wire Wire Line
	5600 7150 6000 7150
Wire Wire Line
	5600 7650 5600 7800
Wire Wire Line
	5600 7800 6000 7800
Wire Wire Line
	6000 7800 6000 7650
Wire Wire Line
	5600 7800 5600 7900
Connection ~ 5600 7800
$Comp
L power:GND #PWR05
U 1 1 5E287C66
P 5600 7900
F 0 "#PWR05" H 5600 7650 50  0001 C CNN
F 1 "GND" H 5600 7750 50  0000 C CNN
F 2 "" H 5600 7900 60  0000 C CNN
F 3 "" H 5600 7900 60  0000 C CNN
	1    5600 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 7150 6400 7150
Connection ~ 6000 7150
$Comp
L Device:CP1 C7
U 1 1 5E297506
P 6550 7150
F 0 "C7" V 6802 7150 50  0000 C CNN
F 1 "10uF" V 6711 7150 50  0000 C CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6550 7150 50  0001 C CNN
F 3 "~" H 6550 7150 50  0001 C CNN
	1    6550 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 7150 6950 7150
Wire Wire Line
	6000 7800 7200 7800
Connection ~ 6000 7800
Text Label 7100 4950 0    50   ~ 0
HSYNC
Text Label 7100 3750 0    50   ~ 0
VSYNC
Text Label 7100 4650 0    50   ~ 0
RX0
Text Label 7100 4750 0    50   ~ 0
TX0
Text Notes 1550 6300 0    60   ~ 0
FTDI CONNECTOR
Wire Wire Line
	1700 5150 1550 5150
Wire Wire Line
	1550 5150 1550 5950
Wire Wire Line
	1700 5350 950  5350
Wire Wire Line
	1700 5450 950  5450
Wire Wire Line
	1700 5550 950  5550
$Comp
L power:GND #PWR0102
U 1 1 5DEE1862
P 1550 5950
F 0 "#PWR0102" H 1550 5700 50  0001 C CNN
F 1 "GND" H 1555 5777 50  0000 C CNN
F 2 "" H 1550 5950 50  0001 C CNN
F 3 "" H 1550 5950 50  0001 C CNN
	1    1550 5950
	1    0    0    -1  
$EndComp
Text Label 1000 5550 0    50   ~ 0
RX2
Text Label 1000 5450 0    50   ~ 0
TX2
$Comp
L LandBoards_Cards:FTDI-Slave J6
U 1 1 5DEE186A
P 2150 5400
F 0 "J6" H 2100 5800 60  0000 R CNN
F 1 "FTDI" H 2200 4950 60  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 2750 4850 30  0000 R CNN
F 3 "" H 2150 5400 60  0000 C CNN
	1    2150 5400
	1    0    0    -1  
$EndComp
Text Label 1000 5350 0    50   ~ 0
FTDI5V2
Connection ~ 2100 2400
$Comp
L Connector_Generic:Conn_02x04_Odd_Even H2
U 1 1 5DF27067
P 1700 2300
F 0 "H2" H 1700 2500 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 1650 2000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 1300 1900 30  0000 C CNN
F 3 "~" H 1700 2300 50  0001 C CNN
	1    1700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2500 2100 2500
Connection ~ 2100 2500
Wire Wire Line
	2100 2500 2100 2400
Wire Wire Line
	1500 2500 900  2500
Text Label 1000 2500 0    50   ~ 0
FTDI5V2
$Comp
L LandBoards_Semis:TXS0104 U3
U 1 1 5DF7EC0F
P 12500 6950
F 0 "U3" H 12500 7615 50  0000 C CNN
F 1 "TXS0104" H 12500 7524 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 12500 6300 50  0001 C CNN
F 3 "DOCUMENTATION" H 12500 6200 50  0001 C CNN
	1    12500 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	14250 6900 14250 7200
Wire Wire Line
	14150 7000 14150 7800
Wire Wire Line
	14050 7100 14050 8200
Wire Wire Line
	13250 6600 14350 6600
Text Label 7100 3550 0    50   ~ 0
ESP3V
Text Label 5150 2150 0    50   ~ 0
ESP3V
$Comp
L Connector_Generic:Conn_01x03 H1
U 1 1 5E0D349B
P 4900 2450
F 0 "H1" V 4743 2630 50  0000 L CNN
F 1 "Conn_01x03" V 4834 2630 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" V 4910 2630 30  0000 L CNN
F 3 "~" H 4900 2450 50  0001 C CNN
	1    4900 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2250 5000 2150
Wire Wire Line
	5000 2150 5500 2150
Wire Wire Line
	1700 950  2650 950 
Text Label 9800 1150 0    50   ~ 0
GP13
Text Label 9800 1250 0    50   ~ 0
GP14
Text Label 9800 1550 0    50   ~ 0
GP35
Text Label 9800 1650 0    50   ~ 0
GP34
Text Label 7100 4050 0    50   ~ 0
GP16
Text Label 9800 1350 0    50   ~ 0
GP16
Text Label 9800 1750 0    50   ~ 0
VN
Text Label 9800 1850 0    50   ~ 0
VP
Text Label 9800 1450 0    50   ~ 0
GP17
$Comp
L Connector_Generic:Conn_02x08_Odd_Even P2
U 1 1 5E132B2D
P 8750 1450
F 0 "P2" H 8800 1850 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 8950 950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 8750 700 30  0000 C CNN
F 3 "~" H 8750 1450 50  0001 C CNN
	1    8750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1850 8450 1950
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 5E1721DB
P 10500 1450
F 0 "P4" H 10450 1850 50  0000 L CNN
F 1 "Conn_01x08" H 10300 950 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 9950 900 30  0000 L CNN
F 3 "~" H 10500 1450 50  0001 C CNN
	1    10500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1150 10300 1150
Wire Wire Line
	9600 1250 10300 1250
Wire Wire Line
	9600 1350 10300 1350
Wire Wire Line
	9600 1550 10300 1550
Wire Wire Line
	9600 1650 10300 1650
Wire Wire Line
	9600 1750 10300 1750
Wire Wire Line
	9600 1850 10300 1850
Wire Wire Line
	9600 1450 10300 1450
$Comp
L power:GND #PWR0104
U 1 1 5E1C2FAA
P 13350 7400
F 0 "#PWR0104" H 13350 7150 50  0001 C CNN
F 1 "GND" H 13350 7250 50  0000 C CNN
F 2 "" H 13350 7400 60  0000 C CNN
F 3 "" H 13350 7400 60  0000 C CNN
	1    13350 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13250 7300 13350 7300
Wire Wire Line
	13350 7300 13350 7400
Wire Wire Line
	11650 7300 11750 7300
Wire Wire Line
	11750 6600 11650 6600
Wire Wire Line
	11650 6600 11650 6450
$Comp
L power:+3.3V #PWR0117
U 1 1 5E1F6261
P 11650 6450
F 0 "#PWR0117" H 11650 6300 50  0001 C CNN
F 1 "+3.3V" H 11650 6590 50  0000 C CNN
F 2 "" H 11650 6450 50  0001 C CNN
F 3 "" H 11650 6450 50  0001 C CNN
	1    11650 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14550 7100 14350 7100
Connection ~ 14350 7100
Wire Wire Line
	14350 7100 14350 6600
Wire Wire Line
	2100 2500 2100 2750
$Comp
L LandBoards_Conns:RCA-JACK J5
U 1 1 5E2C8977
P 7350 7200
F 0 "J5" H 7173 7227 60  0000 R CNN
F 1 "RCA-JACK" H 7173 7121 60  0000 R CNN
F 2 "LandBoards_Conns:RCA" H 7173 7038 30  0000 R CNN
F 3 "" H 7350 7200 60  0000 C CNN
	1    7350 7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7400 7500 7400 7800
Wire Wire Line
	7300 7500 7300 7800
Connection ~ 7300 7800
Wire Wire Line
	7300 7800 7400 7800
Wire Wire Line
	7200 7500 7200 7800
Connection ~ 7200 7800
Wire Wire Line
	7200 7800 7300 7800
Wire Wire Line
	11650 7300 11650 6600
Connection ~ 11650 6600
Text Label 7100 3850 0    50   ~ 0
TX2
Text Label 7100 4150 0    50   ~ 0
GP17
Wire Wire Line
	14300 1200 14650 1200
Wire Wire Line
	14650 1200 14650 1600
Wire Wire Line
	14300 1600 14650 1600
Wire Wire Line
	14300 2700 14650 2700
Wire Wire Line
	14650 2700 14650 2300
Wire Wire Line
	14300 3400 14650 3400
Wire Wire Line
	14650 3400 14650 3800
Wire Wire Line
	14300 3800 14650 3800
Connection ~ 14650 1200
Wire Wire Line
	15150 1200 15150 3300
Wire Wire Line
	15050 2300 15050 3400
Connection ~ 14650 3400
Wire Wire Line
	6950 3750 7600 3750
Wire Wire Line
	6950 3850 7600 3850
Wire Wire Line
	6950 3950 7600 3950
Wire Wire Line
	6950 4050 7600 4050
Wire Wire Line
	6950 4150 7600 4150
Wire Wire Line
	6950 4250 7600 4250
Wire Wire Line
	6950 4350 7600 4350
Wire Wire Line
	6950 4450 7600 4450
Wire Wire Line
	6950 4550 7600 4550
Wire Wire Line
	6950 4650 7600 4650
Wire Wire Line
	6950 4750 7600 4750
Wire Wire Line
	6950 4850 7600 4850
Wire Wire Line
	6950 4950 7600 4950
Wire Wire Line
	6950 3550 7600 3550
Wire Wire Line
	10750 8850 10750 8900
Wire Wire Line
	13250 6800 14550 6800
Wire Wire Line
	13250 6900 14250 6900
Wire Wire Line
	13250 7000 14150 7000
Wire Wire Line
	13250 7100 14050 7100
Connection ~ 10750 8900
Wire Wire Line
	10750 8900 10750 8950
$Comp
L power:+5V #PWR0103
U 1 1 5E2C8C90
P 14350 6450
F 0 "#PWR0103" H 14350 6540 20  0001 C CNN
F 1 "+5V" H 14350 6600 50  0000 C CNN
F 2 "" H 14350 6450 60  0000 C CNN
F 3 "" H 14350 6450 60  0000 C CNN
	1    14350 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14350 6450 14350 6600
Connection ~ 14350 6600
Wire Wire Line
	14300 2300 14650 2300
Connection ~ 14650 2300
Wire Wire Line
	14650 2300 15050 2300
$EndSCHEMATC
