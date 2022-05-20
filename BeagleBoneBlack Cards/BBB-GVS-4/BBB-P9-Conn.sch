EESchema Schematic File Version 2
LIBS:BBB-GVS-3-rescue
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:linear
LIBS:memory
LIBS:BBB-GVS-3-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 5 6
Title "BeagleBone Cape Baseline"
Date "24 feb 2015"
Rev "X4"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1650 3200 0    60   ~ 0
CLKOUT2
Text Label 1650 3100 0    60   ~ 0
AIN0
Text Label 1650 3000 0    60   ~ 0
AIN2
Text Label 1650 2900 0    60   ~ 0
AIN6
Text Label 1650 2800 0    60   ~ 0
AIN4
Text Label 1650 2500 0    60   ~ 0
GPIO3_19
Text Label 1650 2300 0    60   ~ 0
GPIO1_17
Text Label 1650 2200 0    60   ~ 0
UART2_TXD
Text Label 1650 2100 0    60   ~ 0
I2C2_SCL
Text Label 1650 2000 0    60   ~ 0
I2C1_SCL
Text Label 1650 1900 0    60   ~ 0
GPIO1_16
Text Label 1650 1800 0    60   ~ 0
UART4_TXD
Text Label 1650 1700 0    60   ~ 0
UART4_RXD
Text Label 1650 1600 0    60   ~ 0
PWR_BUT
Text Label 1650 1500 0    60   ~ 0
SYS_5V
Text Label 1650 1400 0    60   ~ 0
VDD_5V-UF
Text Label 1650 3300 0    60   ~ 0
GND
Text Label 1650 3400 0    60   ~ 0
GND
Text Label 1700 1200 0    60   ~ 0
GND
Text GLabel 1650 1400 0    60   UnSpc ~ 0
VDD_5V-UF
Text GLabel 1650 3400 0    60   UnSpc ~ 0
GND
Text Label 1650 6800 0    60   ~ 0
GPIO0_7
Text Label 1650 6700 0    60   ~ 0
AIN1
Text Label 1650 6600 0    60   ~ 0
AIN3
Text Label 1650 6500 0    60   ~ 0
AIN5
Text Label 1650 6400 0    60   ~ 0
GNDA_ADC
Text Label 1650 6300 0    60   ~ 0
VDD_ADC
Text Label 1650 6200 0    60   ~ 0
SPI1_D1
Text Label 1650 6000 0    60   ~ 0
UART1_RXD
Text Label 1650 5900 0    60   ~ 0
UART1_TXD
Text Label 1650 5800 0    60   ~ 0
UART2_RXD
Text Label 1650 5700 0    60   ~ 0
I2C2_SDA
Text Label 1650 5600 0    60   ~ 0
I2C1_SDA
Text Label 1650 5500 0    60   ~ 0
EHRPWM1B
Text Label 1650 5400 0    60   ~ 0
EHRPWM1A
Text Label 1650 5300 0    60   ~ 0
GPIO1_28
Text Label 1650 5100 0    60   ~ 0
SYS_5V
Text Label 1650 5000 0    60   ~ 0
VDD_5V-UF
Text Label 1650 4800 0    60   ~ 0
GND
Text Label 1650 6900 0    60   ~ 0
GND
Text Label 1650 7000 0    60   ~ 0
GND
Text Label 1650 5200 0    60   ~ 0
SYS_RESETn
Text GLabel 1550 7000 0    60   UnSpc ~ 0
GND
Text GLabel 1650 1300 0    60   UnSpc ~ 0
VDD_3V3-UF
$Comp
L GND-RESCUE-BBB-GVS-3 #U07
U 1 1 00000000
P 2000 3550
F 0 "#U07" H 2000 3550 60  0001 C CNN
F 1 "~" H 2000 3550 60  0001 C CNN
F 2 "" H 2000 3550 60  0000 C CNN
F 3 "" H 2000 3550 60  0000 C CNN
	1    2000 3550
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 4 1 53AD83F9
P 2500 2300
F 0 "BRD1" H 2600 800 60  0000 C CNN
F 1 "BEAGLEBONE" H 2750 900 60  0000 C CNN
F 2 "dougsLib:BEAGLEBONE" H 2750 1000 60  0000 C CNN
F 3 "~" H 2500 2300 60  0000 C CNN
	4    2500 2300
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 5 1 53BFD0D2
P 2600 5900
F 0 "BRD1" H 2700 4400 60  0000 C CNN
F 1 "BEAGLEBONE" H 2850 4500 60  0000 C CNN
F 2 "dougsLib:BEAGLEBONE" H 2850 4600 60  0000 C CNN
F 3 "~" H 2600 5900 60  0000 C CNN
	5    2600 5900
	1    0    0    -1  
