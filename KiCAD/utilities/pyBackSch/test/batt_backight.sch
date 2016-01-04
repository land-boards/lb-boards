EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:memory
LIBS:beaglebone
LIBS:DougsSch
LIBS:BBB-GVS-V2-cache
EELAYER 27 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 4 4
Title "BeagleBone Cape"
Date "28 jun 2014"
Rev "X1"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4500 3650
NoConn ~ 4500 3750
NoConn ~ 5900 3750
NoConn ~ 5900 3650
Text Label 5500 4600 0    60   ~ 0
BL_ISET2
Text Label 5500 4700 0    60   ~ 0
BL_OUT
Text Label 5500 4800 0    60   ~ 0
BL_SINK
Text Label 4250 4800 0    60   ~ 0
BL_SINK2
Text Label 4250 4700 0    60   ~ 0
BL_IN
Text Label 4250 4600 0    60   ~ 0
BL_ISET1
Wire Wire Line
	5900 4050 6300 4050
Wire Wire Line
	6300 4050 6300 4800
Wire Wire Line
	6300 4800 5500 4800
Wire Wire Line
	4500 3950 4000 3950
Wire Wire Line
	4000 3950 4000 4700
Wire Wire Line
	4000 4700 4700 4700
Wire Wire Line
	5500 4600 6100 4600
Wire Wire Line
	6100 4600 6100 3850
Wire Wire Line
	6100 3850 5900 3850
Wire Wire Line
	5500 4700 6200 4700
Wire Wire Line
	6200 4700 6200 3950
Wire Wire Line
	6200 3950 5900 3950
Wire Wire Line
	4500 3850 4100 3850
Wire Wire Line
	4100 3850 4100 4600
Wire Wire Line
	4100 4600 4700 4600
Wire Wire Line
	4500 4050 3900 4050
Wire Wire Line
	3900 4050 3900 4800
Wire Wire Line
	3900 4800 4700 4800
$Comp
L CONN_3X2 P2
U 1 1 4EB0F9FA
P 5100 4750
F 0 "P2" H 5100 5000 50  0000 C CNN
F 1 "Backl" V 5100 4800 40  0000 C CNN
F 2 "pin_array_3x2" H 5100 4750 60  0001 C CNN
F 3 "" H 5100 4750 60  0001 C CNN
	1    5100 4750
	-1   0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 1 1 53AD8C22
P 5200 3850
F 0 "BRD1" H 5450 3400 60  0000 C CNN
F 1 "BEAGLEBONE" H 5300 3300 60  0000 C CNN
F 2 "BEAGLEBONE" H 5300 3500 60  0000 C CNN
F 3 "~" H 5200 3850 60  0000 C CNN
	1    5200 3850
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
