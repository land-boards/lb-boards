EESchema Schematic File Version 4
LIBS:MHS-5200A_PwrSupply-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date "2020-11-25"
Rev "2"
Comp "LAND BOARDS, LLC"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2550 3700 2450 3700
Wire Wire Line
	2450 3700 2450 4150
Wire Wire Line
	2550 4150 2450 4150
Connection ~ 2450 4150
Wire Wire Line
	2450 4150 2450 4600
Wire Wire Line
	2950 3700 3200 3700
Wire Wire Line
	2950 4150 3100 4150
Wire Wire Line
	3650 3700 3900 3700
Wire Wire Line
	3900 3700 3900 4150
Wire Wire Line
	3900 4150 3650 4150
$Comp
L Device:CP1 C1
U 1 1 5F79D174
P 4350 4100
F 0 "C1" H 4465 4191 50  0000 L CNN
F 1 "1200uF" H 4465 4100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D10.5mm_P5.00mm" H 3350 3450 50  0000 L CNN
F 3 "~" H 4350 4100 50  0001 C CNN
	1    4350 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5F79D6B1
P 4850 4100
F 0 "C2" H 4965 4191 50  0000 L CNN
F 1 "1200uF" H 4965 4100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D10.5mm_P5.00mm" H 3850 3350 50  0000 L CNN
F 3 "~" H 4850 4100 50  0001 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
$Comp
L MHS-5200A_PwrSupply-rescue:CAP-pspice C3
U 1 1 5F79E297
P 5350 4050
F 0 "C3" H 5528 4141 50  0000 L CNN
F 1 "0.1uF" H 5528 4050 50  0000 L CNN
F 2 "Capacitor_THT:C_Axial_L5.1mm_D3.1mm_P10.00mm_Horizontal" H 4200 3150 50  0000 L CNN
F 3 "~" H 5350 4050 50  0001 C CNN
	1    5350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3700 4350 3700
Wire Wire Line
	5350 3700 5350 3800
Connection ~ 3900 3700
Wire Wire Line
	4850 3950 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	4850 3700 5350 3700
Wire Wire Line
	2450 4600 4350 4600
Wire Wire Line
	5350 4300 5350 4600
Connection ~ 5350 4600
Wire Wire Line
	5350 4600 6250 4600
Wire Wire Line
	4850 4250 4850 4600
Connection ~ 4850 4600
Wire Wire Line
	4850 4600 5350 4600
Wire Wire Line
	4350 4250 4350 4600
Connection ~ 4350 4600
Wire Wire Line
	4350 4600 4850 4600
Wire Wire Line
	4350 3950 4350 3700
Connection ~ 4350 3700
Wire Wire Line
	4350 3700 4850 3700
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5F79F8CF
P 8550 3800
F 0 "J2" H 8500 3900 50  0000 L CNN
F 1 "Conn_01x02" H 8500 3600 50  0000 L CNN
F 2 "LandBoards_Conns:TB2-5MM" H 8550 3800 50  0000 C CNN
F 3 "~" H 8550 3800 50  0001 C CNN
	1    8550 3800
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5F7A0325
P 1800 3000
F 0 "J1" H 1718 3307 50  0000 C CNN
F 1 "Conn_01x02" H 1718 3216 50  0000 C CNN
F 2 "LandBoards_Conns:TB2-5MM" H 1718 3125 50  0000 C CNN
F 3 "~" H 1800 3000 50  0001 C CNN
	1    1800 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 3700 3200 3000
Wire Wire Line
	3200 3000 2000 3000
Connection ~ 3200 3700
Wire Wire Line
	3200 3700 3250 3700
Wire Wire Line
	2000 3100 3100 3100
Wire Wire Line
	3100 3100 3100 4150
Connection ~ 3100 4150
Wire Wire Line
	3100 4150 3250 4150
Wire Wire Line
	5350 3700 5950 3700
