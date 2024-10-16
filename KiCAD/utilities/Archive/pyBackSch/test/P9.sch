EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:memory
LIBS:beaglebone
LIBS:DougsSch
LIBS:BBB-GVS-V2-cache
EELAYER 27 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 2 4
Title "BeagleBone Cape Baseline"
Date "28 jun 2014"
Rev "X1"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 12700 7750 0    60   ~ 0
A0
Text Label 12900 7750 0    60   ~ 0
A1
Text Label 13100 7750 0    60   ~ 0
A2
$Comp
L GND #PWR01
U 1 1 4EB9CD38
P 13900 8700
F 0 "#PWR01" H 13900 8700 30  0001 C CNN
F 1 "GND" H 13900 8630 30  0001 C CNN
F 2 "" H 13900 8700 60  0001 C CNN
F 3 "" H 13900 8700 60  0001 C CNN
	1    13900 8700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 4EB9CBD3
P 12400 7800
F 0 "#PWR02" H 12400 7800 30  0001 C CNN
F 1 "GND" H 12400 7730 30  0001 C CNN
F 2 "" H 12400 7800 60  0001 C CNN
F 3 "" H 12400 7800 60  0001 C CNN
	1    12400 7800
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4EB9CBCB
P 12400 7450
F 0 "C1" H 12450 7550 50  0000 L CNN
F 1 "u1" H 12450 7350 50  0000 L CNN
F 2 "SM0805" H 12400 7450 60  0001 C CNN
F 3 "" H 12400 7450 60  0001 C CNN
	1    12400 7450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 4EB9CB8D
P 12850 9050
F 0 "#PWR03" H 12850 9050 30  0001 C CNN
F 1 "GND" H 12850 8980 30  0001 C CNN
F 2 "" H 12850 9050 60  0001 C CNN
F 3 "" H 12850 9050 60  0001 C CNN
	1    12850 9050
	1    0    0    -1  
$EndComp
$Comp
L CONN_2X2 J1
U 1 1 4EB9CB6C
P 12850 8450
F 0 "J1" H 12850 8600 50  0000 C CNN
F 1 "ADR SEL" H 12860 8320 40  0000 C CNN
F 2 "PIN_ARRAY_2X2" H 12850 8450 60  0001 C CNN
F 3 "" H 12850 8450 60  0001 C CNN
	1    12850 8450
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 53A87176
P 12700 7400
F 0 "R5" V 12780 7400 50  0000 C CNN
F 1 "5.6K" V 12700 7400 50  0000 C CNN
F 2 "SM0805" H 12700 7400 60  0001 C CNN
F 3 "" H 12700 7400 60  0001 C CNN
	1    12700 7400
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 4EB9CB39
P 12900 7400
F 0 "R4" V 12980 7400 50  0000 C CNN
F 1 "5.6K" V 12900 7400 50  0000 C CNN
F 2 "SM0805" H 12900 7400 60  0001 C CNN
F 3 "" H 12900 7400 60  0001 C CNN
	1    12900 7400
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 53A87174
P 13100 7400
F 0 "R3" V 13180 7400 50  0000 C CNN
F 1 "5.6K" V 13100 7400 50  0000 C CNN
F 2 "SM0805" H 13100 7400 60  0001 C CNN
F 3 "" H 13100 7400 60  0001 C CNN
	1    13100 7400
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4EB9CACE
P 14800 7400
F 0 "R2" V 14880 7400 50  0000 C CNN
F 1 "5.6K" V 14800 7400 50  0000 C CNN
F 2 "SM0805" H 14800 7400 60  0001 C CNN
F 3 "" H 14800 7400 60  0001 C CNN
	1    14800 7400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4EB9CAC9
P 15000 7400
F 0 "R1" V 15080 7400 50  0000 C CNN
F 1 "5.6K" V 15000 7400 50  0000 C CNN
F 2 "SM0805" H 15000 7400 60  0001 C CNN
F 3 "" H 15000 7400 60  0001 C CNN
	1    15000 7400
	1    0    0    -1  
