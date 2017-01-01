EESchema Schematic File Version 2  date 18/09/2013 15:19:46
LIBS:DougsSch
LIBS:resonator_3pins
LIBS:ATProg-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date "18 sep 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_3X2 H1
U 1 1 5239EE83
P 5650 3000
F 0 "H1" H 5650 3250 50  0000 C CNN
F 1 "CONN_3X2" V 5650 3050 40  0000 C CNN
F 2 "pin_array_3x2" H 5650 2850 60  0000 C CNN
F 3 "~" H 5650 3000 60  0000 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2850 4700 2850
Wire Wire Line
	4700 2950 5250 2950
Wire Wire Line
	4700 3050 5250 3050
Wire Wire Line
	6600 2850 6050 2850
Wire Wire Line
	6600 2950 6050 2950
Wire Wire Line
	6600 3050 6050 3050
Text HLabel 4700 2850 0    60   Output ~ 0
MISO
Text HLabel 4700 2950 0    60   Input ~ 0
SCK
Text HLabel 4700 3050 0    60   Input ~ 0
RST
Text HLabel 6600 2850 2    60   UnSpc ~ 0
VCC
Text HLabel 6600 3050 2    60   UnSpc ~ 0
GND
Text HLabel 6600 2950 2    60   Input ~ 0
MOSI
$EndSCHEMATC
