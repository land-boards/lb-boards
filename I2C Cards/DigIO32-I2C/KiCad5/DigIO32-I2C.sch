EESchema Schematic File Version 4
LIBS:DigIO32-I2C-cache
EELAYER 26 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "16-CHANNEL DIGITAL I/O"
Date "Thursday, May 14, 2015"
Rev "X3"
Comp "land-boards.com"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DigIO32-I2C-rescue:MTG_HOLE MTG4
U 1 1 537A5C77
P 11850 10300
F 0 "MTG4" H 11850 10400 60  0000 C CNN
F 1 "MTG_HOLE" H 11850 10200 60  0000 C CNN
F 2 "MTG-6-32" H 11850 10300 60  0000 C CNN
F 3 "~" H 11850 10300 60  0000 C CNN
	1    11850 10300
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:MTG_HOLE MTG3
U 1 1 537A5C86
P 11350 10300
F 0 "MTG3" H 11350 10400 60  0000 C CNN
F 1 "MTG_HOLE" H 11350 10200 60  0000 C CNN
F 2 "MTG-6-32" H 11350 10300 60  0000 C CNN
F 3 "~" H 11350 10300 60  0000 C CNN
	1    11350 10300
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:MTG_HOLE MTG2
U 1 1 537A5C95
P 11850 10000
F 0 "MTG2" H 11850 10100 60  0000 C CNN
F 1 "MTG_HOLE" H 11850 9900 60  0000 C CNN
F 2 "MTG-6-32" H 11850 10000 60  0000 C CNN
F 3 "~" H 11850 10000 60  0000 C CNN
	1    11850 10000
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:MTG_HOLE MTG1
U 1 1 537A5CA4
P 11350 10000
F 0 "MTG1" H 11350 10100 60  0000 C CNN
F 1 "MTG_HOLE" H 11350 9900 60  0000 C CNN
F 2 "MTG-6-32" H 11350 10000 60  0000 C CNN
F 3 "~" H 11350 10000 60  0000 C CNN
	1    11350 10000
	1    0    0    -1  
$EndComp
Text Notes 1800 3150 2    60   ~ 0
SCL\nSDA\nVCC\nGND
Text Label 3000 3050 0    60   ~ 0
VCC
Text Label 3000 3150 0    60   ~ 0
GND
Text Label 3000 2950 0    60   ~ 0
SDA
Text Label 3000 2850 0    60   ~ 0
SCL
Text Label 4150 3250 0    60   ~ 0
A1
Text Label 4150 3150 0    60   ~ 0
A2
$Comp
L power:GND #PWR01
U 1 1 539081BC
P 4900 10400
F 0 "#PWR01" H 4900 10400 30  0001 C CNN
F 1 "GND" H 4900 10330 30  0001 C CNN
F 2 "" H 4900 10400 60  0000 C CNN
F 3 "" H 4900 10400 60  0000 C CNN
	1    4900 10400
	1    0    0    -1  
$EndComp
Text Notes 2450 1950 2    60   ~ 0
GND\nVCC\nGND\nVCC\nGND
Text Notes 3750 1050 0    60   ~ 0
~CP\n~INT0\n~INT1\nGND
Text Notes 2350 1400 0    60   ~ 0
POWER
Text Notes 2450 2700 0    60   ~ 0
I2C
$Comp
L DigIO32-I2C-rescue:24C01 U3
U 1 1 5396141F
P 4900 9000
F 0 "U3" H 5050 9350 60  0000 C CNN
F 1 "24C01" H 5150 8550 60  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 4900 8450 20  0000 C CNN
F 3 "~" H 4900 9000 60  0000 C CNN
	1    4900 9000
	-1   0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:MCP23017P U1
