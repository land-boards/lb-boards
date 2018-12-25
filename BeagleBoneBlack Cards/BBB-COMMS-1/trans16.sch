EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:linear
LIBS:memory
LIBS:BBB-GVS-4-cache
EELAYER 25 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 6 6
Title "BeagleBone Cape Baseline"
Date "24 feb 2015"
Rev "X4"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5700 1800 0    60   ~ 0
VDD_3V3EXP
$Comp
L TXB0108 U4
U 1 1 54E261A0
P 7200 2350
F 0 "U4" H 7200 2250 50  0000 C CNN
F 1 "TXS0108EPWR" H 7200 2450 50  0000 C CNN
F 2 "SOG20" H 7200 2350 50  0000 C CNN
F 3 "DOCUMENTATION" H 7200 2350 50  0001 C CNN
	1    7200 2350
	1    0    0    -1  
$EndComp
$Comp
L CONN_8 P1
U 1 1 54E261B0
P 5550 2350
F 0 "P1" V 5500 2350 60  0000 C CNN
F 1 "CONN_8" V 5600 2350 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 5550 1850 60  0000 C CNN
F 3 "~" H 5550 2350 60  0000 C CNN
	1    5550 2350
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 54E26244
P 9450 3650
F 0 "#PWR09" H 9450 3650 30  0001 C CNN
F 1 "GND" H 9450 3580 30  0001 C CNN
F 2 "" H 9450 3650 60  0000 C CNN
F 3 "" H 9450 3650 60  0000 C CNN
	1    9450 3650
	1    0    0    -1  
$EndComp
Text Label 8700 1250 0    60   ~ 0
VDD_5V
Text GLabel 9700 1250 2    60   UnSpc ~ 0
VDD_5V
Text GLabel 5600 1800 0    60   UnSpc ~ 0
VDD_3V3EXP
$Comp
L GVS-8X3 J26
U 1 1 568802EC
P 8850 2350
F 0 "J26" H 8900 3300 70  0000 C CNN
F 1 "GVS-8X3" H 8900 1350 70  0000 C CNN
F 2 "DougsNewMods:Pin_Header_Straight_3x08" H 8850 2350 60  0000 C CNN
F 3 "" H 8850 2350 60  0000 C CNN
	1    8850 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	5600 1800 6450 1800
Wire Wire Line
	6350 2900 6450 2900
Connection ~ 6350 1800
Wire Wire Line
	5900 2000 6450 2000
Wire Wire Line
	5900 2100 6450 2100
Wire Wire Line
	5900 2200 6450 2200
Wire Wire Line
	6450 2300 5900 2300
Wire Wire Line
	5900 2400 6450 2400
Wire Wire Line
	6450 2500 5900 2500
Wire Wire Line
	5900 2600 6450 2600
Wire Wire Line
	6450 2700 5900 2700
Wire Wire Line
	7950 2000 8500 2000
Wire Wire Line
	7950 2100 8500 2100
Wire Wire Line
	7950 2200 8500 2200
Wire Wire Line
	8500 2300 7950 2300
Wire Wire Line
	7950 2400 8500 2400
Wire Wire Line
	8500 2500 7950 2500
Wire Wire Line
	7950 2600 8500 2600
Wire Wire Line
	8500 2700 7950 2700
Wire Wire Line
	6350 1800 6350 2900
Wire Wire Line
	9350 3200 9450 3200
Wire Wire Line
	9550 3500 8150 3500
Wire Wire Line
	8150 3500 8150 2900
Wire Wire Line
	8150 2900 7950 2900
Wire Wire Line
	9350 2500 9650 2500
Connection ~ 9450 3200
Wire Wire Line
	9350 2600 9450 2600
Connection ~ 9450 2600
Wire Wire Line
	9350 2700 9450 2700
Connection ~ 9450 2700
Wire Wire Line
	9350 2800 9450 2800
Connection ~ 9450 2800
Wire Wire Line
	9350 2900 9450 2900
Connection ~ 9450 2900
Wire Wire Line
	9350 3000 9450 3000
Connection ~ 9450 3000
Wire Wire Line
	9350 3100 9450 3100
Connection ~ 9450 3100
Wire Wire Line
	7950 1800 8050 1800
Wire Wire Line
	8050 1800 8050 1250
Wire Wire Line
	8050 1250 9700 1250
Wire Wire Line
	9350 2200 9550 2200
Connection ~ 9450 1250
Wire Wire Line
	9350 1500 9450 1500
Connection ~ 9450 1500
Wire Wire Line
	9350 1600 9450 1600
Connection ~ 9450 1600
Wire Wire Line
	9350 1700 9450 1700
Connection ~ 9450 1700
Wire Wire Line
	9350 1800 9450 1800
Connection ~ 9450 1800
Wire Wire Line
	9350 1900 9450 1900
Connection ~ 9450 1900
Wire Wire Line
	9350 2000 9450 2000
Connection ~ 9450 2000
Wire Wire Line
	9350 2100 9450 2100
Connection ~ 9450 2100
Wire Wire Line
	9550 2200 9550 3500
Wire Wire Line
	9450 1500 9450 2200
Connection ~ 9450 2200
Wire Wire Line
	9450 1250 9450 1350
Wire Wire Line
	9450 1350 9650 1350
Wire Wire Line
	9650 1350 9650 2500
Wire Wire Line
	9450 3200 9450 2500
Connection ~ 9450 2500
Wire Wire Line
	9450 3650 9450 3500
Connection ~ 9450 3500
$EndSCHEMATC
