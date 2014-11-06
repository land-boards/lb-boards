EESchema Schematic File Version 2  date 06/11/2014 09:08:10
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
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "6 nov 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L C C1
U 1 1 545B8010
P 3900 2150
F 0 "C1" H 3900 2250 40  0000 L CNN
F 1 "C" H 3906 2065 40  0000 L CNN
F 2 "~" H 3938 2000 30  0000 C CNN
F 3 "~" H 3900 2150 60  0000 C CNN
	1    3900 2150
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 545B801F
P 3900 2450
F 0 "L1" V 3850 2450 40  0000 C CNN
F 1 "INDUCTOR" V 4000 2450 40  0000 C CNN
F 2 "~" H 3900 2450 60  0000 C CNN
F 3 "~" H 3900 2450 60  0000 C CNN
	1    3900 2450
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 545B802C
P 5550 2150
F 0 "C3" H 5550 2250 40  0000 L CNN
F 1 "C" H 5556 2065 40  0000 L CNN
F 2 "~" H 5588 2000 30  0000 C CNN
F 3 "~" H 5550 2150 60  0000 C CNN
	1    5550 2150
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L2
U 1 1 545B8032
P 5550 2450
F 0 "L2" V 5500 2450 40  0000 C CNN
F 1 "INDUCTOR" V 5650 2450 40  0000 C CNN
F 2 "~" H 5550 2450 60  0000 C CNN
F 3 "~" H 5550 2450 60  0000 C CNN
	1    5550 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2150 5350 2150
Wire Wire Line
	4200 2450 4400 2450
Wire Wire Line
	4400 2450 4400 2150
Connection ~ 4400 2150
Wire Wire Line
	5250 2450 5050 2450
Wire Wire Line
	5050 2450 5050 2150
Connection ~ 5050 2150
Wire Wire Line
	3000 2150 3700 2150
Wire Wire Line
	3400 2150 3400 2450
Wire Wire Line
	3400 2450 3600 2450
Wire Wire Line
	5850 2450 6000 2450
Wire Wire Line
	6000 2450 6000 2150
Wire Wire Line
	5750 2150 6500 2150
Connection ~ 3400 2150
$Comp
L C C2
U 1 1 545B8064
P 4750 2550
F 0 "C2" H 4750 2650 40  0000 L CNN
F 1 "C" H 4756 2465 40  0000 L CNN
F 2 "~" H 4788 2400 30  0000 C CNN
F 3 "~" H 4750 2550 60  0000 C CNN
	1    4750 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4750 2350 4750 2150
Connection ~ 4750 2150
Wire Wire Line
	4750 2750 4750 3000
Wire Wire Line
	4750 3000 4500 3000
$Comp
L FUSE F1
U 1 1 545B808D
P 4250 3000
F 0 "F1" H 4350 3050 40  0000 C CNN
F 1 "FUSE" H 4150 2950 40  0000 C CNN
F 2 "~" H 4250 3000 60  0000 C CNN
F 3 "~" H 4250 3000 60  0000 C CNN
	1    4250 3000
	1    0    0    -1  
$EndComp
Connection ~ 6000 2150
Wire Wire Line
	4000 3000 3000 3000
$EndSCHEMATC