U 1 1 5399A0BE
P 4950 3500
F 0 "U1" H 5100 4500 60  0000 C CNN
F 1 "MCP23017P" H 5200 2150 60  0000 C CNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 5200 2050 20  0000 C CNN
F 3 "~" H 4950 3500 60  0000 C CNN
	1    4950 3500
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:FUSE F1
U 1 1 5399AD9D
P 6250 1400
F 0 "F1" H 6350 1450 40  0000 C CNN
F 1 "FUSE" H 6150 1350 40  0000 C CNN
F 2 "SM1206" H 6250 1400 60  0000 C CNN
F 3 "~" H 6250 1400 60  0000 C CNN
	1    6250 1400
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:CONN_02X02-conn J6
U 1 1 553AD92A
P 2600 3750
F 0 "J6" H 2600 3900 50  0000 C CNN
F 1 "CONN_02X02" H 2600 3600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02" H 2400 3500 20  0000 C CNN
F 3 "" H 2600 2550 60  0000 C CNN
	1    2600 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 553ADCA8
P 1950 3700
F 0 "R6" V 2030 3700 50  0000 C CNN
F 1 "2.2K" V 1950 3700 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1880 3700 20  0000 C CNN
F 3 "" H 1950 3700 30  0000 C CNN
	1    1950 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 553ADDB1
P 1950 3900
F 0 "R5" V 2030 3900 50  0000 C CNN
F 1 "2.2K" V 1950 3900 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 1880 3900 20  0000 C CNN
F 3 "" H 1950 3900 30  0000 C CNN
	1    1950 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 553C09EA
P 5600 1750
F 0 "R7" V 5680 1750 50  0000 C CNN
F 1 "10K" V 5600 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5530 1750 20  0000 C CNN
F 3 "" H 5600 1750 30  0000 C CNN
	1    5600 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 553C21CF
P 3900 1800
F 0 "R2" V 3950 1600 50  0000 C CNN
F 1 "10K" V 3900 1800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3830 1800 20  0000 C CNN
F 3 "" H 3900 1800 30  0000 C CNN
	1    3900 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 553C2213
P 3800 1800
F 0 "R1" V 3850 1600 50  0000 C CNN
F 1 "10K" V 3800 1800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3730 1800 20  0000 C CNN
F 3 "" H 3800 1800 30  0000 C CNN
	1    3800 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 553C2255
P 3700 1800
F 0 "R3" V 3750 1600 50  0000 C CNN
F 1 "10K" V 3700 1800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3630 1800 20  0000 C CNN
F 3 "" H 3700 1800 30  0000 C CNN
	1    3700 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 553C3323
P 2800 8800
F 0 "R4" V 2880 8800 50  0000 C CNN
F 1 "1K" V 2800 8800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 2730 8800 20  0000 C CNN
F 3 "" H 2800 8800 30  0000 C CNN
	1    2800 8800
	0    1    1    0   
$EndComp
$Comp
L DigIO32-I2C-rescue:CONN_01X02-conn J5
U 1 1 553C4058
P 2800 9400
F 0 "J5" H 2800 9550 50  0000 C CNN
F 1 "CONN_01X02" V 2900 9400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2800 9150 20  0000 C CNN
F 3 "" H 2800 9400 60  0000 C CNN
	1    2800 9400
	-1   0    0    -1  
$EndComp
Text Label 5000 2050 0    60   ~ 0
INT1
NoConn ~ 5450 3750
Text Label 4100 3550 0    60   ~ 0
RST
Text Label 9100 3000 0    60   ~ 0
F5V
$Comp
L Device:C C1
U 1 1 553D2DDF
P 5700 9050
F 0 "C1" H 5725 9150 50  0000 L CNN
F 1 "0.1uF" H 5725 8950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 5800 8850 30  0000 C CNN
F 3 "" H 5700 9050 60  0000 C CNN
	1    5700 9050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 553D2EE6
P 6050 9050
F 0 "C2" H 6075 9150 50  0000 L CNN
F 1 "0.1uF" H 6075 8950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 6200 8900 30  0000 C CNN
F 3 "" H 6050 9050 60  0000 C CNN
	1    6050 9050
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:MCP23017P U2
U 1 1 580E4D4E
P 4900 6450
F 0 "U2" H 5050 7450 60  0000 C CNN
F 1 "MCP23017P" H 5150 5100 60  0000 C CNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 5150 5000 20  0000 C CNN
F 3 "~" H 4900 6450 60  0000 C CNN
	1    4900 6450
	1    0    0    -1  
