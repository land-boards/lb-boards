EESchema Schematic File Version 2
LIBS:DougsSch
LIBS:power
LIBS:device
LIBS:conn
LIBS:TXB0108
LIBS:beaglebone
LIBS:linear
LIBS:memory
LIBS:BBB-GVS-3-cache
EELAYER 25 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 6
Title "BeagleBone Cape Baseline"
Date "24 feb 2015"
Rev "X4"
Comp "Doug Gilliland <doug@douglasgilliland.com>"
Comment1 "https://github.com/douggilliland/"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3950 950  1200 1000
U 4EB0F8E9
F0 "BBB EEPROM Power Etc" 60
F1 "BBB-Conn.sch" 60
$EndSheet
$Sheet
S 7200 950  1200 1000
U 54E2626D
F0 "Analog Inputs" 50
F1 "Analog-Inputs.sch" 50
$EndSheet
$Sheet
S 4000 2400 1200 1000
U 54E536E2
F0 "P8 Connector" 60
F1 "BBB-P8-Conn.sch" 60
$EndSheet
$Sheet
S 5700 2400 1200 1000
U 54E536E4
F0 "P9 Connector" 60
F1 "BBB-P9-Conn.sch" 60
$EndSheet
$Comp
L COUPON COUP4
U 1 1 54E53941
P 5750 7700
F 0 "COUP4" H 5650 7600 60  0000 C CNN
F 1 "COUPON" H 5700 7550 60  0000 C CNN
F 2 "REV_BLOCK" H 5750 7650 60  0000 C CNN
F 3 "~" H 5750 7700 60  0000 C CNN
	1    5750 7700
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 FID4
U 1 1 54E53947
P 5500 7200
F 0 "FID4" H 5580 7200 40  0000 L CNN
F 1 "CONN_1" H 5500 7255 30  0001 C CNN
F 2 "FIDUCIAL" H 5500 7150 60  0000 C CNN
F 3 "" H 5500 7200 60  0000 C CNN
	1    5500 7200
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 FID3
U 1 1 54E5394D
P 5500 7050
F 0 "FID3" H 5580 7050 40  0000 L CNN
F 1 "CONN_1" H 5500 7105 30  0001 C CNN
F 2 "FIDUCIAL" H 5500 7000 60  0000 C CNN
F 3 "" H 5500 7050 60  0000 C CNN
	1    5500 7050
	1    0    0    -1  
$EndComp
$Comp
L COUPON COUP3
U 1 1 54E53953
P 5200 7700
F 0 "COUP3" H 5100 7600 60  0000 C CNN
F 1 "COUPON" H 5150 7550 60  0000 C CNN
F 2 "REV_BLOCK" H 5200 7650 60  0000 C CNN
F 3 "~" H 5200 7700 60  0000 C CNN
	1    5200 7700
	1    0    0    -1  
$EndComp
$Sheet
S 5700 950  1200 1000
U 4EB0F8C5
F0 "16-bit Translator" 60
F1 "trans16.sch" 60
$EndSheet
$EndSCHEMATC
