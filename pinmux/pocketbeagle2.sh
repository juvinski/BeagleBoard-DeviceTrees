#!/bin/bash

json_dir="AM62x"
json_file="AM62x.json"

main_iopad="AM62X_IOPAD"
mcu_iopad="AM62X_MCU_IOPAD"

package_id="ID_1"

source $(dirname "$0")/lib/pinmux.sh

board=pocketbeagle2

if [ ! -d ./board/${board}/ ] ; then
	mkdir -p ./board/${board}/ || true
fi
file="./board/${board}/pocketbeagle2"
k3file="./board/${board}/k3-am6232-pocketbeagle2"

echo "" >${file}-pins.txt

echo "// SPDX-License-Identifier: GPL-2.0-only OR MIT" > ${file}-pinmux.txt
echo "/*" >> ${file}-pinmux.txt
echo " * https://openbeagle.org/" >> ${file}-pinmux.txt
echo " *" >> ${file}-pinmux.txt
echo " * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/" >> ${file}-pinmux.txt
echo " * Copyright (C) 2024 Robert Nelson, BeagleBoard.org Foundation" >> ${file}-pinmux.txt
echo " */" >> ${file}-pinmux.txt
echo "" >> ${file}-pinmux.txt
echo "#include <dt-bindings/gpio/gpio.h>" >> ${file}-pinmux.txt
echo "" >> ${file}-pinmux.txt

echo "&main_pmx0 {" >${file}-main-pinmux.txt

echo "};" >${file}-mcu-pinmux.txt
echo "" >>${file}-mcu-pinmux.txt
echo "&mcu_pmx0 {" >>${file}-mcu-pinmux.txt

ssn="P1_01"
sch="VIN_5V"

sch="P1_02"
ball="E18";  label="${sch}_${ball}"; find_pin
ball="AA19"; label="${sch}_${ball}"; find_pin

sch="USB1.DRVVBUS"
ball="F18" ; label="${sch}"; find_pin

sch="P1_04"
ball="D20" ; label="${sch}_${ball}"; find_pin
ball="Y18" ; label="${sch}_${ball}"; find_pin

sch="USB1.VBUS"
ball="AB10"; label="${sch}"; find_pin

sch="P1_06"
ball="E19" ; label="${sch}_${ball}"; find_pin
ball="AD18"; label="${sch}_${ball}"; find_pin

ssn="P1_07"
sch="VIN.USB"

sch="P1_08"
ball="A20" ; label="${sch}"; find_pin

ssn="P1_09"
sch="USB1.D-"

sch="P1_10"
ball="A18" ; label="${sch}_${ball}"; find_pin
ball="B19" ; label="${sch}_${ball}"; find_pin

ssn="P1_11"
sch="USB1.D+"

sch="P1_12"
ball="A19" ; label="${sch}_${ball}"; find_pin
ball="AE18"; label="${sch}_${ball}"; find_pin

sch="USB1.ID"
ball="N20" ; label="${sch}"; find_pin

ssn="P1_14"
sch="VIN_3V3"

ssn="P1_15"
sch="GND"

ssn="P1_16"
sch="GND"

ssn="P1_17"
sch="AIN.VREF-"

ssn="P1_18"
sch="AIN.VREF+"

sch="P1_19"
ball="AD22"; label="${sch}"; find_pin

sch="P1_20"
ball="Y24" ; label="${sch}"; find_pin

sch="P1_21"
ball="AE22"; label="${sch}"; find_pin

ssn="P1_22"
sch="GND"

sch="P1_23"
ball="AC21"; label="${sch}"; find_pin

ssn="P1_24"
sch="VOUT"

sch="P1_25"
ball="AB20"; label="${sch}"; find_pin

sch="P1_26"
ball="D6" ; label="${sch}_${ball}"; find_pin
ball="K24"; label="${sch}_${ball}"; find_pin

sch="P1_27"
ball="AE23"; label="${sch}"; find_pin

sch="P1_28"
ball="B3" ; label="${sch}_${ball}"; find_pin
ball="K22"; label="${sch}_${ball}"; find_pin

sch="P1_29"
ball="Y20"; label="${sch}"; find_pin

sch="P1_30"
ball="E14"; label="${sch}"; find_pin

sch="P1_31"
ball="Y22"; label="${sch}"; find_pin

sch="P1_32"
ball="D14"; label="${sch}"; find_pin

sch="P1_33"
ball="A17" ; label="${sch}_${ball}"; find_pin
ball="AA23"; label="${sch}_${ball}"; find_pin

sch="P1_34"
ball="AD23"; label="${sch}"; find_pin

sch="P1_35"
ball="AE21"; label="${sch}"; find_pin

sch="P1_36"
ball="V20" ; label="${sch}_${ball}"; find_pin
ball="B17" ; label="${sch}_${ball}"; find_pin