$EndComp
$Comp
L DigIO32-I2C-rescue:DB37-conn P1
U 1 1 580E63D0
P 10000 4800
F 0 "P1" H 10100 6700 70  0000 C CNN
F 1 "DB37" H 9950 2850 70  0000 C CNN
F 2 "Connect:DB37FC" H 10000 2700 60  0000 C CNN
F 3 "" H 10000 4800 60  0000 C CNN
	1    10000 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 10300 3900 10000
Connection ~ 3900 10300
Wire Wire Line
	3800 10300 3800 10000
Connection ~ 3800 10300
Wire Wire Line
	3900 3250 4350 3250
Wire Wire Line
	3900 1950 3900 3250
Wire Wire Line
	4350 3150 3800 3150
Wire Wire Line
	2750 2850 3600 2850
Wire Wire Line
	2750 2950 3500 2950
Wire Wire Line
	2750 3150 3400 3150
Wire Wire Line
	3400 2550 3400 3150
Wire Wire Line
	3300 3050 2750 3050
Wire Wire Line
	3300 1400 3300 2450
Wire Wire Line
	4850 4950 4850 5050
Wire Wire Line
	4900 9600 4900 9950
Connection ~ 4900 10300
Wire Wire Line
	4900 1400 4900 2400
Connection ~ 3900 3250
Wire Wire Line
	3800 1950 3800 3150
Connection ~ 3800 3150
Wire Wire Line
	3700 1950 3700 3550
Wire Wire Line
	3700 3550 4350 3550
Wire Wire Line
	3200 2050 5600 2050
Wire Wire Line
	5600 2650 5450 2650
Wire Wire Line
	2150 2250 4250 2250
Wire Wire Line
	4250 2250 4250 2850
Connection ~ 4250 2850
Wire Wire Line
	2050 2350 4150 2350
Wire Wire Line
	4150 2350 4150 2950
Connection ~ 4150 2950
Wire Wire Line
	1950 2450 2900 2450
Connection ~ 3300 2450
Wire Wire Line
	1850 2550 3000 2550
Connection ~ 3400 3150
Wire Wire Line
	3150 10300 3400 10300
Wire Wire Line
	3000 750  3000 1050
Wire Wire Line
	3000 1950 2700 1950
Connection ~ 3000 2550
Wire Wire Line
	2700 1850 2900 1850
Wire Wire Line
	2900 1650 2900 1850
Connection ~ 2900 2450
Wire Wire Line
	2700 1750 3000 1750
Connection ~ 3000 1950
Wire Wire Line
	3400 1050 3000 1050
Connection ~ 3000 1750
Wire Wire Line
	3400 750  3000 750 
Connection ~ 3000 1050
Wire Wire Line
	4900 8250 4900 8500
Wire Wire Line
	2550 8250 3300 8250
Connection ~ 3300 3050
Wire Wire Line
	3600 8900 4200 8900
Wire Wire Line
	3600 2850 3600 3800
Connection ~ 3600 2850
Wire Wire Line
	3500 2950 3500 3700
Wire Wire Line
	3500 9000 4200 9000
Connection ~ 3500 2950
Wire Wire Line
	4200 9200 3900 9200
Connection ~ 3900 9200
Wire Wire Line
	4200 9100 3800 9100
Connection ~ 3800 9100
Wire Wire Line
	6500 1400 8950 1400
Wire Wire Line
	3200 2050 3200 950 
Wire Wire Line
	3200 950  3400 950 
Wire Wire Line
	2100 3700 2350 3700
Wire Wire Line
	2350 3800 2250 3800
Wire Wire Line
	2250 3800 2250 3900
