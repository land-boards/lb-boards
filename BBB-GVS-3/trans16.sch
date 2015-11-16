EESchema Schematic File Version 2
LIBS:DougsSch
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:beaglebone
LIBS:linear
LIBS:memory
LIBS:BBB-GVS-3-cache
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
Wire Wire Line
	5600 1800 6450 1800
Wire Wire Line
	6350 2900 6450 2900
Connection ~ 6350 1800
$Comp
L CONN_8 P1
U 1 1 54E261B0
P 5550 2350
F 0 "P1" V 5500 2350 60  0000 C CNN
F 1 "CONN_8" V 5600 2350 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 5550 2350 60  0000 C CNN
F 3 "~" H 5550 2350 60  0000 C CNN
	1    5550 2350
	-1   0    0    -1  
$EndComp
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
$Comp
L CONN_8 P2
U 1 1 54E261D0
P 8850 2350
F 0 "P2" V 8800 2350 60  0000 C CNN
F 1 "CONN_8" V 8900 2350 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 8850 2350 60  0000 C CNN
F 3 "~" H 8850 2350 60  0000 C CNN
	1    8850 2350
	1    0    0    -1  
$EndComp
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
$Comp
L CONN_8 P3
U 1 1 54E261EC
P 9600 2350
F 0 "P3" V 9550 2350 60  0000 C CNN
F 1 "CONN_8" V 9650 2350 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 9600 2350 60  0000 C CNN
F 3 "~" H 9600 2350 60  0000 C CNN
	1    9600 2350
	1    0    0    -1  
$EndComp
$Comp
L CONN_8 P4
U 1 1 54E261F8
P 10350 2350
F 0 "P4" V 10300 2350 60  0000 C CNN
F 1 "CONN_8" V 10400 2350 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 10350 2350 60  0000 C CNN
F 3 "~" H 10350 2350 60  0000 C CNN
	1    10350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2000 9250 2000
Connection ~ 9150 2000
Wire Wire Line
	9250 2100 9150 2100
Connection ~ 9150 2100
Wire Wire Line
	9150 2200 9250 2200
Connection ~ 9150 2200
Wire Wire Line
	9250 2300 9150 2300
Connection ~ 9150 2300
Wire Wire Line
	9150 2400 9250 2400
Connection ~ 9150 2400
Wire Wire Line
	9250 2500 9150 2500
Connection ~ 9150 2500
Wire Wire Line
	9150 2600 9250 2600
Connection ~ 9150 2600
Wire Wire Line
	9250 2700 9150 2700
Wire Wire Line
	10000 2000 9900 2000
Wire Wire Line
	9900 2700 10000 2700
Wire Wire Line
	10000 2600 9900 2600
Connection ~ 9900 2600
Wire Wire Line
	9900 2500 10000 2500
Connection ~ 9900 2500
Wire Wire Line
	10000 2400 9900 2400
Connection ~ 9900 2400
Wire Wire Line
	9900 2300 10000 2300
Connection ~ 9900 2300
Wire Wire Line
	10000 2200 9900 2200
Connection ~ 9900 2200
Wire Wire Line
	9900 2100 10000 2100
Connection ~ 9900 2100
$Comp
L GND #PWR07
U 1 1 54E26244
P 8050 3050
F 0 "#PWR07" H 8050 3050 30  0001 C CNN
F 1 "GND" H 8050 2980 30  0001 C CNN
F 2 "" H 8050 3050 60  0000 C CNN
F 3 "" H 8050 3050 60  0000 C CNN
	1    8050 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2900 9900 2900
Wire Wire Line
	7950 1800 9250 1800
Connection ~ 9900 2700
Wire Wire Line
	6350 1800 6350 2900
Wire Wire Line
	8050 2900 8050 3050
Wire Wire Line
	9900 2900 9900 2000
Connection ~ 8050 2900
Wire Wire Line
	9150 2700 9150 1800
Text Label 8650 1800 0    60   ~ 0
VDD_5V
Text GLabel 9250 1800 2    60   UnSpc ~ 0
VDD_5V
Connection ~ 9150 1800
Text GLabel 5600 1800 0    60   UnSpc ~ 0
VDD_3V3EXP
$EndSCHEMATC
