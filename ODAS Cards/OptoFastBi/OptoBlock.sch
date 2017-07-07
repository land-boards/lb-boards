EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:DougsSch
LIBS:opto
LIBS:OptoFastBi-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "FAST OPTO CARD"
Date "Thursday, June 08, 2017"
Rev "X2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 4N26 U1
U 1 1 557B9EA9
P 5500 2900
AR Path="/557B9C27/557B9EA9" Ref="U1"  Part="1" 
AR Path="/557BCF63/557B9EA9" Ref="U2"  Part="1" 
AR Path="/557BD8A1/557B9EA9" Ref="U3"  Part="1" 
AR Path="/557BD8A9/557B9EA9" Ref="U4"  Part="1" 
F 0 "U1" H 5286 3079 40  0000 C CNN
F 1 "4N26" H 5680 2715 40  0000 C CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 5301 2720 29  0001 C CNN
F 3 "" H 5500 2900 60  0000 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 557B9EB0
P 4000 2800
AR Path="/557B9C27/557B9EB0" Ref="R1"  Part="1" 
AR Path="/557BCF63/557B9EB0" Ref="R4"  Part="1" 
AR Path="/557BD8A1/557B9EB0" Ref="R7"  Part="1" 
AR Path="/557BD8A9/557B9EB0" Ref="R10"  Part="1" 
F 0 "R1" V 4080 2800 40  0000 C CNN
F 1 "DNP" V 4007 2801 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3930 2800 30  0001 C CNN
F 3 "~" H 4000 2800 30  0000 C CNN
	1    4000 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 3050 4700 3000
Wire Wire Line
	4700 3550 4700 3450
Wire Wire Line
	3550 3550 5200 3550
Wire Wire Line
	3850 2800 3550 2800
Wire Wire Line
	5800 2900 6550 2900
$Comp
L R R17
U 1 1 557B9F95
P 6700 2900
AR Path="/557B9C27/557B9F95" Ref="R17"  Part="1" 
AR Path="/557BCF63/557B9F95" Ref="R18"  Part="1" 
AR Path="/557BD8A1/557B9F95" Ref="R19"  Part="1" 
AR Path="/557BD8A9/557B9F95" Ref="R20"  Part="1" 
F 0 "R17" V 6780 2900 40  0000 C CNN
F 1 "1.2K" V 6707 2901 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6630 2900 30  0001 C CNN
F 3 "~" H 6700 2900 30  0000 C CNN
	1    6700 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 3000 5950 3000
Wire Wire Line
	5950 3000 5950 3400
Wire Wire Line
	5950 3400 7050 3400
Wire Wire Line
	6850 2900 7050 2900
Text HLabel 3550 2800 0    79   Input ~ 0
VCC1
Text HLabel 3550 3250 0    79   Input ~ 0
IN1
Text HLabel 3550 3550 0    79   Input ~ 0
GND1
Text HLabel 7050 2900 2    79   Output ~ 0
VCC2
Wire Wire Line
	6100 2900 6100 3150
Wire Wire Line
	6100 3150 7050 3150
Connection ~ 6100 2900
Text HLabel 7050 3150 2    79   Output ~ 0
OUT
Text HLabel 7050 3400 2    79   Output ~ 0
GND2
$Comp
L Q_NPN_BEC-RESCUE-OptoFast Q1
U 1 1 557F6DD0
P 4600 3250
AR Path="/557B9C27/557F6DD0" Ref="Q1"  Part="1" 
AR Path="/557BCF63/557F6DD0" Ref="Q2"  Part="1" 
AR Path="/557BD8A1/557F6DD0" Ref="Q3"  Part="1" 
AR Path="/557BD8A9/557F6DD0" Ref="Q4"  Part="1" 
AR Path="/557F6DD0" Ref="Q1"  Part="1" 
F 0 "Q1" H 4550 3400 50  0000 R CNN
F 1 "DNP(2N3904)" H 4600 3100 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23_Handsoldering" H 4800 3350 29  0001 C CNN
F 3 "" H 4600 3250 60  0000 C CNN
	1    4600 3250
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 5857EB60
P 6000 2800
AR Path="/557B9C27/5857EB60" Ref="R13"  Part="1" 
AR Path="/557BCF63/5857EB60" Ref="R14"  Part="1" 
AR Path="/557BD8A1/5857EB60" Ref="R15"  Part="1" 
AR Path="/557BD8A9/5857EB60" Ref="R16"  Part="1" 
F 0 "R13" V 6080 2800 40  0000 C CNN
F 1 "20K" V 6007 2801 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5930 2800 30  0001 C CNN
F 3 "~" H 6000 2800 30  0000 C CNN
	1    6000 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 2800 5850 2800
$Comp
L R R12
U 1 1 5857EF86
P 4000 3250
AR Path="/557BD8A9/5857EF86" Ref="R12"  Part="1" 
AR Path="/557B9C27/5857EF86" Ref="R3"  Part="1" 
AR Path="/557BCF63/5857EF86" Ref="R6"  Part="1" 
AR Path="/557BD8A1/5857EF86" Ref="R9"  Part="1" 
F 0 "R3" V 4080 3250 40  0000 C CNN
F 1 "DNP" V 4007 3251 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3930 3250 30  0001 C CNN
F 3 "~" H 4000 3250 30  0000 C CNN
	1    4000 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 2800 6350 2800
Wire Wire Line
	6350 2800 6350 3400
Connection ~ 6350 3400
Text Notes 4150 3250 0    60   ~ 0
(BASE)
Text Notes 4200 3000 0    60   ~ 0
(DIR)
Text Notes 3600 2800 0    60   ~ 0
(VCC)
Text Notes 6200 2800 0    60   ~ 0
(FAST)
Text Notes 6850 2850 0    60   ~ 0
(COLL)
Wire Wire Line
	4150 3250 4400 3250
Connection ~ 4700 3550
Connection ~ 5000 3000
Wire Wire Line
	3550 3250 3850 3250
Wire Wire Line
	4150 2800 5200 2800
$Comp
L R R2
U 1 1 593867C5
P 4000 3000
AR Path="/557B9C27/593867C5" Ref="R2"  Part="1" 
AR Path="/557BCF63/593867C5" Ref="R5"  Part="1" 
AR Path="/557BD8A1/593867C5" Ref="R8"  Part="1" 
AR Path="/557BD8A9/593867C5" Ref="R11"  Part="1" 
F 0 "R2" V 4080 3000 40  0000 C CNN
F 1 "150" V 4007 3001 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3930 3000 30  0001 C CNN
F 3 "~" H 4000 3000 30  0000 C CNN
	1    4000 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 3250 3700 3000
Wire Wire Line
	3700 3000 3850 3000
Connection ~ 3700 3250
$Comp
L CONN_01X02 H1
U 1 1 59386961
P 5400 3500
AR Path="/557B9C27/59386961" Ref="H1"  Part="1" 
AR Path="/557BCF63/59386961" Ref="H2"  Part="1" 
AR Path="/557BD8A1/59386961" Ref="H3"  Part="1" 
AR Path="/557BD8A9/59386961" Ref="H4"  Part="1" 
F 0 "H1" H 5400 3650 50  0000 C CNN
F 1 "SHORT" V 5500 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5400 3350 20  0000 C CNN
F 3 "" H 5400 3500 60  0000 C CNN
	1    5400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3450 5000 3450
Wire Wire Line
	5000 3450 5000 3000
Wire Wire Line
	4700 3000 5200 3000
Wire Wire Line
	4150 3000 4600 3000
Wire Wire Line
	4600 3000 4600 2800
Connection ~ 4600 2800
$EndSCHEMATC