$EndComp
Text Label 14100 7050 0    60   ~ 0
VDD_3V3EXP
Text Label 15050 8250 0    60   ~ 0
I2C2_SDA
Text Label 15050 8150 0    60   ~ 0
I2C2_SCL
Text Label 1100 3150 0    60   ~ 0
CLKOUT2
Text Label 1100 3050 0    60   ~ 0
AIN0
Text Label 1100 2950 0    60   ~ 0
AIN2
Text Label 1100 2850 0    60   ~ 0
AIN6
Text Label 1100 2750 0    60   ~ 0
AIN4
Text Label 1100 2650 0    60   ~ 0
SPI1_SCLK
Text Label 1100 2550 0    60   ~ 0
SPI1_D0
Text Label 1100 2450 0    60   ~ 0
GPIO3_19
Text Label 1100 2350 0    60   ~ 0
GPIO3_21
Text Label 1100 2250 0    60   ~ 0
GPIO1_17
Text Label 1100 2150 0    60   ~ 0
UART2_TXD
Text Label 1100 2050 0    60   ~ 0
I2C2_SCL
Text Label 1100 1950 0    60   ~ 0
I2C1_SCL
Text Label 1100 1850 0    60   ~ 0
GPIO1_16
Text Label 1100 1750 0    60   ~ 0
UART4_TXD
Text Label 1100 1650 0    60   ~ 0
UART4_RXD
Text Label 1100 1550 0    60   ~ 0
PWR_BUT
Text Label 1100 1450 0    60   ~ 0
SYS_5V
Text Label 1100 1350 0    60   ~ 0
VDD_5V-UF
Text Label 1100 3250 0    60   ~ 0
GND
Text Label 1100 3350 0    60   ~ 0
GND
Text Label 1100 1150 0    60   ~ 0
GND
Text Label 1100 1250 0    60   ~ 0
VDD_3V3EXP
Text Notes 13550 8900 0    60   ~ 0
I2C CONFIG EEPROM
Text Label 12600 1500 0    60   ~ 0
VDD_5V
Text Label 10200 1500 0    60   ~ 0
VDD_3V3EXP
$Comp
L CONN_3 J4
U 1 1 53A0B614
P 14850 1500
F 0 "J4" V 14800 1500 50  0000 C CNN
F 1 "CONN_3" V 14900 1500 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 14850 1700 60  0000 C CNN
F 3 "" H 14850 1500 60  0000 C CNN
	1    14850 1500
	1    0    0    1   
$EndComp
Text Notes 15000 1450 0    60   ~ 0
GPIO1_28\nVCC\nGND
$Comp
L CONN_3 J7
U 1 1 53A0B649
P 14850 1950
F 0 "J7" V 14800 1950 50  0000 C CNN
F 1 "CONN_3" V 14900 1950 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 14850 2150 60  0000 C CNN
F 3 "" H 14850 1950 60  0000 C CNN
	1    14850 1950
	1    0    0    1   
$EndComp
Text Label 10200 2000 0    60   ~ 0
GPIO1_16
Text Label 10200 4450 0    60   ~ 0
GPIO1_17
$Comp
L CONN_3 J5
U 1 1 53A0BE2F
P 14850 3500
F 0 "J5" V 14800 3500 50  0000 C CNN
F 1 "CONN_3" V 14900 3500 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 14850 3700 60  0000 C CNN
F 3 "" H 14850 3500 60  0000 C CNN
	1    14850 3500
	1    0    0    1   
$EndComp
Text Label 1100 5550 0    60   ~ 0
AIN0
Text Label 1100 5200 0    60   ~ 0
AIN2
Text Label 1100 4500 0    60   ~ 0
AIN6
Text Label 1100 4850 0    60   ~ 0
AIN4
Text Label 10200 1700 0    60   ~ 0
UART4_RXD
Text Label 10200 1900 0    60   ~ 0
UART4_TXD
$Comp
L CONN_4 J8
U 1 1 53A0DE62
P 14850 1000
F 0 "J8" V 14800 1000 50  0000 C CNN
F 1 "CONN_4" V 14900 1000 50  0000 C CNN
F 2 "PIN_ARRAY_4x1" H 14850 1250 60  0000 C CNN
F 3 "" H 14850 1000 60  0000 C CNN
	1    14850 1000
	1    0    0    1   
$EndComp
Text Label 12600 1700 0    60   ~ 0
U4RX
Text Label 12600 1900 0    60   ~ 0
U4TX
Text Label 12600 2000 0    60   ~ 0
GP116
Text Label 12600 4450 0    60   ~ 0
GP1_17
$Comp
L 24C512 U2
U 1 1 53A9AAC4
P 13900 8050
F 0 "U2" H 14050 8400 60  0000 C CNN
F 1 "CAT24C256" H 14250 7700 60  0000 C CNN
F 2 "SO8E" H 14100 7600 60  0000 C CNN
F 3 "" H 13900 8050 60  0000 C CNN
	1    13900 8050
	1    0    0    -1  
