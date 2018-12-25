EESchema Schematic File Version 2
LIBS:BBB-COMMS-1-rescue
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:linear
LIBS:memory
LIBS:LandBoards_Semis
LIBS:LandBoards_Conns
LIBS:BBB-COMMS-1-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 3 4
Title "BeagleBone Cape Baseline"
Date "24 feb 2015"
Rev "X4"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1050 1850 0    60   ~ 0
EHRPWM2A
Text Label 1050 1750 0    60   ~ 0
GPIO0_27
Text Label 1050 1650 0    60   ~ 0
GPIO1_15
Text Label 1050 1550 0    60   ~ 0
EHRPWM2B
Text Label 1050 1450 0    60   ~ 0
GPIO1_13
Text Label 1050 1250 0    60   ~ 0
TIMER4
Text Label 1050 950  0    60   ~ 0
GND
Text GLabel 1000 950  0    60   UnSpc ~ 0
GND
Text Label 1050 5850 0    60   ~ 0
GPIO1_29
Text Label 1050 5450 0    60   ~ 0
GPIO2_1
Text Label 1050 5350 0    60   ~ 0
GPIO1_14
Text Label 1050 5250 0    60   ~ 0
GPIO0_26
Text Label 1050 5150 0    60   ~ 0
GPIO1_12
Text Label 1050 5050 0    60   ~ 0
TIMER6
Text Label 1050 4950 0    60   ~ 0
TIMER7
Text Label 1050 4650 0    60   ~ 0
GND
Text GLabel 950  4650 0    60   UnSpc ~ 0
GND
Wire Wire Line
	1650 1250 1000 1250
Wire Wire Line
	1650 1450 1000 1450
Wire Wire Line
	1650 1650 1000 1650
Wire Wire Line
	1650 1850 1000 1850
Wire Wire Line
	1650 1750 1000 1750
Wire Wire Line
	1650 1550 1000 1550
Wire Wire Line
	1650 950  1000 950 
Wire Wire Line
	1600 5850 950  5850
Wire Wire Line
	1600 5450 950  5450
Wire Wire Line
	1600 5250 950  5250
Wire Wire Line
	1600 5050 950  5050
Wire Wire Line
	1600 4650 950  4650
Wire Wire Line
	1600 4950 950  4950
Wire Wire Line
	1600 5150 950  5150
Wire Wire Line
	1600 5350 950  5350
$Comp
L BEAGLEBONE BRD1
U 2 1 54E25DF8
P 1950 2100
F 0 "BRD1" H 2050 800 60  0000 C CNN
F 1 "BEAGLEBONE" H 2250 700 60  0000 C CNN
F 2 "dougsLib:BEAGLEBONE" H 1450 -50 60  0000 C CNN
F 3 "~" H 1450 -50 60  0000 C CNN
	2    1950 2100
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 3 1 54E25E07
P 1900 5750
F 0 "BRD1" H 2000 4450 60  0000 C CNN
F 1 "BEAGLEBONE" H 2200 4350 60  0000 C CNN
F 2 "dougsLib:BEAGLEBONE" H 1850 4200 60  0000 C CNN
F 3 "~" H 1400 3600 60  0000 C CNN
	3    1900 5750
	1    0    0    -1  
$EndComp
NoConn ~ 1650 1050
NoConn ~ 1650 1150
NoConn ~ 1650 1950
NoConn ~ 1650 2050
NoConn ~ 1650 2150
NoConn ~ 1650 2250
NoConn ~ 1650 2350
NoConn ~ 1650 2450
NoConn ~ 1650 2550
NoConn ~ 1650 2650
NoConn ~ 1650 2750
NoConn ~ 1650 2850
NoConn ~ 1650 2950
NoConn ~ 1650 3050
NoConn ~ 1650 3150
NoConn ~ 1600 6850
NoConn ~ 1600 6750
NoConn ~ 1600 6650
NoConn ~ 1600 6550
NoConn ~ 1600 6450
NoConn ~ 1600 6350
NoConn ~ 1600 6250
NoConn ~ 1600 6150
NoConn ~ 1600 6050
NoConn ~ 1600 5950
NoConn ~ 1600 5750
NoConn ~ 1600 5650
NoConn ~ 1600 5550
NoConn ~ 1600 4850
NoConn ~ 1600 4750
Text Label 1050 1350 0    60   ~ 0
TIMER5
Wire Wire Line
	1000 1350 1650 1350
$EndSCHEMATC
