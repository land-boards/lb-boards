EESchema Schematic File Version 2  date 17/09/2013 16:26:56
LIBS:DougsSch
LIBS:resonator_3pins
LIBS:ATProg-cache
EELAYER 27 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 5
Title "TINYDUINO85"
Date "17 sep 2013"
Rev "X2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3500 2050 4400 2050
Wire Wire Line
	4400 2050 4400 2100
Wire Wire Line
	3500 3300 4350 3300
Wire Wire Line
	4350 3300 4350 3250
Text Label 5100 2700 0    60   ~ 0
SCK
Text Label 5100 2800 0    60   ~ 0
MISO
Text Label 5100 2900 0    60   ~ 0
MOSI
$Comp
L ATTINY85 U4
U 1 1 5030EBB2
P 4450 3050
F 0 "U4" H 4600 3850 60  0000 C CNN
F 1 "ATTINY85" H 4800 3000 60  0000 C CNN
F 2 "DIP-8__300" H 4450 3050 60  0001 C CNN
F 3 "" H 4450 3050 60  0001 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2700 5500 2700
Wire Wire Line
	5050 2800 5500 2800
Wire Wire Line
	5050 2900 5500 2900
Wire Wire Line
	3500 2650 3850 2650
Text HLabel 3500 2650 0    60   Input ~ 0
RST(I)
Text HLabel 5500 2700 2    60   Input ~ 0
SCK
Text HLabel 5500 2800 2    60   Output ~ 0
MISO
Text HLabel 5500 2900 2    60   Input ~ 0
MOSI
Text HLabel 3500 3300 0    60   UnSpc ~ 0
GND
Text HLabel 3500 2050 0    60   UnSpc ~ 0
VCC
$EndSCHEMATC