$EndComp
Text GLabel 1100 1250 0    60   UnSpc ~ 0
VDD_3V3EXP
Text GLabel 1100 1350 0    60   UnSpc ~ 0
VDD_5V-UF
Text GLabel 1100 3350 0    60   UnSpc ~ 0
GND
Text Label 1100 4400 0    60   ~ 0
VDD_ADC
$Comp
L CONN_3 J3
U 1 1 53AACBAD
P 2250 4400
F 0 "J3" V 2200 4400 50  0000 C CNN
F 1 "CONN_3" V 2300 4400 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 4250 60  0000 C CNN
F 3 "" H 2250 4400 60  0000 C CNN
	1    2250 4400
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 J10
U 1 1 53AACBB3
P 2250 4750
F 0 "J10" V 2200 4750 50  0000 C CNN
F 1 "CONN_3" V 2300 4750 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 4600 60  0000 C CNN
F 3 "" H 2250 4750 60  0000 C CNN
	1    2250 4750
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 J11
U 1 1 53AACBB9
P 2250 5100
F 0 "J11" V 2200 5100 50  0000 C CNN
F 1 "CONN_3" V 2300 5100 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 4950 60  0000 C CNN
F 3 "" H 2250 5100 60  0000 C CNN
	1    2250 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 J12
U 1 1 53AACBC9
P 2250 5450
F 0 "J12" V 2200 5450 50  0000 C CNN
F 1 "CONN_3" V 2300 5450 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 5350 60  0000 C CNN
F 3 "" H 2250 5450 60  0000 C CNN
	1    2250 5450
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 53AAD570
P 2600 7500
F 0 "F1" H 2700 7550 40  0000 C CNN
F 1 "FUSE" H 2500 7450 40  0000 C CNN
F 2 "SM1206" H 2600 7350 60  0000 C CNN
F 3 "~" H 2600 7500 60  0000 C CNN
	1    2600 7500
	1    0    0    -1  
$EndComp
Text Label 2950 7500 0    60   ~ 0
VDD_5V-UF
Text Label 1950 7500 0    60   ~ 0
VDD_5V
Text GLabel 1850 7500 0    60   UnSpc ~ 0
VDD_5V
$Comp
L TXB0108 U1
U 1 1 53AC5523
P 11700 2050
F 0 "U1" H 11700 1950 50  0000 C CNN
F 1 "TXB0108EPWR" H 11700 2150 50  0000 C CNN
F 2 "SOG20" H 11700 2050 50  0000 C CNN
F 3 "DOCUMENTATION" H 11700 2050 50  0001 C CNN
	1    11700 2050
	1    0    0    -1  
$EndComp
Text Notes 15000 1900 0    60   ~ 0
GPIO1_16\nVCC\nGND
Text Notes 15000 2900 0    60   ~ 0
U2RX\nU2TX\nVCC\nGND
Text Label 12650 5350 0    60   ~ 0
GND
Text Label 10200 2200 0    60   ~ 0
I2C1_SDA
Text Label 12600 2200 0    60   ~ 0
I2C1SD
Text Label 10200 2100 0    60   ~ 0
I2C1_SCL
Text Label 12600 2100 0    60   ~ 0
I2C1CL
$Comp
L CONN_4 J28
U 1 1 53AC628B
P 14850 2400
F 0 "J28" V 14800 2400 50  0000 C CNN
F 1 "CONN_4" V 14900 2400 50  0000 C CNN
F 2 "PIN_ARRAY_4x1" H 14850 2700 60  0000 C CNN
F 3 "" H 14850 2400 60  0000 C CNN
	1    14850 2400
	1    0    0    1   