Wire Wire Line
	2250 3900 2100 3900
Wire Wire Line
	1750 3900 1800 3900
Wire Wire Line
	1750 3500 1750 3700
Wire Wire Line
	1800 3700 1750 3700
Connection ~ 1750 3700
Wire Wire Line
	5600 1900 5600 2050
Connection ~ 5600 2050
Wire Wire Line
	3300 1400 3700 1400
Wire Wire Line
	5600 1400 5600 1600
Wire Wire Line
	3700 1650 3700 1400
Connection ~ 3700 1400
Wire Wire Line
	3800 1650 3800 1400
Connection ~ 3800 1400
Wire Wire Line
	3900 1650 3900 1400
Connection ~ 3900 1400
Wire Wire Line
	2950 8800 3150 8800
Wire Wire Line
	3150 8800 3150 9350
Connection ~ 3150 8800
Wire Wire Line
	2650 8800 2550 8800
Wire Wire Line
	2550 8800 2550 8250
Connection ~ 3300 8250
Wire Wire Line
	3150 9350 3000 9350
Wire Wire Line
	3000 9450 3150 9450
Wire Wire Line
	3150 9450 3150 10300
Connection ~ 3400 10300
Wire Wire Line
	2850 3800 3600 3800
Connection ~ 3600 3800
Wire Wire Line
	2850 3700 3500 3700
Connection ~ 3500 3700
Wire Wire Line
	5700 8250 5700 8900
Connection ~ 4900 8250
Wire Wire Line
	6050 8250 6050 8900
Connection ~ 5700 8250
Wire Wire Line
	6050 9950 6050 9200
Wire Wire Line
	4900 9950 5700 9950
Connection ~ 4900 9950
Wire Wire Line
	5700 9200 5700 9950
Connection ~ 5700 9950
Wire Wire Line
	1750 3500 3300 3500
Connection ~ 3300 3500
Wire Wire Line
	4800 7900 4800 8050
Wire Wire Line
	4800 8050 3400 8050
Connection ~ 3400 8050
Wire Wire Line
	4850 5050 3400 5050
Connection ~ 3400 5050
Wire Wire Line
	4850 5350 4850 5200
Wire Wire Line
	4850 5200 3300 5200
Connection ~ 3300 5200
Wire Wire Line
	5450 2850 7900 2850
Wire Wire Line
	7900 2850 7900 3200
Wire Wire Line
	7900 3200 9550 3200
Wire Wire Line
	5450 2950 7800 2950
Wire Wire Line
	7800 2950 7800 3400
Wire Wire Line
	7800 3400 9550 3400
Wire Wire Line
	5450 3050 7700 3050
Wire Wire Line
	7700 3050 7700 3600
Wire Wire Line
	7700 3600 9550 3600
Wire Wire Line
	5450 3150 7600 3150
Wire Wire Line
	7600 3150 7600 3800
Wire Wire Line
	7600 3800 9550 3800
Wire Wire Line
	9550 4000 7500 4000
Wire Wire Line
	7500 4000 7500 3250
Wire Wire Line
	7500 3250 5450 3250
Wire Wire Line
	9550 4200 7400 4200
Wire Wire Line
	7400 4200 7400 3350
Wire Wire Line
	7400 3350 5450 3350
Wire Wire Line
	5450 3450 7300 3450
Wire Wire Line
	7300 3450 7300 4400
Wire Wire Line
	7300 4400 9550 4400
Wire Wire Line
	5450 3550 7200 3550
Wire Wire Line
	7200 3550 7200 4600
Wire Wire Line
	7200 4600 9550 4600
Wire Wire Line
	5450 3950 6100 3950
Wire Wire Line
	6100 3950 6100 2750
Wire Wire Line
	6100 2750 8000 2750
Wire Wire Line
	8000 2750 8000 4700
Wire Wire Line
	8000 4700 9550 4700
Wire Wire Line
	5450 4050 6200 4050
Wire Wire Line
	6200 4050 6200 2650
