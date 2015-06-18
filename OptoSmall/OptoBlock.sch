EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:OptoISmall-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title ""
Date ""
Rev ""
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
F 0 "U4" H 5286 3079 40  0000 C CNN
F 1 "4N26" H 5680 2715 40  0000 C CNN
F 2 "Housings_DIP:DIP-6_W7.62mm_LongPads" H 5301 2720 29  0000 C CNN
F 3 "" H 5500 2900 60  0000 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 557B9EB0
P 5000 2800
AR Path="/557B9C27/557B9EB0" Ref="R2"  Part="1" 
AR Path="/557BCF63/557B9EB0" Ref="R5"  Part="1" 
AR Path="/557BD8A1/557B9EB0" Ref="R8"  Part="1" 
AR Path="/557BD8A9/557B9EB0" Ref="R11"  Part="1" 
F 0 "R11" V 5080 2800 40  0000 C CNN
F 1 "330" V 5007 2801 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4930 2800 30  0000 C CNN
F 3 "~" H 5000 2800 30  0000 C CNN
	1    5000 2800
	0    -1   -1   0   
$EndComp
NoConn ~ 5800 2800
$Comp
L R R1
U 1 1 557B9EBF
P 4600 3250
AR Path="/557B9C27/557B9EBF" Ref="R1"  Part="1" 
AR Path="/557BCF63/557B9EBF" Ref="R4"  Part="1" 
AR Path="/557BD8A1/557B9EBF" Ref="R7"  Part="1" 
AR Path="/557BD8A9/557B9EBF" Ref="R10"  Part="1" 
F 0 "R10" V 4680 3250 40  0000 C CNN
F 1 "330" V 4607 3251 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 3250 30  0000 C CNN
F 3 "~" H 4600 3250 30  0000 C CNN
	1    4600 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 2800 5200 2800
Wire Wire Line
	5100 3050 5100 3000
Wire Wire Line
	5100 3000 5200 3000
Wire Wire Line
	4750 3250 4800 3250
Wire Wire Line
	5100 3600 5100 3450
Wire Wire Line
	3900 3600 5100 3600
Wire Wire Line
	4450 3250 3900 3250
Wire Wire Line
	4850 2800 3900 2800
Wire Wire Line
	5800 2900 6250 2900
$Comp
L R R3
U 1 1 557B9F95
P 6400 2900
AR Path="/557B9C27/557B9F95" Ref="R3"  Part="1" 
AR Path="/557BCF63/557B9F95" Ref="R6"  Part="1" 
AR Path="/557BD8A1/557B9F95" Ref="R9"  Part="1" 
AR Path="/557BD8A9/557B9F95" Ref="R12"  Part="1" 
F 0 "R12" V 6480 2900 40  0000 C CNN
F 1 "330" V 6407 2901 40  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6330 2900 30  0000 C CNN
F 3 "~" H 6400 2900 30  0000 C CNN
	1    6400 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 3000 5950 3000
Wire Wire Line
	5950 3000 5950 3400
Wire Wire Line
	5950 3400 7050 3400
Wire Wire Line
	6550 2900 7050 2900
Text HLabel 3900 2800 0    79   Input ~ 0
VCC1
Text HLabel 3900 3250 0    79   Input ~ 0
IN1
Text HLabel 3900 3600 0    79   Input ~ 0
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
L Q_NPN_BEC Q1
U 1 1 557F6DD0
P 5000 3250
AR Path="/557B9C27/557F6DD0" Ref="Q1"  Part="1" 
AR Path="/557BCF63/557F6DD0" Ref="Q2"  Part="1" 
AR Path="/557BD8A1/557F6DD0" Ref="Q3"  Part="1" 
AR Path="/557BD8A9/557F6DD0" Ref="Q4"  Part="1" 
F 0 "Q4" H 5300 3300 50  0000 R CNN
F 1 "Q_NPN_BEC" H 5600 3200 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23_Handsoldering" H 5200 3350 29  0000 C CNN
F 3 "" H 5000 3250 60  0000 C CNN
	1    5000 3250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