$EndComp
Text Label 3200 3150 0    60   ~ 0
GPIO0_7
Text Label 3200 3050 0    60   ~ 0
AIN1
Text Label 3200 2950 0    60   ~ 0
AIN3
Text Label 3200 2850 0    60   ~ 0
AIN5
Text Label 3200 2750 0    60   ~ 0
GNDA_ADC
Text Label 3200 2650 0    60   ~ 0
VDD_ADC
Text Label 3200 2550 0    60   ~ 0
SPI1_D1
Text Label 3200 2450 0    60   ~ 0
SPI1_CS0
Text Label 3200 2350 0    60   ~ 0
UART1_RXD
Text Label 3200 2250 0    60   ~ 0
UART1_TXD
Text Label 3200 2150 0    60   ~ 0
UART2_RXD
Text Label 3200 2050 0    60   ~ 0
I2C2_SDA
Text Label 3200 1950 0    60   ~ 0
I2C1_SDA
Text Label 3200 1850 0    60   ~ 0
EHRPWM1B
Text Label 3200 1750 0    60   ~ 0
EHRPWM1A
Text Label 3200 1650 0    60   ~ 0
GPIO1_28
Text Label 3200 1450 0    60   ~ 0
SYS_5V
Text Label 3200 1350 0    60   ~ 0
VDD_5V-UF
Text Label 3200 1250 0    60   ~ 0
VDD_3V3EXP
Text Label 3200 1150 0    60   ~ 0
GND
Text Label 3200 3250 0    60   ~ 0
GND
Text Label 3200 3350 0    60   ~ 0
GND
Text Label 3200 1550 0    60   ~ 0
SYS_RESETn
Text Label 1100 6600 0    60   ~ 0
AIN1
Text Label 1100 6250 0    60   ~ 0
AIN3
Text Label 1100 5900 0    60   ~ 0
AIN5
Text Label 1100 6400 0    60   ~ 0
GNDA_ADC
Text GLabel 3150 1250 0    60   UnSpc ~ 0
VDD_3V3EXP
Text GLabel 3150 3350 0    60   UnSpc ~ 0
GND
Text GLabel 3150 1350 0    60   UnSpc ~ 0
VDD_5V-UF
$Comp
L CONN_3 J2
U 1 1 53AC77E4
P 2250 5800
F 0 "J2" V 2200 5800 50  0000 C CNN
F 1 "CONN_3" V 2300 5800 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 5650 60  0000 C CNN
F 3 "" H 2250 5800 60  0000 C CNN
	1    2250 5800
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 J6
U 1 1 53AC77EA
P 2250 6150
F 0 "J6" V 2200 6150 50  0000 C CNN
F 1 "CONN_3" V 2300 6150 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2700 6000 60  0000 C CNN
F 3 "" H 2250 6150 60  0000 C CNN
	1    2250 6150
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 J9
U 1 1 53AC77F0
P 2250 6500
F 0 "J9" V 2200 6500 50  0000 C CNN
F 1 "CONN_3" V 2300 6500 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 2750 6350 60  0000 C CNN
F 3 "" H 2250 6500 60  0000 C CNN
	1    2250 6500
	1    0    0    -1  
$EndComp
Text Notes 1650 6850 0    60   ~ 0
ANALOG GVS SIGNALS
Text Notes 2050 7800 0    60   ~ 0
POWER PROTECTION FUSE
$Comp
L GND #PWR04
U 1 1 53AC797B
P 1450 3500
F 0 "#PWR04" H 1450 3500 30  0001 C CNN
F 1 "GND" H 1450 3430 30  0001 C CNN
F 2 "" H 1450 3500 60  0000 C CNN
F 3 "" H 1450 3500 60  0000 C CNN
	1    1450 3500
	1    0    0    -1  
$EndComp
Text Label 10200 1800 0    60   ~ 0
GPIO1_28
Text Label 12600 1800 0    60   ~ 0
GP1_28
Text Notes 15000 2300 0    60   ~ 0
I2C1_SCL\nI2C1_SDA\nVCC\nGND
Text Notes 15000 900  0    60   ~ 0
U4RX\nU4TX\nVCC\nGND
Text Label 10200 4950 0    60   ~ 0
SPI1_D0
$Comp
L TXB0108 U4
U 1 1 53ACAB04
P 11700 4800
F 0 "U4" H 11700 4700 50  0000 C CNN
F 1 "TXB0108EPWR" H 11700 4900 50  0000 C CNN
F 2 "SOG20" H 11700 4800 50  0000 C CNN
F 3 "DOCUMENTATION" H 11700 4800 50  0001 C CNN
	1    11700 4800
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 J31
U 1 1 53ACAF1B
P 14850 5100
F 0 "J31" V 14800 5100 60  0000 C CNN
F 1 "CONN_6" V 14900 5100 60  0000 C CNN
F 2 "PIN_ARRAY-6X1" H 14800 4750 60  0000 C CNN
F 3 "" H 14850 5100 60  0000 C CNN
	1    14850 5100
	1    0    0    -1  
$EndComp
Text Label 10200 4850 0    60   ~ 0
SPI1_CS0
Text Label 10200 5150 0    60   ~ 0
SPI1_SCLK
Text Label 10200 5050 0    60   ~ 0
SPI1_D1
$Comp
L BEAGLEBONE BRD1
U 4 1 53AD83F9
P 1950 2250
F 0 "BRD1" H 2100 950 60  0000 C CNN
F 1 "BEAGLEBONE" H 2250 850 60  0000 C CNN
F 2 "BEAGLEBONE" H 2250 750 60  0000 C CNN
F 3 "~" H 1950 2250 60  0000 C CNN
	4    1950 2250
	1    0    0    -1  
