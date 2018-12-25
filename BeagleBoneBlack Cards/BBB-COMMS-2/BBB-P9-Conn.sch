EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:linear
LIBS:memory
LIBS:LandBoards_Semis
LIBS:LandBoards_Conns
LIBS:BBB-COMMS-2-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 4 4
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
L GND #U05
U 1 1 00000000
P 2000 3550
F 0 "#U05" H 2000 3550 60  0001 C CNN
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
Text Label 8800 2800 0    60   ~ 0
UART1_RXD
Text Label 8800 2900 0    60   ~ 0
UART1_TXD
Text Label 8800 2150 0    60   ~ 0
UART2_RXD
Text Label 8800 1600 0    60   ~ 0
I2C1_SDA
Text Label 8800 2250 0    60   ~ 0
UART2_TXD
Text Label 8800 1500 0    60   ~ 0
I2C1_SCL
Text Label 8800 950  0    60   ~ 0
UART4_TXD
Text Label 8800 850  0    60   ~ 0
UART4_RXD
Text GLabel 1550 5700 0    60   Output ~ 0
I2C2_SDA
Text GLabel 1650 2100 0    60   Output ~ 0
I2C2_SCL
Text GLabel 8650 1050 0    60   UnSpc ~ 0
VDD_3V3EXP
$Comp
L CONN_01X04 H9
U 1 1 593966AA
P 9750 1000
F 0 "H9" H 9750 1250 50  0000 C CNN
F 1 "CONN_01X04" V 9850 1000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 1350 30  0000 C CNN
F 3 "" H 9750 1000 60  0000 C CNN
	1    9750 1000
	1    0    0    1   
$EndComp
$Comp
L CONN_01X04 H6
U 1 1 59396800
P 9750 1650
F 0 "H6" H 9750 1900 50  0000 C CNN
F 1 "CONN_01X04" V 9850 1650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 2000 30  0000 C CNN
F 3 "" H 9750 1650 60  0000 C CNN
	1    9750 1650
	1    0    0    1   
$EndComp
$Comp
L CONN_01X04 H5
U 1 1 593968EC
P 9750 2300
F 0 "H5" H 9750 2550 50  0000 C CNN
F 1 "CONN_01X04" V 9850 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 2650 30  0000 C CNN
F 3 "" H 9750 2300 60  0000 C CNN
	1    9750 2300
	1    0    0    1   
$EndComp
$Comp
L CONN_01X04 H4
U 1 1 593968F2
P 9750 2950
F 0 "H4" H 9750 3200 50  0000 C CNN
F 1 "CONN_01X04" V 9850 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 3300 30  0000 C CNN
F 3 "" H 9750 2950 60  0000 C CNN
	1    9750 2950
	1    0    0    1   
$EndComp
$Comp
L GND #U06
U 1 1 59396957
P 9450 6050
F 0 "#U06" H 9450 6050 60  0001 C CNN
F 1 "~" H 9450 6050 60  0001 C CNN
F 2 "" H 9450 6050 60  0000 C CNN
F 3 "" H 9450 6050 60  0000 C CNN
	1    9450 6050
	1    0    0    -1  
$EndComp
Text Label 8800 1050 0    60   ~ 0
VDD_3V3-UF
Text Label 8800 3550 0    60   ~ 0
EHRPWM1B
Text Label 8800 3450 0    60   ~ 0
GPIO1_16
$Comp
L CONN_01X04 H7
U 1 1 5939F2E0
P 9750 3600
F 0 "H7" H 9750 3850 50  0000 C CNN
F 1 "CONN_01X04" V 9850 3600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 3950 30  0000 C CNN
F 3 "" H 9750 3600 60  0000 C CNN
	1    9750 3600
	1    0    0    1   
$EndComp
Text Label 8800 4200 0    60   ~ 0
EHRPWM1A
$Comp
L CONN_01X04 H8
U 1 1 5939F8B4
P 9750 4250
F 0 "H8" H 9750 4500 50  0000 C CNN
F 1 "CONN_01X04" V 9850 4250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 4600 30  0000 C CNN
F 3 "" H 9750 4250 60  0000 C CNN
	1    9750 4250
	1    0    0    1   
$EndComp
Text Label 8800 4100 0    60   ~ 0
GPIO1_28
Wire Wire Line
	2200 3200 1650 3200
Wire Wire Line
	2200 3300 1650 3300
Wire Wire Line
	1650 3400 2200 3400
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
	9550 1150 9450 1150
Wire Wire Line
	9450 1150 9450 6050
Wire Wire Line
	9350 1050 9350 5500
Wire Wire Line
	9350 3000 9550 3000
Connection ~ 9350 1050
Wire Wire Line
	9450 3100 9550 3100
Connection ~ 9450 3100
Wire Wire Line
	9550 2450 9450 2450
Connection ~ 9450 2450
Wire Wire Line
	9550 1800 9450 1800
Connection ~ 9450 1800
Wire Wire Line
	9550 1700 9350 1700
Connection ~ 9350 1700
Wire Wire Line
	9550 2350 9350 2350
Connection ~ 9350 2350
Wire Wire Line
	8650 1050 9550 1050
Wire Wire Line
	9550 3450 8650 3450
Wire Wire Line
	9550 3550 8650 3550
Wire Wire Line
	9550 4100 8650 4100
Wire Wire Line
	9550 4200 8650 4200
Wire Wire Line
	9550 3750 9450 3750
Connection ~ 9450 3750
Wire Wire Line
	9550 4400 9450 4400
Connection ~ 9450 4400
Wire Wire Line
	9350 4300 9550 4300
Connection ~ 9350 3000
Wire Wire Line
	9550 3650 9350 3650
Connection ~ 9350 3650
Wire Wire Line
	9550 2800 8650 2800
Wire Wire Line
	9550 2900 8650 2900
Wire Wire Line
	9550 2150 8650 2150
Wire Wire Line
	9550 2250 8650 2250
Wire Wire Line
	9550 1500 8650 1500
Wire Wire Line
	9550 1600 8650 1600
Wire Wire Line
	9550 850  8650 850 
Wire Wire Line
	9550 950  8650 950 
$Comp
L CONN_01X04 H3
U 1 1 593A1A99
P 9750 4900
F 0 "H3" H 9750 5150 50  0000 C CNN
F 1 "CONN_01X04" V 9850 4900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9750 5250 30  0000 C CNN
F 3 "" H 9750 4900 60  0000 C CNN
	1    9750 4900
	1    0    0    1   
$EndComp
Wire Wire Line
	9550 4750 8650 4750
Wire Wire Line
	9550 4850 8650 4850
Text Label 8800 4750 0    60   ~ 0
GPIO1_17
Text Label 8800 4850 0    60   ~ 0
GPIO3_19
Wire Wire Line
	9550 5050 9450 5050
Connection ~ 9450 5050
Wire Wire Line
	9350 4950 9550 4950
Connection ~ 9350 4300
Wire Wire Line
	9350 5500 9550 5500
Connection ~ 9350 4950
Wire Wire Line
	9550 5600 9450 5600
Connection ~ 9450 5600
$Comp
L CONN_01X03 H2
U 1 1 593B6C7A
P 9750 5500
F 0 "H2" H 9750 5700 50  0000 C CNN
F 1 "CONN_01X03" V 9850 5500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 9750 5800 30  0000 C CNN
F 3 "" H 9750 5500 50  0000 C CNN
	1    9750 5500
	1    0    0    1   
$EndComp
NoConn ~ 9550 5400
$EndSCHEMATC
