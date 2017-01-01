EESchema Schematic File Version 2  date 18/12/2014 13:48:28
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:contrib
LIBS:DougsSch
LIBS:EDDIE-01-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "18 dec 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L EDISONCONNECTOR U?
U 1 1 54931DFE
P 5650 3650
F 0 "U?" H 4800 5900 60  0000 C CNN
F 1 "EDISONCONNECTOR" H 5500 1250 60  0000 C CNN
F 2 "" H 5650 4050 60  0000 C CNN
F 3 "" H 5650 4050 60  0000 C CNN
	1    5650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5350 4350 5350
Wire Wire Line
	4350 5350 4350 6000
Wire Wire Line
	4450 5450 4350 5450
Connection ~ 4350 5450
Wire Wire Line
	4350 5550 4450 5550
Connection ~ 4350 5550
Wire Wire Line
	4450 5650 4350 5650
Connection ~ 4350 5650
Wire Wire Line
	4350 5750 4450 5750
Connection ~ 4350 5750
Wire Wire Line
	4450 5850 4350 5850
Connection ~ 4350 5850
$Comp
L GND #PWR?
U 1 1 54931F1C
P 4350 6000
F 0 "#PWR?" H 4350 6000 30  0001 C CNN
F 1 "GND" H 4350 5930 30  0001 C CNN
F 2 "" H 4350 6000 60  0000 C CNN
F 3 "" H 4350 6000 60  0000 C CNN
	1    4350 6000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