$EndComp
$Comp
L BEAGLEBONE BRD1
U 5 1 53AD8408
P 4200 2250
F 0 "BRD1" H 4350 950 60  0000 C CNN
F 1 "BEAGLEBONE" H 4500 850 60  0000 C CNN
F 2 "BEAGLEBONE" H 4550 750 60  0000 C CNN
F 3 "~" H 4200 2250 60  0000 C CNN
	5    4200 2250
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 53ADAC98
P 2250 9100
F 0 "C5" H 2250 9200 40  0000 L CNN
F 1 "104" H 2256 9015 40  0000 L CNN
F 2 "SM0805" H 2288 8950 30  0000 C CNN
F 3 "~" H 2250 9100 60  0000 C CNN
	1    2250 9100
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 53ADAE3E
P 2050 9100
F 0 "C4" H 2050 9200 40  0000 L CNN
F 1 "104" H 2056 9015 40  0000 L CNN
F 2 "SM0805" H 2088 8950 30  0000 C CNN
F 3 "~" H 2050 9100 60  0000 C CNN
	1    2050 9100
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 53ADAE4D
P 1850 9100
F 0 "C3" H 1850 9200 40  0000 L CNN
F 1 "104" H 1856 9015 40  0000 L CNN
F 2 "SM0805" H 1888 8950 30  0000 C CNN
F 3 "~" H 1850 9100 60  0000 C CNN
	1    1850 9100
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 53ADAE5C
P 1650 9100
F 0 "C2" H 1650 9200 40  0000 L CNN
F 1 "104" H 1656 9015 40  0000 L CNN
F 2 "SM0805" H 1688 8950 30  0000 C CNN
F 3 "~" H 1650 9100 60  0000 C CNN
	1    1650 9100
	1    0    0    -1  
$EndComp
$Comp
L COUPON COUP2
U 1 1 53ADBC24
P 15800 9150
F 0 "COUP2" H 15700 9050 60  0000 C CNN
F 1 "COUPON" H 15750 9000 60  0000 C CNN
F 2 "REV_BLOCK" H 15800 9100 60  0000 C CNN
F 3 "~" H 15800 9150 60  0000 C CNN
	1    15800 9150
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 FID2
U 1 1 53ADBC33
P 15900 8750
F 0 "FID2" H 15980 8750 40  0000 L CNN
F 1 "CONN_1" H 15900 8805 30  0001 C CNN
F 2 "FIDUCIAL" H 15900 8700 60  0000 C CNN
F 3 "" H 15900 8750 60  0000 C CNN
	1    15900 8750
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 FID1
U 1 1 53ADBC42
P 15900 8600
F 0 "FID1" H 15980 8600 40  0000 L CNN
F 1 "CONN_1" H 15900 8655 30  0001 C CNN
F 2 "FIDUCIAL" H 15900 8550 60  0000 C CNN
F 3 "" H 15900 8600 60  0000 C CNN
	1    15900 8600
	1    0    0    -1  
$EndComp
$Comp
L COUPON COUP1
U 1 1 53ADBDEC
P 15250 9150
F 0 "COUP1" H 15150 9050 60  0000 C CNN
F 1 "COUPON" H 15200 9000 60  0000 C CNN
F 2 "REV_BLOCK" H 15250 9100 60  0000 C CNN
F 3 "~" H 15250 9150 60  0000 C CNN
	1    15250 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	12400 7050 15000 7050
Wire Wire Line
	13900 8700 13900 8550
Wire Wire Line
	14600 8250 15500 8250
Wire Wire Line
	12400 7650 12400 7800
Connection ~ 12850 8950
Wire Wire Line
	12850 8950 12850 9050
Connection ~ 12800 7850
Wire Wire Line
	12700 7650 12700 7850
Wire Wire Line
	12700 7850 13200 7850
Wire Wire Line
	13200 8050 13100 8050
Wire Wire Line
	13100 8050 13100 7650
Connection ~ 12900 7050
Wire Wire Line
	12900 7150 12900 7050
Connection ~ 14800 8150
Wire Wire Line
	14800 7650 14800 8150
Wire Wire Line
	1650 3150 1100 3150
Wire Wire Line
	1650 3250 1100 3250
Wire Wire Line
	1100 3350 1650 3350
Wire Wire Line
	1650 2950 1100 2950
Wire Wire Line
	1650 3050 1100 3050
Wire Wire Line
	1650 2850 1100 2850
Wire Wire Line
	1650 2750 1100 2750
Wire Wire Line
	1650 1950 1100 1950
Wire Wire Line
	1650 2050 1100 2050
Wire Wire Line
	1650 2250 1100 2250
Wire Wire Line
	1650 2150 1100 2150
Wire Wire Line
	1650 2550 1100 2550
Wire Wire Line
	1650 2650 1100 2650
Wire Wire Line
	1650 2450 1100 2450
Wire Wire Line
	1650 2350 1100 2350
Wire Wire Line
	1650 1550 1100 1550
Wire Wire Line
	1650 1650 1100 1650
Wire Wire Line
	1650 1850 1100 1850
Wire Wire Line
	1650 1750 1100 1750
Wire Wire Line
	1650 1350 1100 1350
Wire Wire Line
	1650 1450 1100 1450
Wire Wire Line
	1650 1250 1100 1250
Wire Wire Line
	1650 1150 1100 1150