$EndComp
Text Label 1650 4900 0    60   ~ 0
VDD_3V3-UF
Text Label 1650 1300 0    60   ~ 0
VDD_3V3-UF
NoConn ~ 2200 2400
NoConn ~ 2200 2600
NoConn ~ 2200 2700
Text GLabel 1650 3100 0    60   Input ~ 0
AIN0
Text GLabel 1650 3000 0    60   Input ~ 0
AIN2
Text GLabel 1650 2900 0    60   Input ~ 0
AIN6
Text GLabel 1650 2800 0    60   Input ~ 0
AIN4
Text GLabel 1550 6700 0    60   Input ~ 0
AIN1
Text GLabel 1550 6600 0    60   Input ~ 0
AIN3
Text GLabel 1550 6500 0    60   Input ~ 0
AIN5
Text GLabel 1550 6400 0    60   Input ~ 0
GNDA_ADC
Text GLabel 1550 6300 0    60   Input ~ 0
VDD_ADC
Text GLabel 1650 1200 0    60   UnSpc ~ 0
GND
Text GLabel 1650 1500 0    60   UnSpc ~ 0
SYS_5V
NoConn ~ 2300 6100
Text Label 5600 6150 0    60   ~ 0
SPI1_D1
Text Label 5600 5150 0    60   ~ 0
UART1_RXD
Text Label 5600 5050 0    60   ~ 0
UART1_TXD
Text Label 5600 3950 0    60   ~ 0
UART2_RXD
Text Label 5600 3450 0    60   ~ 0
I2C1_SDA
Text Label 5600 1750 0    60   ~ 0
EHRPWM1A
Text Label 5600 1250 0    60   ~ 0
GPIO1_28
Text Label 5600 5650 0    60   ~ 0
GPIO3_19
Text Label 5600 4550 0    60   ~ 0
GPIO1_17
Text Label 5600 4050 0    60   ~ 0
UART2_TXD
Text Label 5600 3350 0    60   ~ 0
I2C1_SCL
Text Label 5600 2850 0    60   ~ 0
GPIO1_16
Text Label 5600 2350 0    60   ~ 0
UART4_TXD
Text Label 5600 2250 0    60   ~ 0
UART4_RXD
Text GLabel 1550 5700 0    60   Output ~ 0
I2C2_SDA
Text GLabel 1650 2100 0    60   Output ~ 0
I2C2_SCL
$Comp
L CONN_3 J7
U 1 1 5649C787
P 6950 2950
F 0 "J7" H 6950 2750 50  0000 C CNN
F 1 "CONN_3" V 7000 2950 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 3150 60  0000 C CNN
F 3 "" H 6950 2950 60  0000 C CNN
	1    6950 2950
	1    0    0    1   
$EndComp
$Comp
L CONN_3 J4
U 1 1 5649C7AF
P 6950 4650
F 0 "J4" H 6950 4450 50  0000 C CNN
F 1 "CONN_3" V 7000 4650 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 4850 60  0000 C CNN
F 3 "" H 6950 4650 60  0000 C CNN
	1    6950 4650
	1    0    0    1   
$EndComp
$Comp
L CONN_4 J8
U 1 1 5649C8AB
P 6950 2400
F 0 "J8" H 6950 2150 50  0000 C CNN
F 1 "CONN_4" V 7000 2400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 7500 2650 60  0000 C CNN
F 3 "" H 6950 2400 60  0000 C CNN
	1    6950 2400
	1    0    0    1   
