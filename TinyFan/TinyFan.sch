EESchema Schematic File Version 2  date 11/02/2014 13:04:54
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
LIBS:TinyFan-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "11 feb 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_4 BRD3
U 1 1 52F912AD
P 5650 3250
F 0 "BRD3" V 5600 3250 50  0000 C CNN
F 1 "CONN_4" V 5700 3250 50  0000 C CNN
F 2 "" H 5650 3250 60  0000 C CNN
F 3 "" H 5650 3250 60  0000 C CNN
	1    5650 3250
	1    0    0    1   
$EndComp
Text Notes 5850 3150 0    60   ~ 0
LDR\n1-WIRE\nVCC\nGND\n
$Comp
L CONN_4 BRD2
U 1 1 52F916C1
P 5600 1950
F 0 "BRD2" V 5550 1950 50  0000 C CNN
F 1 "CONN_4" V 5650 1950 50  0000 C CNN
F 2 "" H 5600 1950 60  0000 C CNN
F 3 "" H 5600 1950 60  0000 C CNN
	1    5600 1950
	1    0    0    1   
$EndComp
Text Notes 5800 1850 0    60   ~ 0
VCC\nRELAY 2\nRELAY 1\nGND\n
Text Notes 6250 1950 0    60   ~ 0
RELAY\nMODULE
$Comp
L TINYDUINO85 BRD1
U 1 1 52FA6689
P 3550 3550
F 0 "BRD1" H 3150 5750 60  0000 C CNN
F 1 "TINYDUINO85" H 3350 3500 60  0000 C CNN
F 2 "" H 3900 3150 60  0000 C CNN
F 3 "" H 3900 3150 60  0000 C CNN
	1    3550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3000 4750 3000
Wire Wire Line
	4750 3000 4750 3400
Wire Wire Line
	4750 3400 5300 3400
Wire Wire Line
	4400 2900 4850 2900
Wire Wire Line
	4850 2900 4850 3300
Wire Wire Line
	4850 3300 5300 3300
Wire Wire Line
	4400 2400 4950 2400
Wire Wire Line
	4950 2400 4950 3200
Wire Wire Line
	4950 3200 5300 3200
Wire Wire Line
	4400 2800 5050 2800
Wire Wire Line
	5050 2800 5050 3100
Wire Wire Line
	5050 3100 5300 3100
Wire Wire Line
	4400 2000 5250 2000
Wire Wire Line
	4400 2200 4900 2200
Wire Wire Line
	4900 2200 4900 2100
Wire Wire Line
	4900 2100 5250 2100
Wire Wire Line
	4400 2100 4800 2100
Wire Wire Line
	4800 2100 4800 1800
Wire Wire Line
	4800 1800 5250 1800
Text Notes 6300 3250 0    60   ~ 0
DS18S20-LDR\nMODULE
$Comp
L DCJ0202 J?
U 1 1 52FA678A
P 1700 3300
F 0 "J?" H 1600 3450 50  0000 L BNN
F 1 "DCJ0202" H 1600 3050 50  0000 L BNN
F 2 "con-jack-DCJ0202" H 1700 3450 50  0001 C CNN
F 3 "~" H 1700 3300 60  0000 C CNN
	1    1700 3300
	1    0    0    1   
$EndComp
Wire Wire Line
	2000 3400 2750 3400
Wire Wire Line
	2750 3300 2000 3300
Wire Wire Line
	2000 3200 2200 3200
Wire Wire Line
	2200 3200 2200 3300
Connection ~ 2200 3300
Text Notes 1150 3250 0    60   ~ 0
DC \nPOWER\nIN
$EndSCHEMATC