Wire Wire Line
	15000 7650 15000 8250
Connection ~ 15000 8250
Wire Wire Line
	15000 7050 15000 7150
Wire Wire Line
	12700 7050 12700 7150
Wire Wire Line
	13100 7150 13100 7050
Connection ~ 13100 7050
Wire Wire Line
	12900 7950 13200 7950
Wire Wire Line
	12900 7650 12900 8050
Connection ~ 12900 7950
Wire Wire Line
	12800 8850 12800 8950
Wire Wire Line
	12800 8950 12900 8950
Wire Wire Line
	12900 8950 12900 8850
Wire Wire Line
	12400 7050 12400 7250
Connection ~ 12700 7050
Wire Wire Line
	14600 8150 15500 8150
Wire Wire Line
	14800 7150 14800 7050
Connection ~ 14800 7050
Wire Wire Line
	13900 7550 13900 7050
Connection ~ 13900 7050
Wire Wire Line
	950  4400 1900 4400
Wire Wire Line
	1800 5450 1900 5450
Wire Wire Line
	1800 4400 1800 6500
Connection ~ 1800 4400
Wire Wire Line
	1900 4750 1800 4750
Connection ~ 1800 4750
Wire Wire Line
	1900 5100 1800 5100
Connection ~ 1800 5100
Wire Wire Line
	1900 4300 1700 4300
Connection ~ 1700 5350
Wire Wire Line
	1700 5000 1900 5000
Connection ~ 1700 5000
Wire Wire Line
	1700 4300 1700 6400
Wire Wire Line
	1900 4650 1700 4650
Connection ~ 1700 4650
Wire Wire Line
	1900 4500 950  4500
Wire Wire Line
	1900 4850 950  4850
Wire Wire Line
	1900 5200 950  5200
Wire Wire Line
	1900 5550 950  5550
Wire Wire Line
	2850 7500 3600 7500
Wire Wire Line
	2350 7500 1850 7500
Wire Wire Line
	10100 1700 10950 1700
Wire Wire Line
	12450 1500 13800 1500
Wire Wire Line
	10100 1500 10950 1500
Wire Wire Line
	10950 2000 10100 2000
Wire Wire Line
	10950 1800 10100 1800
Wire Wire Line
	10950 2200 10100 2200
Wire Wire Line
	10950 2100 10100 2100
Wire Wire Line
	10950 2300 10100 2300
Wire Wire Line
	10850 2600 10950 2600
Wire Wire Line
	10950 1900 10100 1900
Wire Wire Line
	13600 1700 12450 1700
Wire Wire Line
	13900 2300 12450 2300
Wire Wire Line
	14000 2200 12450 2200
Wire Wire Line
	14100 2100 12450 2100
Wire Wire Line
	12450 2000 14100 2000
Wire Wire Line
	13900 1800 12450 1800
Wire Wire Line
	14500 850  13600 850 
Wire Wire Line
	13600 850  13600 1700
Wire Wire Line
	3150 1150 3900 1150
Wire Wire Line
	3900 1250 3150 1250
Wire Wire Line
	3900 1450 3150 1450
Wire Wire Line
	3900 1350 3150 1350
Wire Wire Line
	3900 1750 3150 1750
Wire Wire Line
	3900 1850 3150 1850
Wire Wire Line
	3900 1650 3150 1650
Wire Wire Line
	3900 1550 3150 1550
Wire Wire Line
	3900 2350 3150 2350
Wire Wire Line
	3900 2450 3150 2450
Wire Wire Line
	3900 2650 3150 2650
Wire Wire Line
	3900 2550 3150 2550
Wire Wire Line
	3900 2150 3150 2150
Wire Wire Line
	3900 2250 3150 2250
Wire Wire Line
	3900 2050 3150 2050
Wire Wire Line
	3900 1950 3150 1950
Wire Wire Line
	3900 2750 3150 2750
Wire Wire Line
	3900 2850 3150 2850
Wire Wire Line
	3900 3050 3150 3050
Wire Wire Line
	3900 2950 3150 2950
Wire Wire Line
	3900 3350 3150 3350
Wire Wire Line
	3900 3250 3150 3250
Wire Wire Line
	3900 3150 3150 3150
Wire Wire Line
	1900 6600 950  6600
Wire Wire Line
	1800 6500 1900 6500
Wire Wire Line
	1900 6150 1800 6150
Connection ~ 1800 6150
Wire Wire Line
	950  6400 1900 6400
Connection ~ 1700 6400
Wire Wire Line
	1900 6050 1700 6050
Connection ~ 1700 6050
Wire Wire Line
	1900 6250 950  6250
Wire Wire Line
	1900 5900 950  5900
Wire Wire Line
	1900 5700 1700 5700