Wire Wire Line
	6200 2650 8100 2650
Wire Wire Line
	8100 2650 8100 4500
Wire Wire Line
	8100 4500 9550 4500
Wire Wire Line
	5450 4150 6300 4150
Wire Wire Line
	6300 4150 6300 2550
Wire Wire Line
	6300 2550 8200 2550
Wire Wire Line
	8200 2550 8200 4300
Wire Wire Line
	8200 4300 9550 4300
Wire Wire Line
	5450 4250 6400 4250
Wire Wire Line
	6400 4250 6400 2450
Wire Wire Line
	6400 2450 8300 2450
Wire Wire Line
	8300 2450 8300 4100
Wire Wire Line
	8300 4100 9550 4100
Wire Wire Line
	5450 4350 6500 4350
Wire Wire Line
	6500 4350 6500 2350
Wire Wire Line
	6500 2350 8400 2350
Wire Wire Line
	8400 2350 8400 3900
Wire Wire Line
	8400 3900 9550 3900
Wire Wire Line
	8950 3100 9550 3100
Wire Wire Line
	8950 1400 8950 3000
Wire Wire Line
	9550 3000 8950 3000
Connection ~ 8950 3000
Wire Wire Line
	5450 4450 6600 4450
Wire Wire Line
	6600 4450 6600 2250
Wire Wire Line
	6600 2250 8500 2250
Wire Wire Line
	8500 2250 8500 3700
Wire Wire Line
	8500 3700 9550 3700
Wire Wire Line
	5450 4550 6700 4550
Wire Wire Line
	6700 4550 6700 2150
Wire Wire Line
	6700 2150 8600 2150
Wire Wire Line
	8600 2150 8600 3500
Wire Wire Line
	8600 3500 9550 3500
Wire Wire Line
	5450 4650 6800 4650
Wire Wire Line
	6800 4650 6800 2050
Wire Wire Line
	6800 2050 8700 2050
Wire Wire Line
	8700 2050 8700 3300
Wire Wire Line
	8700 3300 9550 3300
Wire Wire Line
	5400 5800 7150 5800
Wire Wire Line
	7150 5800 7150 4900
Wire Wire Line
	7150 4900 9550 4900
Wire Wire Line
	5400 5900 7250 5900
Wire Wire Line
	7250 5900 7250 5100
Wire Wire Line
	7250 5100 9550 5100
Wire Wire Line
	5400 6000 7350 6000
Wire Wire Line
	7350 6000 7350 5300
Wire Wire Line
	7350 5300 9550 5300
Wire Wire Line
	5400 6100 7450 6100
Wire Wire Line
	7450 6100 7450 5500
Wire Wire Line
	7450 5500 9550 5500
Wire Wire Line
	5400 6200 7550 6200
Wire Wire Line
	7550 6200 7550 5700
Wire Wire Line
	7550 5700 9550 5700
Wire Wire Line
	5400 6300 7650 6300
Wire Wire Line
	7650 6300 7650 5900
Wire Wire Line
	7650 5900 9550 5900
Wire Wire Line
	5400 6400 7750 6400
Wire Wire Line
	7750 6400 7750 6100
Wire Wire Line
	7750 6100 9550 6100
Wire Wire Line
	5400 6500 7850 6500
Wire Wire Line
	7850 6500 7850 6300
Wire Wire Line
	7850 6300 9550 6300
Wire Wire Line
	8000 5000 9550 5000
Wire Wire Line
	8100 5200 9550 5200
Wire Wire Line
	8200 5400 9550 5400
Wire Wire Line
	8300 5600 9550 5600
Wire Wire Line
	8400 5800 9550 5800
Wire Wire Line
	8500 6000 9550 6000
Wire Wire Line
	8600 6200 9550 6200
Wire Wire Line
	8700 6400 9550 6400
Wire Wire Line
	9550 6500 9350 6500
Wire Wire Line
	9350 6500 9350 6600
Wire Wire Line
	9550 6600 9350 6600
