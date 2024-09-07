EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:DougsSch
LIBS:FTDIBkout-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1600 900  1850 900 
Wire Wire Line
	1600 1000 1850 1000
Wire Wire Line
	1600 1100 1850 1100
Wire Wire Line
	1850 1200 1600 1200
Wire Wire Line
	1600 1300 1850 1300
Wire Wire Line
	1850 1400 1600 1400
Wire Wire Line
	2350 900  2650 900 
Wire Wire Line
	2350 1000 2650 1000
Wire Wire Line
	2650 1100 2350 1100
Wire Wire Line
	2350 1200 2650 1200
Wire Wire Line
	2650 1300 2350 1300
Wire Wire Line
	2350 1400 2650 1400
$Comp
L CONN_02X06 P2
U 1 1 5860962E
P 2100 1150
F 0 "P2" H 2100 1500 50  0000 C CNN
F 1 "CONN_02X06" H 2100 800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x06" H 2100 750 20  0000 C CNN
F 3 "" H 2100 -50 50  0000 C CNN
	1    2100 1150
	1    0    0    -1  
$EndComp
$Comp
L FTDI-Slave BRD?
U 1 1 5862750F
P 3150 1500
F 0 "BRD?" H 3250 2250 60  0000 C CNN
F 1 "FTDI-Slave" H 3150 1450 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 3150 1400 20  0000 C CNN
F 3 "" H 3150 1500 60  0000 C CNN
	1    3150 1500
	-1   0    0    -1  
$EndComp
$Comp
L FTDI-Master BRD?
U 1 1 58627540
P 1100 1500
F 0 "BRD?" H 1200 2250 60  0000 C CNN
F 1 "FTDI-Master" H 1100 1450 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 1100 1400 20  0000 C CNN
F 3 "" H 1100 1500 60  0000 C CNN
	1    1100 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
