#!/bin/bash

json_dir="AM62x"
json_file="AM62x.json"

main_iopad="AM62X_IOPAD"
mcu_iopad="J722S_MCU_IOPAD"

package_id="ID_1"

source $(dirname "$0")/lib/pinmux.sh

board=pocketbeagle2

if [ ! -d ./board/${board}/ ] ; then
	mkdir -p ./board/${board}/ || true
fi
file="./board/${board}/pocketbeagle2"
k3file="./board/${board}/k3-am625-pocketbeagle2"

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

ssn="P1_02"
sch="GPIO87"
label="${ssn}A"; ball="AA19"; find_pin
label="${ssn}B"; ball="E18" ; find_pin

ssn="P1_03"
sch="USB1.DRVVBUS"
label="${ssn}" ; ball="F18" ; find_pin

ssn="P1_04"
sch="GPIO89"
label="${ssn}A"; ball="Y18" ; find_pin
label="${ssn}B"; ball="D20" ; find_pin

ssn="P1_05"
sch="USB1.VBUS"
label="${ssn}" ; ball="AB10"; find_pin

ssn="P1_06"
sch="SPI2.CS"
label="${ssn}A"; ball="E19" ; find_pin
label="${ssn}B"; ball="AD18"; find_pin

ssn="P1_07"
sch="VIN.USB"

ssn="P1_08"
sch="SPI2.CLK"
label="${ssn}" ; ball="A20" ; find_pin

ssn="P1_09"
sch="USB1.D-"

ssn="P1_10"
sch="SPI2.MISO"
label="${ssn}A"; ball="B19" ; find_pin
label="${ssn}B"; ball="A18" ; find_pin

ssn="P1_11"
sch="USB1.D+"

ssn="P1_12"
sch="SPI2.MOSI"
label="${ssn}A"; ball="A19" ; find_pin
label="${ssn}B"; ball="AE18"; find_pin

ssn="P1_13"
sch="USB1.ID"
label="${ssn}" ; ball="N20" ; find_pin

ssn="P1_14"
sch="VIN_5V3"

ssn="P1_15"
sch="GND"

ssn="P1_16"
sch="GND"

ssn="P1_17"
sch="AIN.VREF-"

ssn="P1_18"
sch="AIN.VREF+"

ssn="P1_13"
sch="AIN0"
label="${ssn}" ; ball="AD22"; find_pin

exit 2

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
