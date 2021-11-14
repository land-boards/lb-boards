EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "ATTENS"
Date "2021-09-08"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LandBoards_Conns:BNC P1
U 1 1 6138F9CC
P 3950 750
F 0 "P1" H 4150 800 60  0000 C CNN
F 1 "SMA" H 4150 700 40  0000 C CNN
F 2 "Connector_Coaxial:SMA_Samtec_SMA-J-P-H-ST-EM1_EdgeMount" H 3900 -300 60  0000 C CNN
F 3 "" H 3950 750 60  0000 C CNN
	1    3950 750 
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 618D0BB6
P 5050 750
F 0 "J1" H 5130 742 50  0000 L CNN
F 1 "Conn_01x04" H 5130 651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5050 750 50  0001 C CNN
F 3 "~" H 5050 750 50  0001 C CNN
	1    5050 750 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 618D16BB
P 5050 1300
F 0 "J2" H 5130 1342 50  0000 L CNN
F 1 "Conn_01x03" H 5130 1251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5050 1300 50  0001 C CNN
F 3 "~" H 5050 1300 50  0001 C CNN
	1    5050 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1400 4750 1400
Wire Wire Line
	3950 950  3950 1400
Wire Wire Line
	4750 1400 4750 1200
Wire Wire Line
	4750 850  4850 850 
Connection ~ 4750 1400
Wire Wire Line
	4750 1400 3950 1400
Wire Wire Line
	4850 950  4750 950 
Wire Wire Line
	4850 1200 4750 1200
Connection ~ 4750 1200
Wire Wire Line
	4750 1200 4750 950 
Wire Wire Line
	4850 1300 4250 1300
Wire Wire Line
	4250 750  4100 750 
Connection ~ 4250 750 
Wire Wire Line
	4250 750  4250 1300
Wire Wire Line
	4750 850  4750 950 
Connection ~ 4750 950 
Wire Wire Line
	4850 750  4750 750 
Wire Wire Line
	4750 750  4750 650 
Wire Wire Line
	4750 650  4850 650 
Connection ~ 4750 750 
Wire Wire Line
	4750 750  4250 750 
Text Label 4350 1400 0    50   ~ 0
GND
Text Label 4350 1300 0    50   ~ 0
SIG
$EndSCHEMATC
