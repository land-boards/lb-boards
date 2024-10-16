EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
Title ""
Date "11 apr 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DIGIO-128-rescue:MCP23017P U1
U 1 1 5516A1EB
P 5750 3550
AR Path="/5516A155/5516A1EB" Ref="U1"  Part="1" 
AR Path="/5516C130/5516A1EB" Ref="U2"  Part="1" 
AR Path="/5516F760/5516A1EB" Ref="U3"  Part="1" 
AR Path="/5516F76C/5516A1EB" Ref="U4"  Part="1" 
AR Path="/55171938/5516A1EB" Ref="U5"  Part="1" 
AR Path="/55171944/5516A1EB" Ref="U6"  Part="1" 
AR Path="/55171950/5516A1EB" Ref="U7"  Part="1" 
AR Path="/5517195C/5516A1EB" Ref="U8"  Part="1" 
F 0 "U8" H 5900 4550 60  0000 C CNN
F 1 "MCP23017P" H 6000 2200 60  0000 C CNN
F 2 "Housings_DIP:DIP-28__300" H 6600 2300 60  0000 C CNN
F 3 "~" H 5750 3550 60  0000 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Text HLabel 4200 2350 0    60   UnSpc ~ 0
VCC
Text HLabel 4200 2900 0    60   Input ~ 0
SCL
Text HLabel 4200 3000 0    60   BiDi ~ 0
SDA
Text HLabel 4200 3200 0    60   Input ~ 0
A2
Text HLabel 4200 3300 0    60   Input ~ 0
A1
Text HLabel 4200 3400 0    60   Input ~ 0
A0
Text HLabel 4200 3600 0    60   Input ~ 0
RST
Text HLabel 7250 2150 2    60   Output ~ 0
INTA
Text HLabel 4200 5050 0    60   UnSpc ~ 0
GND
$Comp
L DIGIO-128-rescue:CONN_20 P1
U 1 1 551747C1
P 9050 3850
AR Path="/5516A155/551747C1" Ref="P1"  Part="1" 
AR Path="/5516C130/551747C1" Ref="P2"  Part="1" 
AR Path="/5516F760/551747C1" Ref="P3"  Part="1" 
AR Path="/5516F76C/551747C1" Ref="P4"  Part="1" 
AR Path="/55171938/551747C1" Ref="P6"  Part="1" 
AR Path="/55171944/551747C1" Ref="P7"  Part="1" 
AR Path="/55171950/551747C1" Ref="P8"  Part="1" 
AR Path="/5517195C/551747C1" Ref="P9"  Part="1" 
F 0 "P9" V 9000 3850 60  0000 C CNN
F 1 "CONN_20" V 9100 3850 60  0000 C CNN
F 2 "PIN_ARRAY_10X2" V 9300 3900 60  0000 C CNN
F 3 "" H 9050 3850 60  0000 C CNN
	1    9050 3850
	1    0    0    -1  
$EndComp
Text Label 7050 3600 0    60   ~ 0
GP0
Text Label 7050 3500 0    60   ~ 0
GP1
Text Label 7050 3400 0    60   ~ 0
GP2
Text Label 7050 3300 0    60   ~ 0
GP3
Text Label 7050 3200 0    60   ~ 0
GP4
Text Label 7050 3100 0    60   ~ 0
GP5
Text Label 7050 3000 0    60   ~ 0
GP6
Text Label 7050 2900 0    60   ~ 0
GP7
Text Label 7050 4700 0    60   ~ 0
GP8
Text Label 7050 4600 0    60   ~ 0
GP9
Text Label 7050 4500 0    60   ~ 0
GP10
Text Label 7050 4400 0    60   ~ 0
GP11
Text Label 7050 4300 0    60   ~ 0
GP12
Text Label 7050 4200 0    60   ~ 0
GP13
Text Label 7050 4100 0    60   ~ 0
GP14
Text Label 7050 4000 0    60   ~ 0
GP15
Text Label 8200 3000 0    60   ~ 0
GP8
Text Label 8200 2900 0    60   ~ 0
GP7
Text Label 8200 3200 0    60   ~ 0
GP9
Text Label 8200 3100 0    60   ~ 0
GP6
Text Label 8200 3300 0    60   ~ 0
GP5
Text Label 8200 3500 0    60   ~ 0
GP4
Text Label 8200 3400 0    60   ~ 0
GP10
Text Label 8200 3600 0    60   ~ 0
GP11
Text Label 8200 3800 0    60   ~ 0
GP12
Text Label 8200 4200 0    60   ~ 0
GP14
Text Label 8200 4000 0    60   ~ 0
GP13
Text Label 8200 4400 0    60   ~ 0
GP15
Text Label 8200 3700 0    60   ~ 0
GP3
Text Label 8200 3900 0    60   ~ 0
GP2
Text Label 8200 4100 0    60   ~ 0
GP1
Text Label 8200 4300 0    60   ~ 0
GP0
Wire Wire Line
	5150 2900 4200 2900