Connection ~ 9350 6600
$Comp
L power:GND #PWR02
U 1 1 580EB451
P 9350 6750
F 0 "#PWR02" H 9350 6750 30  0001 C CNN
F 1 "GND" H 9350 6680 30  0001 C CNN
F 2 "" H 9350 6750 60  0000 C CNN
F 3 "" H 9350 6750 60  0000 C CNN
	1    9350 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5800 3600 5800
Connection ~ 3600 5800
Wire Wire Line
	4300 5900 3500 5900
Connection ~ 3500 5900
Wire Wire Line
	4300 6100 3800 6100
Connection ~ 3800 6100
Wire Wire Line
	4300 6200 3900 6200
Connection ~ 3900 6200
Wire Wire Line
	4300 6300 3300 6300
Connection ~ 3300 6300
Wire Wire Line
	3700 6500 4300 6500
Connection ~ 3700 3550
Wire Wire Line
	5400 6900 8700 6900
Wire Wire Line
	8700 6900 8700 6400
Wire Wire Line
	5400 7000 8600 7000
Wire Wire Line
	8600 7000 8600 6200
Wire Wire Line
	5400 7100 8500 7100
Wire Wire Line
	8500 7100 8500 6000
Wire Wire Line
	5400 7200 8400 7200
Wire Wire Line
	8400 7200 8400 5800
Wire Wire Line
	5400 7300 8300 7300
Wire Wire Line
	8300 7300 8300 5600
Wire Wire Line
	5400 7400 8200 7400
Wire Wire Line
	8200 7400 8200 5400
Wire Wire Line
	5400 7500 8100 7500
Wire Wire Line
	8100 7500 8100 5200
Wire Wire Line
	5400 7600 8000 7600
Wire Wire Line
	8000 7600 8000 5000
$Comp
L DigIO32-I2C-rescue:CONN_02X02-conn J3
U 1 1 580EF093
P 3850 9750
F 0 "J3" H 3850 9900 50  0000 C CNN
F 1 "CONN_02X02" H 3850 9600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x02" V 3550 9350 20  0000 C CNN
F 3 "" H 3850 8550 60  0000 C CNN
	1    3850 9750
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 580F0555
P 5800 1750
F 0 "R8" V 5880 1750 50  0000 C CNN
F 1 "10K" V 5800 1750 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5730 1750 20  0000 C CNN
F 3 "" H 5800 1750 30  0000 C CNN
	1    5800 1750
	-1   0    0    1   
$EndComp
$Comp
L DigIO32-I2C-rescue:CONN_01X04-conn J4
U 1 1 580F09F7
P 3600 900
F 0 "J4" H 3600 1150 50  0000 C CNN
F 1 "CONN_01X04" V 3700 900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04" H 3600 650 20  0000 C CNN
F 3 "" H 3600 900 60  0000 C CNN
	1    3600 900 
	1    0    0    1   
$EndComp
Wire Wire Line
	5800 1400 5800 1600
Connection ~ 5600 1400
Wire Wire Line
	5800 1900 5800 2150
Wire Wire Line
	5800 5600 5400 5600
Wire Wire Line
	3100 2150 5800 2150
Wire Wire Line
	3100 2150 3100 850 
Wire Wire Line
	3100 850  3400 850 
Text Label 5000 2150 0    60   ~ 0
INT0
Connection ~ 4900 1400
Connection ~ 5800 1400
Connection ~ 5800 2150
$Comp
L DigIO32-I2C-rescue:CONN_02X04-conn J2
U 1 1 580F39C0
P 2500 3000
F 0 "J2" H 2500 3250 50  0000 C CNN
F 1 "CONN_02X04" H 2500 2750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x04" H 2500 2700 20  0000 C CNN
F 3 "" H 2500 1800 60  0000 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2550 1850 3150
Wire Wire Line
	1850 3150 2250 3150
Wire Wire Line
	1950 2450 1950 3050
Wire Wire Line
	1950 3050 2250 3050
