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
L 74LS03 U?
U 1 1 53B8A710
P 1350 1900
F 0 "U?" H 1350 1950 60  0000 C CNN
F 1 "74LS03" H 1350 1850 60  0000 C CNN
F 2 "~" H 1350 1900 60  0000 C CNN
F 3 "~" H 1350 1900 60  0000 C CNN
	1    1350 1900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53B8A71F
P 2700 1900
F 0 "R?" V 2780 1900 40  0000 C CNN
F 1 "R" V 2707 1901 40  0000 C CNN
F 2 "~" V 2630 1900 30  0000 C CNN
F 3 "~" H 2700 1900 30  0000 C CNN
	1    2700 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 1900 2450 1900
$Comp
L R R?
U 1 1 53B8A730
P 2700 1250
F 0 "R?" V 2780 1250 40  0000 C CNN
F 1 "R" V 2707 1251 40  0000 C CNN
F 2 "~" V 2630 1250 30  0000 C CNN
F 3 "~" H 2700 1250 30  0000 C CNN
	1    2700 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 1250 2450 1250
Text Label 2050 1250 0    60   ~ 0
+5V
$Comp
L 4N25 IC?
U 1 1 53B8A754
P 4400 1550
F 0 "IC?" H 4186 1729 40  0000 C CNN
F 1 "4N25" H 4580 1365 40  0000 C CNN
F 2 "DIP6" H 4201 1370 29  0000 C CNN
F 3 "" H 4400 1550 60  0000 C CNN
	1    4400 1550
	1    0    0    -1  
$EndComp
$Comp
L TEST W?
U 1 1 53B8A7F7
P 3500 1250
F 0 "W?" H 3500 1310 40  0000 C CNN
F 1 "TEST" H 3500 1180 40  0000 C CNN
F 2 "" H 3500 1250 60  0000 C CNN
F 3 "" H 3500 1250 60  0000 C CNN
	1    3500 1250
	1    0    0    -1  
$EndComp
$Comp
L TEST W?
U 1 1 53B8A81B
P 3500 1900
F 0 "W?" H 3500 1960 40  0000 C CNN
F 1 "TEST" H 3500 1830 40  0000 C CNN
F 2 "" H 3500 1900 60  0000 C CNN
F 3 "" H 3500 1900 60  0000 C CNN
	1    3500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1250 3300 1250
Wire Wire Line
	2950 1900 3300 1900
Wire Wire Line
	4050 1650 3850 1650
Wire Wire Line
	3850 1650 3850 1900
Wire Wire Line
	3850 1900 3700 1900
Wire Wire Line
	4050 1450 3850 1450
Wire Wire Line
	3850 1450 3850 1250
Wire Wire Line
	3850 1250 3700 1250
Wire Notes Line
	3500 800  3500 2400
Wire Notes Line
	3500 2400 700  2400
Wire Notes Line
	700  2400 700  800 
Wire Notes Line
	700  800  3500 800 
Text Notes 2000 1650 0    60   ~ 0
OPEN\nCOLLECTOR\nOUTPUT
Text Notes 1600 2300 0    60   ~ 0
CIRCUIT UNDER TEST
$EndSCHEMATC