Connection ~ 5350 3700
Text Notes 1500 3100 0    50   ~ 0
AC IN
Text Notes 8900 3700 0    50   ~ 0
DC OUT
Text Label 5600 3700 0    50   ~ 0
VDC
$Comp
L MHS-5200A_PwrSupply-rescue:LF50_TO220-Regulator_Linear U1
U 1 1 5F7A46B3
P 6250 3700
F 0 "U1" H 6250 4033 50  0000 C CNN
F 1 "LF50_TO220" H 6250 3942 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6250 2700 50  0000 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 6250 3650 50  0001 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4000 6250 4600
$Comp
L Device:CP1 C4
U 1 1 5F7A7FA6
P 7200 4100
F 0 "C4" H 7315 4191 50  0000 L CNN
F 1 "CP1" H 7315 4100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D10.5mm_P5.00mm" H 6200 3300 50  0000 L CNN
F 3 "~" H 7200 4100 50  0001 C CNN
	1    7200 4100
	1    0    0    -1  
$EndComp
$Comp
L MHS-5200A_PwrSupply-rescue:CAP-pspice C5
U 1 1 5F7A947D
P 7800 4100
F 0 "C5" H 7978 4191 50  0000 L CNN
F 1 "0.1uF" H 7978 4100 50  0000 L CNN
F 2 "Capacitor_THT:C_Axial_L5.1mm_D3.1mm_P10.00mm_Horizontal" H 6650 3400 50  0000 L CNN
F 3 "~" H 7800 4100 50  0001 C CNN
	1    7800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4600 7200 4600
Wire Wire Line
	8200 4600 8200 3800
Wire Wire Line
	8200 3800 8350 3800
Connection ~ 6250 4600
Wire Wire Line
	6550 3700 7200 3700
Wire Wire Line
	7200 3950 7200 3700
Connection ~ 7200 3700
Wire Wire Line
	7200 3700 7800 3700
Wire Wire Line
	7200 4250 7200 4600
Connection ~ 7200 4600
Wire Wire Line
	7200 4600 7800 4600
Wire Wire Line
	7800 3850 7800 3700
Connection ~ 7800 3700
Wire Wire Line
	7800 3700 8350 3700
Wire Wire Line
	7800 4350 7800 4600
Connection ~ 7800 4600
Wire Wire Line
	7800 4600 8200 4600
Text Label 7400 3700 0    50   ~ 0
5V
Text Label 6600 4600 0    50   ~ 0
GND
$Comp
L LandBoards:COUPON B1
U 1 1 5F7B1D56
P 4100 7800
F 0 "B1" H 4328 8031 60  0000 L CNN
F 1 "COUPON" H 4328 7925 60  0000 L CNN
F 2 "LandBoards_BoardOutlines:BD-49X49" H 4328 7819 60  0000 L CNN
F 3 "" H 4100 7800 60  0000 C CNN
	1    4100 7800
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:DIODESCH-fixed D1
U 1 1 5FBEF09A
P 2750 3700
F 0 "D1" H 2750 3999 40  0000 C CNN
F 1 "DIODESCH-fixed" H 2750 3923 40  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 2750 3832 60  0000 C CNN
F 3 "" H 2750 3700 60  0000 C CNN
	1    2750 3700
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:DIODESCH-fixed D2
U 1 1 5FBEF114
P 2750 4150
F 0 "D2" H 2750 4449 40  0000 C CNN
F 1 "DIODESCH-fixed" H 2750 4373 40  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 2750 4282 60  0000 C CNN
F 3 "" H 2750 4150 60  0000 C CNN
	1    2750 4150
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:DIODESCH-fixed D3
U 1 1 5FBEF1B9
P 3450 3700
F 0 "D3" H 3450 3999 40  0000 C CNN
F 1 "DIODESCH-fixed" H 3450 3923 40  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3450 3832 60  0000 C CNN
F 3 "" H 3450 3700 60  0000 C CNN
	1    3450 3700
	1    0    0    -1  
$EndComp
$Comp
L LandBoards_Semis:DIODESCH-fixed D4
U 1 1 5FBEF22F
P 3450 4150
F 0 "D4" H 3450 4449 40  0000 C CNN
F 1 "DIODESCH-fixed" H 3450 4373 40  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 3450 4282 60  0000 C CNN
F 3 "" H 3450 4150 60  0000 C CNN
	1    3450 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