Connection ~ 1800 5800
Wire Wire Line
	1700 5350 1900 5350
Connection ~ 1700 5700
Connection ~ 1800 5450
Wire Wire Line
	1450 3350 1450 3500
Connection ~ 1450 3350
Wire Wire Line
	13700 1900 12450 1900
Wire Wire Line
	13900 1800 13900 1400
Wire Wire Line
	13900 1400 14500 1400
Wire Wire Line
	14100 2000 14100 1850
Wire Wire Line
	14100 1850 14500 1850
Wire Wire Line
	13700 1900 13700 950 
Wire Wire Line
	13700 950  14500 950 
Wire Wire Line
	14500 2250 14100 2250
Wire Wire Line
	14100 2250 14100 2100
Wire Wire Line
	14500 2350 14000 2350
Wire Wire Line
	14000 2350 14000 2200
Wire Wire Line
	14500 2850 13900 2850
Wire Wire Line
	13900 2850 13900 2300
Wire Wire Line
	14400 1150 14500 1150
Wire Wire Line
	14500 1600 14400 1600
Connection ~ 14400 1600
Wire Wire Line
	14400 2050 14500 2050
Connection ~ 14400 2050
Wire Wire Line
	14400 2550 14500 2550
Connection ~ 14400 2550
Connection ~ 14400 3150
Wire Wire Line
	14500 1500 14300 1500
Connection ~ 14300 1500
Wire Wire Line
	14300 1950 14500 1950
Connection ~ 14300 1950
Wire Wire Line
	14300 2450 14500 2450
Connection ~ 14300 2450
Wire Wire Line
	14300 3050 14500 3050
Connection ~ 14300 1050
Wire Wire Line
	13100 2600 12450 2600
Wire Wire Line
	1800 5800 1900 5800
Wire Wire Line
	10850 5350 10950 5350
Connection ~ 10850 2600
Wire Wire Line
	14400 1150 14400 5350
Wire Wire Line
	12450 5350 14500 5350
Wire Wire Line
	10850 1500 10850 5350
Connection ~ 10850 1500
Wire Wire Line
	12800 7850 12800 8050
Wire Wire Line
	14400 3150 14500 3150
Wire Wire Line
	14300 1050 14300 5250
Wire Wire Line
	14400 2700 13100 2700
Wire Wire Line
	13100 2700 13100 2600
Connection ~ 14400 2700
Wire Wire Line
	12450 4250 14300 4250
Connection ~ 14300 3050
Wire Wire Line
	10950 4850 10100 4850
Wire Wire Line
	10950 5050 10100 5050
Wire Wire Line
	10950 4950 10100 4950
Wire Wire Line
	10950 5150 10100 5150
Wire Wire Line
	2250 9450 2250 9300
Wire Wire Line
	1650 9300 1650 9450
Wire Wire Line
	1850 9300 1850 9450
Wire Wire Line
	2050 9450 2050 9300
Wire Wire Line
	2250 8750 2250 8900
Wire Wire Line
	1650 8750 1650 8900
Wire Wire Line
	1850 8750 1850 8900
Wire Wire Line
	2050 8750 2050 8900
Wire Wire Line
	1650 8750 2600 8750
Connection ~ 1850 8750
Connection ~ 2050 8750
Wire Wire Line
	1650 9450 3550 9450
Connection ~ 1850 9450
Connection ~ 2050 9450
Connection ~ 2250 9450
Connection ~ 2250 8750
Text Label 2350 9450 0    60   ~ 0
GND
Text Label 2350 8750 0    60   ~ 0
VDD_5V
Text Label 10200 2300 0    60   ~ 0
UART2_RXD
Text Label 10200 2400 0    60   ~ 0
UART2_TXD
$Comp
L CONN_4 J39
U 1 1 53ADD20F
P 14850 3000
F 0 "J39" V 14800 3000 50  0000 C CNN
F 1 "CONN_4" V 14900 3000 50  0000 C CNN
F 2 "PIN_ARRAY_4x1" H 14850 3250 60  0000 C CNN
F 3 "" H 14850 3000 60  0000 C CNN
	1    14850 3000
	1    0    0    1   
$EndComp
Wire Wire Line
	12450 2400 13700 2400
Wire Wire Line
	13700 2400 13700 2950
Wire Wire Line
	13700 2950 14500 2950
Wire Wire Line
	10950 4450 10100 4450
Wire Wire Line
	10950 4650 10100 4650
Wire Wire Line
	10950 4550 10100 4550
Wire Wire Line
	10950 4750 10100 4750
Wire Wire Line
	10950 4250 10850 4250