Wire Wire Line
	2050 2350 2050 2950
Wire Wire Line
	2050 2950 2250 2950
Wire Wire Line
	2150 2250 2150 2850
Wire Wire Line
	2150 2850 2250 2850
$Comp
L DigIO32-I2C-rescue:CONN_01X05-conn J1
U 1 1 580F4DF3
P 2500 1750
F 0 "J1" H 2500 2050 50  0000 C CNN
F 1 "CONN_01X05" H 2500 1450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x05" H 2500 1400 20  0000 C CNN
F 3 "" H 2500 1750 60  0000 C CNN
	1    2500 1750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 1650 2900 1650
Connection ~ 2900 1850
Wire Wire Line
	2700 1550 3000 1550
Connection ~ 3000 1550
$Comp
L Device:C C3
U 1 1 580F6242
P 6450 9050
F 0 "C3" H 6475 9150 50  0000 L CNN
F 1 "0.1uF" H 6475 8950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L7_W2_P5" H 6600 8900 30  0000 C CNN
F 3 "" H 6450 9050 60  0000 C CNN
	1    6450 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 8250 6450 8900
Connection ~ 6050 8250
Wire Wire Line
	6450 9950 6450 9200
Connection ~ 6050 9950
$Comp
L Device:CP1_Small C4
U 1 1 580F56EB
P 6800 9050
F 0 "C4" H 6810 9120 50  0000 L CNN
F 1 "47uF" H 6810 8970 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2.5" H 6800 8850 20  0000 C CNN
F 3 "" H 6800 9050 60  0000 C CNN
	1    6800 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 8250 6800 8950
Connection ~ 6450 8250
Wire Wire Line
	6800 9950 6800 9150
Connection ~ 6450 9950
$Comp
L DigIO32-I2C-rescue:MTG_HOLE TESTED1
U 1 1 580F6225
P 10800 10000
F 0 "TESTED1" H 10800 10100 60  0000 C CNN
F 1 "TESTED_COUPON" H 10800 9900 60  0000 C CNN
F 2 "DougsNewMods:TEST_BLK-REAR" H 10800 10000 60  0000 C CNN
F 3 "~" H 10800 10000 60  0000 C CNN
	1    10800 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 9300 4100 9300
Wire Wire Line
	4100 9300 4100 10300
Connection ~ 4100 10300
Wire Wire Line
	4350 3350 3400 3350
Connection ~ 3400 3350
Text Label 4000 8800 0    60   ~ 0
WE
Text Label 9100 3200 0    60   ~ 0
C0GPA7
Text Label 9100 3400 0    60   ~ 0
C0GPA6
Text Label 9100 3600 0    60   ~ 0
C0GPA5
Text Label 9100 3800 0    60   ~ 0
C0GPA4
Text Label 9100 4000 0    60   ~ 0
C0GPA3
Text Label 9100 4200 0    60   ~ 0
C0GPA2
Text Label 9100 4400 0    60   ~ 0
C0GPA1
Text Label 9100 4600 0    60   ~ 0
C0GPA0
Text Label 9100 4700 0    60   ~ 0
C0GPB7
Text Label 9100 4500 0    60   ~ 0
C0GPB6
Text Label 9100 4300 0    60   ~ 0
C0GPB5
Text Label 9100 4100 0    60   ~ 0
C0GPB4
Text Label 9100 3900 0    60   ~ 0
C0GPB3
Text Label 9100 3700 0    60   ~ 0
C0GPB2
Text Label 9100 3500 0    60   ~ 0
C0GPB1
Text Label 9100 3300 0    60   ~ 0
C0GPB0
Text Label 9100 4900 0    60   ~ 0
C1GPA7
Text Label 9100 5100 0    60   ~ 0
C1GPA6
Text Label 9100 5300 0    60   ~ 0
C1GPA5
Text Label 9100 5500 0    60   ~ 0
C1GPA4
Text Label 9100 5700 0    60   ~ 0
C1GPA3
Text Label 9100 5900 0    60   ~ 0
C1GPA2
Text Label 9100 6100 0    60   ~ 0
C1GPA1
Text Label 9100 6300 0    60   ~ 0
C1GPA0
Text Label 9100 5000 0    60   ~ 0
C1GPB0
Text Label 9100 5200 0    60   ~ 0
C1GPB1
Text Label 9100 5400 0    60   ~ 0
C1GPB2
Text Label 9100 5600 0    60   ~ 0
C1GPB3
Text Label 9100 5800 0    60   ~ 0
C1GPB4
Text Label 9100 6000 0    60   ~ 0
C1GPB5
Text Label 9100 6200 0    60   ~ 0
C1GPB6
Text Label 9100 6400 0    60   ~ 0
C1GPB7
Wire Wire Line
	3900 10300 4100 10300
