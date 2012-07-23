EESchema Schematic File Version 2  date Sun 22 Jul 2012 01:43:41 PM EDT
LIBS:device
LIBS:conn
LIBS:audio
LIBS:interface
LIBS:opto
LIBS:atmel
LIBS:contrib
EELAYER 25  0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Light Dependent Resistor (LDR)"
Date "22 jul 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 4550 3300
Wire Wire Line
	3650 3050 3650 2900
Wire Wire Line
	4550 2900 3650 2900
Wire Wire Line
	4550 3400 4550 2900
Wire Wire Line
	3650 3550 3650 4000
Wire Wire Line
	3650 4000 4550 4000
Wire Wire Line
	4550 4000 4550 3900
Wire Wire Line
	4550 3300 4450 3300
Wire Wire Line
	3750 3300 3950 3300
Text Label 3800 3300 0    60   ~ 0
VC
Text Label 4100 4000 0    60   ~ 0
GND
Text Label 3950 2900 0    60   ~ 0
SENS
$Comp
L CONN_1 MTG2
U 1 1 4FF08479
P 5300 3900
F 0 "MTG2" H 5380 3900 40  0000 L CNN
F 1 "CONN_1" H 5300 3955 30  0001 C CNN
	1    5300 3900
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 MTG1
U 1 1 4FF0846C
P 5300 3800
F 0 "MTG1" H 5380 3800 40  0000 L CNN
F 1 "CONN_1" H 5300 3855 30  0001 C CNN
	1    5300 3800
	1    0    0    -1  
$EndComp
$Comp
L RVAR VT90N2
U 1 1 4FF082D2
P 4550 3650
F 0 "VT90N2" V 4630 3600 50  0000 C CNN
F 1 "RVAR" V 4470 3710 50  0000 C CNN
	1    4550 3650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4FF082C2
P 4200 3300
F 0 "R1" V 4280 3300 50  0000 C CNN
F 1 "56K" V 4200 3300 50  0000 C CNN
	1    4200 3300
	0    1    1    0   
$EndComp
$Comp
L JUMPER3 JP1
U 1 1 4FF082B1
P 3650 3300
F 0 "JP1" H 3700 3200 40  0000 L CNN
F 1 "JUMPER3" H 3650 3400 40  0000 C CNN
	1    3650 3300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
