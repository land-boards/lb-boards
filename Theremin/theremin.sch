EESchema Schematic File Version 2  date Sat 30 Jun 2012 01:42:57 PM EDT
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
LIBS:ThereminBoards
LIBS:theremin-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "30 jun 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L +5V #PWR?
U 1 1 4FEF37EE
P 3500 3500
F 0 "#PWR?" H 3500 3590 20  0001 C CNN
F 1 "+5V" H 3500 3590 30  0000 C CNN
	1    3500 3500
	1    0    0    -1  
$EndComp
Connection ~ 3750 4500
Wire Wire Line
	3750 4500 3750 3900
Wire Wire Line
	3750 3900 3850 3900
Wire Wire Line
	2700 4100 3850 4100
Wire Wire Line
	2700 4300 3850 4300
Connection ~ 3700 4500
Wire Wire Line
	2700 4500 3700 4500
Wire Wire Line
	3700 4500 3750 4500
Wire Wire Line
	3750 4500 3850 4500
Connection ~ 5900 2900
Wire Wire Line
	3850 3800 3700 3800
Wire Wire Line
	3700 2900 5900 2900
Wire Wire Line
	5900 2900 6100 2900
Connection ~ 5500 4000
Connection ~ 5500 4800
Wire Wire Line
	5500 4800 5500 4000
Wire Wire Line
	5500 4000 5500 3100
Wire Wire Line
	5100 4400 7500 4400
Wire Wire Line
	7500 4400 7500 3350
Wire Wire Line
	7500 3350 7650 3350
Wire Wire Line
	5100 4300 7400 4300
Wire Wire Line
	7400 4300 7400 3250
Connection ~ 5650 3800
Wire Wire Line
	5100 3800 5650 3800
Wire Wire Line
	5500 4000 5100 4000
Wire Wire Line
	5500 3100 6100 3100
Wire Wire Line
	5900 2900 5900 3550
Wire Wire Line
	5900 3550 7650 3550
Wire Wire Line
	9650 2850 9300 2850
Wire Wire Line
	7650 2850 7350 2850
Wire Wire Line
	9300 2950 9450 2950
Wire Wire Line
	9450 2950 9450 3050
Wire Wire Line
	9450 3050 9650 3050
Wire Wire Line
	5800 3650 7200 3650
Wire Wire Line
	7200 3650 7650 3650
Wire Wire Line
	6100 2800 5800 2800
Wire Wire Line
	6100 3200 5650 3200
Wire Wire Line
	5650 3200 5650 3800
Wire Wire Line
	5650 3800 5650 3900
Wire Wire Line
	5650 3900 5100 3900
Wire Wire Line
	7650 3150 7300 3150
Wire Wire Line
	7300 3150 7300 4200
Wire Wire Line
	7300 4200 5100 4200
Wire Wire Line
	7400 3250 7650 3250
Wire Wire Line
	5800 2800 5800 3650
Wire Wire Line
	5800 3650 5800 4800
Wire Wire Line
	5800 4800 5500 4800
Wire Wire Line
	5500 4800 3700 4800
Wire Wire Line
	3700 4800 3700 4500
Connection ~ 5800 3650
Wire Wire Line
	7650 2950 7200 2950
Wire Wire Line
	7200 2950 7200 3650
Connection ~ 7200 3650
Wire Wire Line
	3700 3800 3700 2900
Wire Wire Line
	3700 2900 3700 2600
Connection ~ 3700 2900
Wire Wire Line
	2700 4400 3850 4400
Wire Wire Line
	2700 4200 3850 4200
Wire Wire Line
	3850 4000 3500 4000
Wire Wire Line
	3500 4000 3500 3500
$Comp
L +12V #PWR?
U 1 1 4FEF37AB
P 3700 2600
F 0 "#PWR?" H 3700 2550 20  0001 C CNN
F 1 "+12V" H 3700 2700 30  0000 C CNN
	1    3700 2600
	1    0    0    -1  
$EndComp
$Comp
L HVPOT B1
U 1 1 4FEF3697
P 4500 4700
F 0 "B1" H 4500 5750 60  0000 C CNN
F 1 "HVPOT" H 4500 4750 60  0000 C CNN
	1    4500 4700
	1    0    0    -1  
$EndComp
$Comp
L SPEAKER SP1
U 1 1 4FEF3458
P 9950 2950
F 0 "SP1" H 9850 3200 70  0000 C CNN
F 1 "SPEAKER" H 9850 2700 70  0000 C CNN
	1    9950 2950
	1    0    0    -1  
$EndComp
$Comp
L XR2206 B2
U 1 1 4FEF3429
P 6700 2900
F 0 "B2" H 6750 3200 60  0000 C CNN
F 1 "XR2206" H 6850 2400 60  0000 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
$Comp
L AUDIOAMP386 B3
U 1 1 4FEF320E
P 8450 3200
F 0 "B3" H 8450 3750 60  0000 C CNN
F 1 "AUDIOAMP386" H 8550 2550 60  0000 C CNN
	1    8450 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
