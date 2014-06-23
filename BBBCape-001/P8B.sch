EESchema Schematic File Version 2  date 23/06/2014 17:07:57
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:regul
LIBS:memory
LIBS:beagleboneblack
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title "BeagleBone Cape Baseline"
Date "23 jun 2014"
Rev "0.1"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7750 4200 7100 4200
Wire Wire Line
	7750 4000 7100 4000
Wire Wire Line
	7750 3800 7100 3800
Wire Wire Line
	7750 3600 7100 3600
Wire Wire Line
	7750 3400 7100 3400
Wire Wire Line
	7750 3200 7100 3200
Wire Wire Line
	7750 3000 7100 3000
Wire Wire Line
	7750 2800 7100 2800
Wire Wire Line
	7750 2600 7100 2600
Wire Wire Line
	7750 2400 7100 2400
Wire Wire Line
	7750 2200 7100 2200
Wire Wire Line
	7750 2000 7100 2000
Wire Bus Line
	7000 1600 7000 4100
Wire Wire Line
	7750 2100 7100 2100
Wire Wire Line
	7750 2300 7100 2300
Wire Wire Line
	7750 2500 7100 2500
Wire Wire Line
	7750 2700 7100 2700
Wire Wire Line
	7750 2900 7100 2900
Wire Wire Line
	7750 3100 7100 3100
Wire Wire Line
	7750 3300 7100 3300
Wire Wire Line
	7750 3500 7100 3500
Wire Wire Line
	7750 3700 7100 3700
Wire Wire Line
	7750 3900 7100 3900
Wire Wire Line
	7750 4100 7100 4100
Text Label 7150 4200 0    60   ~ 0
GPIO2_7
Text Label 7150 4100 0    60   ~ 0
GPIO2_9
Text Label 7150 4000 0    60   ~ 0
GPIO2_11
Text Label 7150 3900 0    60   ~ 0
GPIO2_13
Text Label 7150 3800 0    60   ~ 0
UART5_RXD
Text Label 7150 3700 0    60   ~ 0
UART3_CTSN
Text Label 7150 3600 0    60   ~ 0
UART3_RTSN
Text Label 7150 3500 0    60   ~ 0
UART5_RTSN
Text Label 7150 3400 0    60   ~ 0
GPIO2_25
Text Label 7150 3300 0    60   ~ 0
GPIO2_24
Text Label 7150 3200 0    60   ~ 0
GPIO1_29
Text Label 7150 3100 0    60   ~ 0
GPIO1_1
Text Label 7150 3000 0    60   ~ 0
GPIO1_5
Text Label 7150 2900 0    60   ~ 0
GPIO1_31
Text Label 7150 2800 0    60   ~ 0
GPIO2_1
Text Label 7150 2700 0    60   ~ 0
GPIO1_14
Text Label 7150 2600 0    60   ~ 0
GPIO0_26
Text Label 7150 2500 0    60   ~ 0
GPIO1_12
Text Label 7150 2400 0    60   ~ 0
TIMER6
Text Label 7150 2300 0    60   ~ 0
TIMER7
Text Label 7150 2200 0    60   ~ 0
GPIO1_3
Text Label 7150 2100 0    60   ~ 0
GPIO1_7
Text Label 7150 2000 0    60   ~ 0
DGND_8
Entry Wire Line
	7000 4000 7100 4100
Entry Wire Line
	7000 4100 7100 4200
Entry Wire Line
	7000 3900 7100 4000
Entry Wire Line
	7000 3800 7100 3900
Entry Wire Line
	7000 3400 7100 3500
Entry Wire Line
	7000 3500 7100 3600
Entry Wire Line
	7000 3700 7100 3800
Entry Wire Line
	7000 3600 7100 3700
Entry Wire Line
	7000 2800 7100 2900
Entry Wire Line
	7000 2900 7100 3000
Entry Wire Line
	7000 2700 7100 2800
Entry Wire Line
	7000 2600 7100 2700
Entry Wire Line
	7000 3000 7100 3100
Entry Wire Line
	7000 3100 7100 3200
Entry Wire Line
	7000 3300 7100 3400
Entry Wire Line
	7000 3200 7100 3300
Entry Wire Line
	7000 2600 7100 2700
Entry Wire Line
	7000 2500 7100 2600
Entry Wire Line
	7000 2400 7100 2500
Entry Wire Line
	7000 2000 7100 2100
Entry Wire Line
	7000 2100 7100 2200
Entry Wire Line
	7000 2300 7100 2400
Entry Wire Line
	7000 2200 7100 2300
Entry Wire Line
	7000 1900 7100 2000
Wire Bus Line
	4650 1600 7000 1600
$Comp
L BEAGLEBONEBLACK U?
U 2 1 53A89930
P 8300 3050
F 0 "U?" H 8150 4300 60  0000 C CNN
F 1 "BEAGLEBONEBLACK" H 8350 1750 60  0000 C CNN
F 2 "~" H 8100 1800 60  0000 C CNN
F 3 "~" H 8100 1800 60  0000 C CNN
	2    8300 3050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
