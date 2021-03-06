EESchema Schematic File Version 4
LIBS:Treadstone32_plate-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Treadstone32 plate"
Date "2019-04-02"
Rev "1.0"
Comp "marksard"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:VCC #PWR0103
U 1 1 5C670EFA
P 1200 825
F 0 "#PWR0103" H 1200 675 50  0001 C CNN
F 1 "VCC" H 1217 998 50  0000 C CNN
F 2 "" H 1200 825 50  0001 C CNN
F 3 "" H 1200 825 50  0001 C CNN
	1    1200 825 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5C670F2E
P 800 825
F 0 "#PWR0104" H 800 575 50  0001 C CNN
F 1 "GND" H 804 653 50  0000 C CNN
F 2 "" H 800 825 50  0001 C CNN
F 3 "" H 800 825 50  0001 C CNN
	1    800  825 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C671359
P 1200 825
F 0 "#FLG0101" H 1200 900 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 998 50  0000 C CNN
F 2 "" H 1200 825 50  0001 C CNN
F 3 "~" H 1200 825 50  0001 C CNN
	1    1200 825 
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C67137B
P 800 825
F 0 "#FLG0102" H 800 900 50  0001 C CNN
F 1 "PWR_FLAG" H 800 998 50  0000 C CNN
F 2 "" H 800 825 50  0001 C CNN
F 3 "~" H 800 825 50  0001 C CNN
	1    800  825 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad MH1
U 1 1 5C6713C4
P 1575 725
F 0 "MH1" H 1575 975 50  0000 C CNN
F 1 "MountingHole_Pad" H 1575 900 50  0000 C CNN
F 2 "kbd:LEGO_HOLE_2.4_gnd" H 1575 725 50  0001 C CNN
F 3 "~" H 1575 725 50  0001 C CNN
	1    1575 725 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C6713CB
P 1575 825
F 0 "#PWR0101" H 1575 575 50  0001 C CNN
F 1 "GND" H 1579 653 50  0000 C CNN
F 2 "" H 1575 825 50  0001 C CNN
F 3 "" H 1575 825 50  0001 C CNN
	1    1575 825 
	1    0    0    -1  
$EndComp
$EndSCHEMATC
