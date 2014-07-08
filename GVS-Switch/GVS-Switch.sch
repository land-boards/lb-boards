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
LIBS:DougsSch
LIBS:GVS-Switch-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "6 jul 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_3 J1
U 1 1 53B991BD
P 5550 3650
F 0 "J1" V 5500 3650 50  0000 C CNN
F 1 "CONN_3" V 5600 3650 40  0000 C CNN
F 2 "" H 5550 3650 60  0000 C CNN
F 3 "" H 5550 3650 60  0000 C CNN
	1    5550 3650
	1    0    0    1   
$EndComp
$Comp
L R R1
U 1 1 53B991CD
P 4350 3400
F 0 "R1" V 4430 3400 40  0000 C CNN
F 1 "10K" V 4357 3401 40  0000 C CNN
F 2 "~" V 4280 3400 30  0000 C CNN
F 3 "~" H 4350 3400 30  0000 C CNN
	1    4350 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 3550 4000 3550
Wire Wire Line
	4000 3400 4000 3850
Wire Wire Line
	4000 3750 4050 3750
Wire Wire Line
	4000 3400 4100 3400
Connection ~ 4000 3550
Wire Wire Line
	5200 3650 4700 3650
Wire Wire Line
	4700 3650 4700 3400
Wire Wire Line
	4700 3400 4600 3400
Wire Wire Line
	4650 3750 5200 3750
$Comp
L SW_PUSH_OMRON SW1
U 1 1 53B994EA
P 4350 3750
F 0 "SW1" H 4500 3860 50  0000 C CNN
F 1 "SW_PUSH_OMRON" H 4350 3570 50  0000 C CNN
F 2 "~" H 4350 3750 60  0000 C CNN
F 3 "~" H 4350 3750 60  0000 C CNN
	1    4350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3850 4700 3850
Wire Wire Line
	4700 3850 4700 3750
Connection ~ 4700 3750
Wire Wire Line
	4000 3850 4050 3850
Connection ~ 4000 3750
Text Label 4850 3750 0    60   ~ 0
GND
Text Label 4850 3650 0    60   ~ 0
VCC
Text Label 4850 3550 0    60   ~ 0
SIG
$EndSCHEMATC