Wire Wire Line
	5150 3000 4200 3000
Wire Wire Line
	5150 3200 4200 3200
Wire Wire Line
	5150 3300 4200 3300
Wire Wire Line
	5150 3400 4200 3400
Wire Wire Line
	5150 3600 4200 3600
Wire Wire Line
	5700 2450 5700 2350
Wire Wire Line
	4200 2350 8550 2350
Wire Wire Line
	5650 5000 5650 5050
Wire Wire Line
	4200 5050 8550 5050
Wire Wire Line
	6250 2700 6350 2700
Wire Wire Line
	6350 2700 6350 2150
Wire Wire Line
	6350 2150 7250 2150
Wire Wire Line
	6250 2900 7450 2900
Wire Wire Line
	6250 4700 7450 4700
Wire Wire Line
	6250 4600 7450 4600
Wire Wire Line
	6250 4500 7450 4500
Wire Wire Line
	6250 4400 7450 4400
Wire Wire Line
	6250 4300 7450 4300
Wire Wire Line
	6250 4200 7450 4200
Wire Wire Line
	6250 4100 7450 4100
Wire Wire Line
	6250 4000 7450 4000
Connection ~ 5650 5050
Wire Wire Line
	7450 3600 6250 3600
Wire Wire Line
	6250 3500 7450 3500
Wire Wire Line
	6250 3400 7450 3400
Wire Wire Line
	6250 3300 7450 3300
Wire Wire Line
	6250 3200 7450 3200
Wire Wire Line
	6250 3100 7450 3100
Wire Wire Line
	6250 3000 7450 3000
Connection ~ 5700 2350
Wire Wire Line
	8700 2900 8100 2900
Wire Wire Line
	8100 3000 8700 3000
Wire Wire Line
	8100 3100 8700 3100
Wire Wire Line
	8100 3200 8700 3200
Wire Wire Line
	8700 3300 8100 3300
Wire Wire Line
	8100 3400 8700 3400
Wire Wire Line
	8100 3500 8700 3500
Wire Wire Line
	8100 3600 8700 3600
Wire Wire Line
	8700 3700 8100 3700
Wire Wire Line
	8100 3800 8700 3800
Wire Wire Line
	8100 3900 8700 3900
Wire Wire Line
	8100 4000 8700 4000
Wire Wire Line
	8700 4100 8100 4100
Wire Wire Line
	8100 4200 8700 4200
Wire Wire Line
	8100 4300 8700 4300
Wire Wire Line
	8100 4400 8700 4400
Wire Wire Line
	8550 4700 8700 4700
Wire Wire Line
	8550 5050 8550 4700
Wire Wire Line
	8550 4800 8700 4800
Connection ~ 8550 4800
Wire Wire Line
	8200 4600 8700 4600
Wire Wire Line
	8550 2350 8550 4600
Wire Wire Line
	8550 4500 8700 4500
Connection ~ 8550 4500
NoConn ~ 6250 3800
$Comp
L Device:C C1
U 1 1 5539308F
P 8200 4850
AR Path="/5516A155/5539308F" Ref="C1"  Part="1" 
AR Path="/5516C130/5539308F" Ref="C2"  Part="1" 
AR Path="/5516F760/5539308F" Ref="C3"  Part="1" 
AR Path="/5516F76C/5539308F" Ref="C4"  Part="1" 
AR Path="/55171938/5539308F" Ref="C5"  Part="1" 
AR Path="/55171944/5539308F" Ref="C6"  Part="1" 
AR Path="/55171950/5539308F" Ref="C7"  Part="1" 
AR Path="/5517195C/5539308F" Ref="C8"  Part="1" 
F 0 "C8" H 8225 4950 50  0000 L CNN
F 1 "C" H 8225 4750 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W3.5_P5" H 8238 4700 30  0000 C CNN
F 3 "" H 8200 4850 60  0000 C CNN
	1    8200 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4700 8200 4600
Connection ~ 8550 4600
Wire Wire Line
	8200 5000 8200 5050
Connection ~ 8200 5050
$EndSCHEMATC