$EndComp
$Comp
L CONN_4 J6
U 1 1 5649D0CB
P 6950 3500
F 0 "J6" H 6950 3250 50  0000 C CNN
F 1 "CONN_4" V 7000 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 7500 3750 60  0000 C CNN
F 3 "" H 6950 3500 60  0000 C CNN
	1    6950 3500
	1    0    0    1   
$EndComp
$Comp
L CONN_4 J5
U 1 1 5649D864
P 6950 4100
F 0 "J5" H 6950 3850 50  0000 C CNN
F 1 "CONN_4" V 7000 4100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 7500 4350 60  0000 C CNN
F 3 "" H 6950 4100 60  0000 C CNN
	1    6950 4100
	1    0    0    1   
$EndComp
$Comp
L CONN_3 J2
U 1 1 5649DAF0
P 6950 5750
F 0 "J2" H 6950 5550 50  0000 C CNN
F 1 "CONN_3" V 7000 5750 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 5950 60  0000 C CNN
F 3 "" H 6950 5750 60  0000 C CNN
	1    6950 5750
	1    0    0    1   
$EndComp
$Comp
L CONN_3 J10
U 1 1 5649DD9E
P 6950 1350
F 0 "J10" H 6950 1150 50  0000 C CNN
F 1 "CONN_3" V 7000 1350 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 1550 60  0000 C CNN
F 3 "" H 6950 1350 60  0000 C CNN
	1    6950 1350
	1    0    0    1   
$EndComp
$Comp
L CONN_3 J9
U 1 1 5649DE55
P 6950 1850
F 0 "J9" H 6950 1650 50  0000 C CNN
F 1 "CONN_3" V 7000 1850 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 2050 60  0000 C CNN
F 3 "" H 6950 1850 60  0000 C CNN
	1    6950 1850
	1    0    0    1   
$EndComp
$Comp
L CONN_4 J3
U 1 1 5649E2E2
P 6950 5200
F 0 "J3" H 6950 4950 50  0000 C CNN
F 1 "CONN_4" V 7000 5200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 7500 5450 60  0000 C CNN
F 3 "" H 6950 5200 60  0000 C CNN
	1    6950 5200
	1    0    0    1   
$EndComp
$Comp
L CONN_3 J1
U 1 1 5649E81D
P 6950 6250
F 0 "J1" H 6950 6050 50  0000 C CNN
F 1 "CONN_3" V 7000 6250 40  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 7500 6450 60  0000 C CNN
F 3 "" H 6950 6250 60  0000 C CNN
	1    6950 6250
	1    0    0    1   
$EndComp
Text GLabel 5800 900  0    60   UnSpc ~ 0
VDD_3V3EXP
Wire Wire Line
	2200 3200 1650 3200
Wire Wire Line
	2200 3300 1650 3300
Wire Wire Line
	1650 3400 2200 3400
Wire Wire Line
	2200 3000 1650 3000
Wire Wire Line
	2200 3100 1650 3100
Wire Wire Line
	2200 2900 1650 2900
Wire Wire Line
	2200 2800 1650 2800
Wire Wire Line
	2200 2000 1650 2000
Wire Wire Line
	2200 2100 1650 2100
Wire Wire Line
	2200 2300 1650 2300
Wire Wire Line
	2200 2200 1650 2200
Wire Wire Line
	2200 2500 1650 2500
Wire Wire Line
	2200 1600 1650 1600
Wire Wire Line
	2200 1700 1650 1700
Wire Wire Line
	2200 1900 1650 1900
Wire Wire Line
	2200 1800 1650 1800
Wire Wire Line
	2200 1400 1650 1400
Wire Wire Line
	2200 1500 1650 1500
Wire Wire Line
	2200 1300 1650 1300
Wire Wire Line
	2200 1200 1650 1200
Wire Wire Line
	1550 4800 2300 4800
Wire Wire Line
	2300 4900 1550 4900
Wire Wire Line
	2300 5100 1550 5100
Wire Wire Line
	2300 5000 1550 5000
Wire Wire Line
	2300 5400 1550 5400