Wire Wire Line
	3800 10300 3900 10300
Wire Wire Line
	4900 10300 4900 10400
Wire Wire Line
	3900 3250 3900 6200
Wire Wire Line
	3800 3150 3800 6100
Wire Wire Line
	4250 2850 4350 2850
Wire Wire Line
	4150 2950 4350 2950
Wire Wire Line
	3300 2450 3300 3050
Wire Wire Line
	3400 3150 3400 3350
Wire Wire Line
	3000 2550 3400 2550
Wire Wire Line
	2900 2450 3300 2450
Wire Wire Line
	3000 1950 3000 2550
Wire Wire Line
	3000 1750 3000 1950
Wire Wire Line
	3000 1050 3000 1550
Wire Wire Line
	3300 3050 3300 3500
Wire Wire Line
	3600 2850 4250 2850
Wire Wire Line
	3500 2950 4150 2950
Wire Wire Line
	3900 9200 3900 9500
Wire Wire Line
	3800 9100 3800 9500
Wire Wire Line
	1750 3700 1750 3900
Wire Wire Line
	5600 2050 5600 2650
Wire Wire Line
	3700 1400 3800 1400
Wire Wire Line
	3800 1400 3900 1400
Wire Wire Line
	3900 1400 4900 1400
Wire Wire Line
	3150 8800 4200 8800
Wire Wire Line
	3300 8250 4900 8250
Wire Wire Line
	3400 10300 3800 10300
Wire Wire Line
	3600 3800 3600 5800
Wire Wire Line
	3500 3700 3500 5900
Wire Wire Line
	4900 8250 5700 8250
Wire Wire Line
	5700 8250 6050 8250
Wire Wire Line
	4900 9950 4900 10300
Wire Wire Line
	5700 9950 6050 9950
Wire Wire Line
	3300 3500 3300 5200
Wire Wire Line
	3400 8050 3400 10300
Wire Wire Line
	3400 5050 3400 8050
Wire Wire Line
	3300 5200 3300 6300
Wire Wire Line
	8950 3000 8950 3100
Wire Wire Line
	9350 6600 9350 6750
Wire Wire Line
	3600 5800 3600 8900
Wire Wire Line
	3500 5900 3500 9000
Wire Wire Line
	3800 6100 3800 9100
Wire Wire Line
	3900 6200 3900 9200
Wire Wire Line
	3300 6300 3300 8250
Wire Wire Line
	3700 3550 3700 6500
Wire Wire Line
	5600 1400 5800 1400
Wire Wire Line
	4900 1400 5600 1400
Wire Wire Line
	5800 1400 6000 1400
Wire Wire Line
	5800 2150 5800 5600
Wire Wire Line
	2900 1850 2900 2450
Wire Wire Line
	3000 1550 3000 1750
Wire Wire Line
	6050 8250 6450 8250
Wire Wire Line
	6050 9950 6450 9950
Wire Wire Line
	6450 8250 6800 8250
Wire Wire Line
	6450 9950 6800 9950
Wire Wire Line
	4100 10300 4900 10300
Wire Wire Line
	3400 3350 3400 5050
$EndSCHEMATC