Connection ~ 10850 4250
$Comp
L CONN_3 J40
U 1 1 53ADD5E4
P 14850 4450
F 0 "J40" V 14800 4450 50  0000 C CNN
F 1 "CONN_3" V 14900 4450 40  0000 C CNN
F 2 "PIN_ARRAY_3X1" H 14850 4650 60  0000 C CNN
F 3 "" H 14850 4450 60  0000 C CNN
	1    14850 4450
	1    0    0    1   
$EndComp
Wire Wire Line
	10100 2400 10950 2400
Text Label 12600 2400 0    60   ~ 0
U2TX
Text Label 12600 2300 0    60   ~ 0
U2RX
Wire Wire Line
	12450 4450 13000 4450
Wire Wire Line
	13000 4450 13000 3400
Wire Wire Line
	13000 3400 14500 3400
Wire Wire Line
	14500 3600 14400 3600
Connection ~ 14400 3600
Wire Wire Line
	14500 4100 14400 4100
Connection ~ 14400 4100
Wire Wire Line
	14500 4550 14400 4550
Wire Wire Line
	14500 4450 14300 4450
Wire Wire Line
	14500 4000 14300 4000
Connection ~ 14300 4000
Wire Wire Line
	14500 3500 14300 3500
Connection ~ 14300 3500
Wire Wire Line
	12450 4550 14000 4550
Wire Wire Line
	14000 4550 14000 3900
Wire Wire Line
	14000 3900 14500 3900
Wire Wire Line
	12450 4650 14200 4650
Wire Wire Line
	14200 4650 14200 4350
Wire Wire Line
	14200 4350 14500 4350
Text Label 10200 4550 0    60   ~ 0
UART1_TXD
Text Label 10200 4750 0    60   ~ 0
UART1_RXD
Text Label 10200 4650 0    60   ~ 0
GPIO3_21
Connection ~ 14400 5350
Wire Wire Line
	12450 4850 14500 4850
Wire Wire Line
	12450 4950 14500 4950
Wire Wire Line
	12450 5050 14500 5050
Wire Wire Line
	12450 5150 14500 5150
Text Label 12600 4550 0    60   ~ 0
U1TX
Text Label 12600 4650 0    60   ~ 0
GP3_21
Text Label 12600 4750 0    60   ~ 0
U1RX
Text Label 12600 4850 0    60   ~ 0
SP1CS
Text Label 12600 4950 0    60   ~ 0
SP1DO
Text Label 12600 5050 0    60   ~ 0
SP1DI
Text Label 12600 5150 0    60   ~ 0
SP1CK
Text Notes 15000 3450 0    60   ~ 0
GPIO1_17\nVCC\nGND
Connection ~ 14300 4450
Connection ~ 14400 4550
$Comp
L CONN_4 J41
U 1 1 53ADF44F
P 14850 3950
F 0 "J41" V 14800 3950 50  0000 C CNN
F 1 "CONN_4" V 14900 3950 50  0000 C CNN
F 2 "PIN_ARRAY_4x1" H 14850 4250 60  0000 C CNN
F 3 "" H 14850 3950 60  0000 C CNN
	1    14850 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	12450 4750 14100 4750
Wire Wire Line
	14100 4750 14100 3800
Wire Wire Line
	14100 3800 14500 3800
Wire Wire Line
	14300 5250 14500 5250
Connection ~ 14300 4250
Wire Wire Line
	13800 1050 14500 1050
Wire Wire Line
	13800 1500 13800 1050
Text Notes 15000 3850 0    60   ~ 0
U1RX\nU1TX\nVCC\nGND
Text Notes 15000 4400 0    60   ~ 0
GPIO3_21\nVCC\nGND
Text Notes 15000 4900 0    60   ~ 0
SP1CS\nSP1DO\nSP1DI\nSP1CK\nVCC\nGND
$Comp
L LED D1
U 1 1 53ADFF8D
P 3550 9150
F 0 "D1" H 3550 9250 50  0000 C CNN
F 1 "LED" H 3550 9050 50  0000 C CNN
F 2 "SM0805" H 3550 9350 60  0000 C CNN
F 3 "~" H 3550 9150 60  0000 C CNN
	1    3550 9150
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 53ADFF9C
P 3550 8550
F 0 "R6" V 3630 8550 40  0000 C CNN
F 1 "330" V 3557 8551 40  0000 C CNN
F 2 "SM0805" V 3480 8550 30  0000 C CNN
F 3 "~" H 3550 8550 30  0000 C CNN
	1    3550 8550
	1    0    0    -1  
$EndComp
Text Label 3700 8150 0    60   ~ 0
VDD_5V
Wire Wire Line
	3550 8300 3550 8150
Wire Wire Line
	3550 8150 4050 8150
Wire Wire Line
	3550 8800 3550 8950
Wire Wire Line
	3550 9450 3550 9350
$EndSCHEMATC
