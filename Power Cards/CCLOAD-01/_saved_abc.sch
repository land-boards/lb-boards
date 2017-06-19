EESchema Schematic File Version 2
LIBS:CCLOAD-01-rescue
LIBS:device
LIBS:conn
LIBS:power
LIBS:DougsSch
LIBS:linear
LIBS:analog_devices
LIBS:CCLOAD-01-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L CONN_01X11 P5
U 1 1 5941708B
P 5050 2000
F 0 "P5" H 5050 2600 50  0000 C CNN
F 1 "CONN_01X11" V 5150 2000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x11_Pitch2.54mm" H 5050 1400 50  0000 C CNN
F 3 "" H 5050 2000 50  0000 C CNN
	1    5050 2000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5250 1500 6000 1500
Wire Wire Line
	5250 1600 6000 1600
Wire Bus Line
	6000 1600 6000 1300
Wire Bus Line
	6000 1300 6400 1300
Text Label 5550 1500 0    60   ~ 0
D0
Text Label 5550 1600 0    60   ~ 0
D1
Text Label 6050 1300 0    60   ~ 0
D[0..1]
Text HLabel 6400 1300 2    60   Input ~ 0
D[0..1]
NoConn ~ 5250 1700
NoConn ~ 5250 1800
NoConn ~ 5250 1900
NoConn ~ 5250 2000
NoConn ~ 5250 2100
$EndSCHEMATC
