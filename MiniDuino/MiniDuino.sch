EESchema Schematic File Version 2  date Thu 05 Jul 2012 07:09:20 AM EDT
LIBS:power
LIBS:device
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:microcontrollers
LIBS:atmel
LIBS:atmega8
EELAYER 43  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "5 jul 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +5V #PWR?
U 1 1 4FF5756B
P 2950 1550
F 0 "#PWR?" H 2950 1640 20  0001 C CNN
F 1 "+5V" H 2950 1640 30  0000 C CNN
	1    2950 1550
	1    0    0    -1  
$EndComp
Connection ~ 2950 1600
Wire Wire Line
	2950 1550 2950 1750
Connection ~ 2950 2200
Wire Wire Line
	2700 2150 2700 2200
Wire Wire Line
	2700 2200 3050 2200
Connection ~ 2950 4400
Wire Wire Line
	3050 4400 2950 4400
Wire Wire Line
	3050 4200 2950 4200
Wire Wire Line
	2950 4200 2950 4750
Wire Wire Line
	2950 2200 2950 2150
Wire Wire Line
	2700 1650 2700 1600
Wire Wire Line
	2700 1600 2950 1600
$Comp
L R R?
U 1 1 4FF574F9
P 2700 1900
F 0 "R?" V 2780 1900 50  0000 C CNN
F 1 "10K" V 2700 1900 50  0000 C CNN
	1    2700 1900
	1    0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 4FF574BF
P 2950 1950
F 0 "D1" H 2950 2050 40  0000 C CNN
F 1 "4N4004" H 2950 1850 40  0000 C CNN
	1    2950 1950
	0    -1   -1   0   
$EndComp
$Comp
L ATMEGA8-PU IC?
U 1 1 4FF5745E
P 4250 3300
F 0 "IC?" H 3250 4600 50  0000 L BNN
F 1 "ATMEGA8-PU" H 3250 1900 50  0000 L BNN
F 2 "atmega8-DIL28-3" H 4250 3450 50  0001 C CNN
	1    4250 3300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