Wire Wire Line
	2300 5500 1550 5500
Wire Wire Line
	2300 5300 1550 5300
Wire Wire Line
	2300 5200 1550 5200
Wire Wire Line
	2300 6000 1550 6000
Wire Wire Line
	2300 6300 1550 6300
Wire Wire Line
	2300 6200 1550 6200
Wire Wire Line
	2300 5800 1550 5800
Wire Wire Line
	2300 5900 1550 5900
Wire Wire Line
	2300 5700 1550 5700
Wire Wire Line
	2300 5600 1550 5600
Wire Wire Line
	2300 6400 1550 6400
Wire Wire Line
	2300 6500 1550 6500
Wire Wire Line
	2300 6700 1550 6700
Wire Wire Line
	2300 6600 1550 6600
Wire Wire Line
	2300 7000 1550 7000
Wire Wire Line
	2300 6900 1550 6900
Wire Wire Line
	2300 6800 1550 6800
Wire Wire Line
	2000 3400 2000 3550
Connection ~ 2000 3400
Wire Wire Line
	6600 2250 5550 2250
Wire Wire Line
	6600 2850 5550 2850
Wire Wire Line
	6600 2350 5550 2350
Wire Wire Line
	6600 3350 5550 3350
Wire Wire Line
	6600 3450 5550 3450
Wire Wire Line
	6600 3950 5550 3950
Wire Wire Line
	6600 4050 5550 4050
Wire Wire Line
	6600 4550 5550 4550
Wire Wire Line
	6600 5650 5550 5650
Wire Wire Line
	6600 1250 5550 1250
Wire Wire Line
	6600 1750 5550 1750
Wire Wire Line
	6600 5050 5550 5050
Wire Wire Line
	6600 5150 5550 5150
Wire Wire Line
	6600 6150 5550 6150
Wire Wire Line
	5800 900  6400 900 
Wire Wire Line
	6600 1450 6500 1450
Wire Wire Line
	6500 1450 6500 6450
Wire Wire Line
	6600 6350 6500 6350
Connection ~ 6500 6350
Wire Wire Line
	6600 5850 6500 5850
Connection ~ 6500 5850
Wire Wire Line
	6400 6250 6600 6250
Wire Wire Line
	6600 1350 6400 1350
Connection ~ 6400 1350
Wire Wire Line
	6400 1850 6600 1850
Connection ~ 6400 1850
Wire Wire Line
	6600 1950 6500 1950
Connection ~ 6500 1950
Wire Wire Line
	6400 2450 6600 2450
Connection ~ 6400 2450
Wire Wire Line
	6600 2550 6500 2550
Connection ~ 6500 2550
Wire Wire Line
	6400 2950 6600 2950
Connection ~ 6400 2950
Wire Wire Line
	6600 3050 6500 3050
Connection ~ 6500 3050
Connection ~ 6400 3550
Wire Wire Line
	6600 3650 6500 3650
Connection ~ 6500 3650
Wire Wire Line
	6400 4150 6600 4150
Connection ~ 6400 4150
Wire Wire Line
	6600 4250 6500 4250
Connection ~ 6500 4250
Wire Wire Line
	6400 4650 6600 4650
Connection ~ 6400 4650
Wire Wire Line
	6600 4750 6500 4750
Connection ~ 6500 4750
Wire Wire Line
	6400 5250 6600 5250
Connection ~ 6400 5250
Wire Wire Line
	6600 5350 6500 5350
Connection ~ 6500 5350
Wire Wire Line
	6400 5750 6600 5750
Connection ~ 6400 5750
$Comp
L GND-RESCUE-BBB-GVS-3 #PWR08
U 1 1 564A33E0
P 6500 6450
F 0 "#PWR08" H 6500 6450 30  0001 C CNN
F 1 "GND" H 6500 6380 30  0001 C CNN
F 2 "" H 6500 6450 60  0000 C CNN
F 3 "" H 6500 6450 60  0000 C CNN
	1    6500 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 900  6400 6250
Wire Wire Line
	6400 3550 6600 3550
$EndSCHEMATC