sch="P2_01"
ball="AD24"; label="${sch}_${ball}"; find_pin
ball="B20" ; label="${sch}_${ball}"; find_pin

sch="P2_02"
ball="U22" ; label="${sch}"; find_pin

sch="P2_03"
ball="AB22"; label="${sch}_${ball}"; find_pin
ball="B18" ; label="${sch}_${ball}"; find_pin

sch="P2_04"
ball="V24" ; label="${sch}"; find_pin

sch="P2_05"
ball="B5" ; label="${sch}_${ball}"; find_pin
ball="C15"; label="${sch}_${ball}"; find_pin

sch="P2_06"
ball="W25" ; label="${sch}"; find_pin

sch="P2_07"
ball="A5" ; label="${sch}_${ball}"; find_pin
ball="E15"; label="${sch}_${ball}"; find_pin

sch="P2_08"
ball="W24" ; label="${sch}"; find_pin

sch="P2_09"
ball="A15" ; label="${sch}_${ball}"; find_pin
ball="D4"; label="${sch}_${ball}"; find_pin

sch="P2_10"
ball="AD21" ; label="${sch}"; find_pin

sch="P2_11"
ball="B15" ; label="${sch}_${ball}"; find_pin
ball="E5"; label="${sch}_${ball}"; find_pin

ssn="P2_12"
sch="PWR.BTN"

ssn="P2_13"
sch="VOUT"

ssn="P2_14"
sch="BAT.VIN"

ssn="P2_15"
sch="GND"

ssn="P2_16"
sch="BAT.TEMP"

sch="P2_17"
ball="AC24" ; label="${sch}"; find_pin

sch="P2_18"
ball="V21" ; label="${sch}"; find_pin

sch="P2_19"
ball="AC20" ; label="${sch}"; find_pin

sch="P2_20"
ball="Y25" ; label="${sch}"; find_pin

ssn="P2_21"
sch="GND"

sch="P2_22"
ball="AC25" ; label="${sch}"; find_pin

sch="P2_23"
sch="VDD_3V3"

sch="P2_24"
ball="Y23" ; label="${sch}"; find_pin

sch="P2_25"
ball="B14" ; label="${sch}"; find_pin

sch="P2_26"
sch="RESET#"

sch="P2_27"
ball="B13" ; label="${sch}"; find_pin

sch="P2_28"
ball="AB24" ; label="${sch}"; find_pin

sch="P2_29"
ball="A14" ; label="${sch}_${ball}"; find_pin
ball="M22"; label="${sch}_${ball}"; find_pin

sch="P2_30"
ball="AA24" ; label="${sch}"; find_pin

sch="P2_31"
ball="A13" ; label="${sch}_${ball}"; find_pin
ball="AA18"; label="${sch}_${ball}"; find_pin

sch="P2_32"
ball="AB25" ; label="${sch}"; find_pin

sch="P2_33"
ball="AA25" ; label="${sch}"; find_pin

sch="P2_34"
ball="AA21" ; label="${sch}"; find_pin

sch="P2_35"
ball="W21" ; label="${sch}"; find_pin

sch="P2_36"
ball="C13" ; label="${sch}"; find_pin

cat ${file}-pinmux.txt > ${file}-pinmux.dts
cat ${file}-main-pinmux.txt >> ${file}-pinmux.dts
cat ${file}-mcu-pinmux.txt >> ${file}-pinmux.dts

echo "};" >>${file}-pinmux.dts
echo "" >>${file}-pinmux.dts
echo "&ecap0 {" >>${file}-pinmux.dts
echo "	status = \"okay\";" >>${file}-pinmux.dts
echo "};" >>${file}-pinmux.dts
echo "" >>${file}-pinmux.dts
echo "&ecap1 {" >>${file}-pinmux.dts
echo "	status = \"okay\";" >>${file}-pinmux.dts
echo "};" >>${file}-pinmux.dts
echo "" >>${file}-pinmux.dts
echo "&ecap2 {" >>${file}-pinmux.dts
echo "	status = \"okay\";" >>${file}-pinmux.dts
echo "};" >>${file}-pinmux.dts
echo "" >>${file}-pinmux.dts
echo "&epwm0 {" >>${file}-pinmux.dts
echo "	status = \"okay\";" >>${file}-pinmux.dts
echo "};" >>${file}-pinmux.dts
echo "" >>${file}-pinmux.dts
echo "&epwm1 {" >>${file}-pinmux.dts
echo "	status = \"okay\";" >>${file}-pinmux.dts
echo "};" >>${file}-pinmux.dts

rm ${file}-pinmux.txt || true
rm ${file}-main-pinmux.txt || true
rm ${file}-mcu-pinmux.txt || true
#
