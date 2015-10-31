EESchema Schematic File Version 2
LIBS:DougsSch
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:memory
LIBS:beaglebone
LIBS:linear
LIBS:BBB-GVS-2-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 6 6
Title "BeagleBone Cape Baseline"
Date "24 feb 2015"
Rev "X4"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2000 3250 0    60   ~ 0
CLKOUT2
Text Label 2000 3150 0    60   ~ 0
AIN0
Text Label 2000 3050 0    60   ~ 0
AIN2
Text Label 2000 2950 0    60   ~ 0
AIN6
Text Label 2000 2850 0    60   ~ 0
AIN4
Text Label 2000 2550 0    60   ~ 0
GPIO3_19
Text Label 2000 2350 0    60   ~ 0
GPIO1_17
Text Label 2000 2250 0    60   ~ 0
UART2_TXD
Text Label 2000 2150 0    60   ~ 0
I2C2_SCL
Text Label 2000 2050 0    60   ~ 0
I2C1_SCL
Text Label 2000 1950 0    60   ~ 0
GPIO1_16
Text Label 2000 1850 0    60   ~ 0
UART4_TXD
Text Label 2000 1750 0    60   ~ 0
UART4_RXD
Text Label 2000 1650 0    60   ~ 0
PWR_BUT
Text Label 2000 1550 0    60   ~ 0
SYS_5V
Text Label 2000 1450 0    60   ~ 0
VDD_5V-UF
Text Label 2000 3350 0    60   ~ 0
GND
Text Label 2000 3450 0    60   ~ 0
GND
Text Label 2050 1250 0    60   ~ 0
GND
Text GLabel 2000 1450 0    60   UnSpc ~ 0
VDD_5V-UF
Text GLabel 2000 3450 0    60   UnSpc ~ 0
GND
Text Label 2000 6850 0    60   ~ 0
GPIO0_7
Text Label 2000 6750 0    60   ~ 0
AIN1
Text Label 2000 6650 0    60   ~ 0
AIN3
Text Label 2000 6550 0    60   ~ 0
AIN5
Text Label 2000 6450 0    60   ~ 0
GNDA_ADC
Text Label 2000 6350 0    60   ~ 0
VDD_ADC
Text Label 2000 6250 0    60   ~ 0
SPI1_D1
Text Label 2000 6050 0    60   ~ 0
UART1_RXD
Text Label 2000 5950 0    60   ~ 0
UART1_TXD
Text Label 2000 5850 0    60   ~ 0
UART2_RXD
Text Label 2000 5750 0    60   ~ 0
I2C2_SDA
Text Label 2000 5650 0    60   ~ 0
I2C1_SDA
Text Label 2000 5550 0    60   ~ 0
EHRPWM1B
Text Label 2000 5450 0    60   ~ 0
EHRPWM1A
Text Label 2000 5350 0    60   ~ 0
GPIO1_28
Text Label 2000 5150 0    60   ~ 0
SYS_5V
Text Label 2000 5050 0    60   ~ 0
VDD_5V-UF
Text Label 2000 4850 0    60   ~ 0
GND
Text Label 2000 6950 0    60   ~ 0
GND
Text Label 2000 7050 0    60   ~ 0
GND
Text Label 2000 5250 0    60   ~ 0
SYS_RESETn
Text GLabel 1900 7050 0    60   UnSpc ~ 0
GND
Text GLabel 2000 1350 0    60   UnSpc ~ 0
VDD_3V3-UF
$Comp
L GND #U1
U 1 1 00000000
P 2350 3600
AR Path="/4EB0F8E9/00000000" Ref="#U1"  Part="1" 
AR Path="/54E536E4/00000000" Ref="#U4"  Part="1" 
F 0 "#U4" H 2350 3600 60  0001 C CNN
F 1 "~" H 2350 3600 60  0001 C CNN
F 2 "" H 2350 3600 60  0000 C CNN
F 3 "" H 2350 3600 60  0000 C CNN
	1    2350 3600
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 4 1 53AD83F9
P 2850 2350
AR Path="/4EB0F8E9/53AD83F9" Ref="BRD1"  Part="4" 
AR Path="/54E536E4/53AD83F9" Ref="BRD1"  Part="4" 
F 0 "BRD1" H 2950 850 60  0000 C CNN
F 1 "BEAGLEBONE" H 3100 950 60  0000 C CNN
F 2 "BEAGLEBONE" H 3100 1050 60  0000 C CNN
F 3 "~" H 2850 2350 60  0000 C CNN
	4    2850 2350
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 5 1 53BFD0D2
P 2950 5950
AR Path="/4EB0F8E9/53BFD0D2" Ref="BRD1"  Part="5" 
AR Path="/54E536E4/53BFD0D2" Ref="BRD1"  Part="5" 
F 0 "BRD1" H 3050 4450 60  0000 C CNN
F 1 "BEAGLEBONE" H 3200 4550 60  0000 C CNN
F 2 "BEAGLEBONE" H 3200 4650 60  0000 C CNN
F 3 "~" H 2950 5950 60  0000 C CNN
	5    2950 5950
	1    0    0    -1  
$EndComp
Text Label 2000 4950 0    60   ~ 0
VDD_3V3-UF
Text Label 2000 1350 0    60   ~ 0
VDD_3V3-UF
Wire Wire Line
	2550 3250 2000 3250
Wire Wire Line
	2550 3350 2000 3350
Wire Wire Line
	2000 3450 2550 3450
Wire Wire Line
	2550 3050 2000 3050
