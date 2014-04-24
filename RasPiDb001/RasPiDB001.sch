EESchema Schematic File Version 2
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
LIBS:GVSDuino-X3-cache
LIBS:OneWireLogger-cache
LIBS:RasPiDB001-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date "19 apr 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 6950 2350 1050 900 
U 53528B14
F0 "TxRx Transl" 50
F1 "RasPiDB001-01.sch" 50
F2 "+5V" U L 6950 2500 60 
F3 "+3.3V" U L 6950 2650 60 
F4 "PITX" I L 6950 2850 60 
F5 "PIRX" O L 6950 3050 60 
F6 "ARDRX" O R 8000 2850 60 
F7 "ARDTX" I R 8000 3050 60 
$EndSheet
$Sheet
S 8400 2350 1050 950 
U 53528EFF
F0 "Microprocessor" 50
F1 "RasPiDB001-02.sch" 50
F2 "ARDRX" I L 8400 2850 60 
F3 "ARDTX" O L 8400 3050 60 
F4 "+5V" U L 8400 2500 60 
F5 "GND" U L 8400 3200 60 
$EndSheet
Wire Wire Line
	8000 2850 8400 2850
Wire Wire Line
	8400 3050 8000 3050
Wire Wire Line
	8400 2500 8200 2500
Wire Wire Line
	8200 2500 8200 2000
Wire Wire Line
	8200 2000 6750 2000
Wire Wire Line
	6750 2000 6750 2500
Wire Wire Line
	6750 2500 6750 2550
Wire Wire Line
	6750 2500 6950 2500
$Comp
L CONN_13X2 P1
U 1 1 53529E25
P 5050 3150
F 0 "P1" H 5050 3850 60  0000 C CNN
F 1 "CONN_13X2" V 5050 3150 50  0000 C CNN
F 2 "pin_array_13x2" V 5100 3150 60  0000 C CNN
F 3 "" H 5050 3150 60  0000 C CNN
	1    5050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2550 4550 2550
Wire Wire Line
	4550 2550 4550 2350
Wire Wire Line
	6950 2650 6650 2650
Wire Wire Line
	6650 2650 6650 2350
Wire Wire Line
	6650 2350 4550 2350
Wire Wire Line
	6750 2550 5450 2550
Wire Wire Line
	5450 2850 6950 2850
Wire Wire Line
	5450 2950 6450 2950
Wire Wire Line
	6450 2950 6450 3050
Wire Wire Line
	6450 3050 6950 3050
Connection ~ 6750 2500
$Sheet
S 2200 2400 1100 950 
U 5352CB85
F0 "RTC" 50
F1 "RasPiDB001-03.sch" 50
$EndSheet
$EndSCHEMATC