Wire Wire Line
	2550 3150 2000 3150
Wire Wire Line
	2550 2950 2000 2950
Wire Wire Line
	2550 2850 2000 2850
Wire Wire Line
	2550 2050 2000 2050
Wire Wire Line
	2550 2150 2000 2150
Wire Wire Line
	2550 2350 2000 2350
Wire Wire Line
	2550 2250 2000 2250
Wire Wire Line
	2550 2550 2000 2550
Wire Wire Line
	2550 1650 2000 1650
Wire Wire Line
	2550 1750 2000 1750
Wire Wire Line
	2550 1950 2000 1950
Wire Wire Line
	2550 1850 2000 1850
Wire Wire Line
	2550 1450 2000 1450
Wire Wire Line
	2550 1550 2000 1550
Wire Wire Line
	2550 1350 2000 1350
Wire Wire Line
	2550 1250 2000 1250
Wire Wire Line
	1900 4850 2650 4850
Wire Wire Line
	2650 4950 1900 4950
Wire Wire Line
	2650 5150 1900 5150
Wire Wire Line
	2650 5050 1900 5050
Wire Wire Line
	2650 5450 1900 5450
Wire Wire Line
	2650 5550 1900 5550
Wire Wire Line
	2650 5350 1900 5350
Wire Wire Line
	2650 5250 1900 5250
Wire Wire Line
	2650 6050 1900 6050
Wire Wire Line
	2650 6350 1900 6350
Wire Wire Line
	2650 6250 1900 6250
Wire Wire Line
	2650 5850 1900 5850
Wire Wire Line
	2650 5950 1900 5950
Wire Wire Line
	2650 5750 1900 5750
Wire Wire Line
	2650 5650 1900 5650
Wire Wire Line
	2650 6450 1900 6450
Wire Wire Line
	2650 6550 1900 6550
Wire Wire Line
	2650 6750 1900 6750
Wire Wire Line
	2650 6650 1900 6650
Wire Wire Line
	2650 7050 1900 7050
Wire Wire Line
	2650 6950 1900 6950
Wire Wire Line
	2650 6850 1900 6850
Wire Wire Line
	2350 3450 2350 3600
Connection ~ 2350 3450
NoConn ~ 2550 2450
NoConn ~ 2550 2650
NoConn ~ 2550 2750
Text GLabel 2000 3150 0    60   Input ~ 0
AIN0
Text GLabel 2000 3050 0    60   Input ~ 0
AIN2
Text GLabel 2000 2950 0    60   Input ~ 0
AIN6
Text GLabel 2000 2850 0    60   Input ~ 0
AIN4
Text GLabel 1900 6750 0    60   Input ~ 0
AIN1
Text GLabel 1900 6650 0    60   Input ~ 0
AIN3
Text GLabel 1900 6550 0    60   Input ~ 0
AIN5
Text GLabel 1900 6450 0    60   Input ~ 0
GNDA_ADC
Text GLabel 1900 6350 0    60   Input ~ 0
VDDA_ADC
Text GLabel 2000 1250 0    60   UnSpc ~ 0
GND
Text GLabel 2000 1550 0    60   UnSpc ~ 0
SYS_5V
NoConn ~ 2650 6150
Text Label 6100 5550 0    60   ~ 0
SPI1_D1
Text Label 6100 5350 0    60   ~ 0
UART1_RXD
Text Label 6100 5250 0    60   ~ 0
UART1_TXD
Text Label 6100 5150 0    60   ~ 0
UART2_RXD
Text Label 6100 5050 0    60   ~ 0
I2C2_SDA
Text Label 6100 4950 0    60   ~ 0
I2C1_SDA
Text Label 6100 4850 0    60   ~ 0
EHRPWM1B
Text Label 6100 4750 0    60   ~ 0
EHRPWM1A
Text Label 6100 4650 0    60   ~ 0
GPIO1_28
Wire Wire Line
	6750 4750 6000 4750
Wire Wire Line
	6750 4850 6000 4850
Wire Wire Line
	6750 4650 6000 4650
Wire Wire Line
	6750 5350 6000 5350
Wire Wire Line
	6750 5550 6000 5550
Wire Wire Line
	6750 5150 6000 5150
Wire Wire Line
	6750 5250 6000 5250
Wire Wire Line
	6750 5050 6000 5050
Wire Wire Line
	6750 4950 6000 4950
Text Label 6100 4300 0    60   ~ 0
CLKOUT2
Wire Wire Line
	6650 4300 6100 4300
Text Label 6200 4000 0    60   ~ 0
GPIO3_19
Text Label 6200 3800 0    60   ~ 0
GPIO1_17
Text Label 6200 3700 0    60   ~ 0
UART2_TXD
Text Label 6200 3600 0    60   ~ 0
I2C2_SCL
Text Label 6200 3500 0    60   ~ 0
I2C1_SCL
Text Label 6200 3400 0    60   ~ 0
GPIO1_16
Text Label 6200 3300 0    60   ~ 0
UART4_TXD
Text Label 6200 3200 0    60   ~ 0
UART4_RXD
Wire Wire Line
	6750 3500 6200 3500
Wire Wire Line
	6750 3600 6200 3600
Wire Wire Line
	6750 3800 6200 3800
Wire Wire Line
	6750 3700 6200 3700
Wire Wire Line
	6750 4000 6200 4000
Wire Wire Line
	6750 3200 6200 3200
Wire Wire Line
	6750 3400 6200 3400
Wire Wire Line
	6750 3300 6200 3300
$EndSCHEMATC
