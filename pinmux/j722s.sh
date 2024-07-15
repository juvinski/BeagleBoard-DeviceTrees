#!/bin/bash

#https://www.ti.com/lit/ds/symlink/tda4aen-q1.pdf
#https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/ti?h=next-20240715&id=5e5c50964e2e524a7537c97303e9266b11f372d8

json_dir="J722S_TDA4VEN_TDA4AEN_AM67"
json_file="J722S_TDA4VEN_TDA4AEN_AM67.json"

main_iopad="J722S_IOPAD"
mcu_iopad="J722S_MCU_IOPAD"

source $(dirname "$0")/lib/pinmux.sh

board=j722s

if [ ! -d ./board/${board}/ ] ; then
	mkdir -p ./board/${board}/ || true
fi
file="./board/${board}/j722s"
k3file="./board/${board}/j722s"

echo "" >${file}-pins.txt
echo "" > ${file}-pinmux.txt
echo "" >${file}-main-pinmux.txt
echo "" >${file}-mcu-pinmux.txt
echo "" >${file}-pins.csv

label="GPIO0_0" ; ball="L24" ; sch=${label}; find_pin
label="GPIO0_1" ; ball="L23" ; sch=${label}; find_pin
label="GPIO0_2" ; ball="L22" ; sch=${label}; find_pin
label="GPIO0_3" ; ball="K27" ; sch=${label}; find_pin
label="GPIO0_4" ; ball="L27" ; sch=${label}; find_pin
label="GPIO0_5" ; ball="L26" ; sch=${label}; find_pin
label="GPIO0_6" ; ball="L25" ; sch=${label}; find_pin
label="GPIO0_7" ; ball="L21" ; sch=${label}; find_pin
label="GPIO0_8" ; ball="M26" ; sch=${label}; find_pin
label="GPIO0_9" ; ball="N27" ; sch=${label}; find_pin
label="GPIO0_10" ; ball="M27" ; sch=${label}; find_pin
label="GPIO0_11" ; ball="K26" ; sch=${label}; find_pin
label="GPIO0_12" ; ball="K23" ; sch=${label}; find_pin
label="GPIO0_13" ; ball="K22" ; sch=${label}; find_pin
label="GPIO0_14" ; ball="J22" ; sch=${label}; find_pin
label="GPIO0_15" ; ball="R22" ; sch=${label}; find_pin
label="GPIO0_16" ; ball="R23" ; sch=${label}; find_pin
label="GPIO0_17" ; ball="R26" ; sch=${label}; find_pin
label="GPIO0_18" ; ball="T27" ; sch=${label}; find_pin
label="GPIO0_19" ; ball="T25" ; sch=${label}; find_pin
label="GPIO0_20" ; ball="T24" ; sch=${label}; find_pin
label="GPIO0_21" ; ball="T21" ; sch=${label}; find_pin
label="GPIO0_22" ; ball="T22" ; sch=${label}; find_pin
label="GPIO0_23" ; ball="U27" ; sch=${label}; find_pin
label="GPIO0_24" ; ball="U26" ; sch=${label}; find_pin
label="GPIO0_25" ; ball="V27" ; sch=${label}; find_pin
label="GPIO0_26" ; ball="V25" ; sch=${label}; find_pin
label="GPIO0_27" ; ball="V26" ; sch=${label}; find_pin
label="GPIO0_28" ; ball="V24" ; sch=${label}; find_pin
label="GPIO0_29" ; ball="V22" ; sch=${label}; find_pin
label="GPIO0_30" ; ball="V23" ; sch=${label}; find_pin
label="GPIO0_31" ; ball="T23" ; sch=${label}; find_pin
label="GPIO0_32" ; ball="N21" ; sch=${label}; find_pin
label="GPIO0_33" ; ball="N22" ; sch=${label}; find_pin
label="GPIO0_34" ; ball="N23" ; sch=${label}; find_pin
label="GPIO0_35" ; ball="P27" ; sch=${label}; find_pin
label="GPIO0_36" ; ball="P26" ; sch=${label}; find_pin
label="GPIO0_37" ; ball="V21" ; sch=${label}; find_pin
label="GPIO0_38" ; ball="W26" ; sch=${label}; find_pin
label="GPIO0_39" ; ball="N24" ; sch=${label}; find_pin
label="GPIO0_40" ; ball="N25" ; sch=${label}; find_pin
label="GPIO0_41" ; ball="R27" ; sch=${label}; find_pin
label="GPIO0_42" ; ball="P21" ; sch=${label}; find_pin
label="GPIO0_43" ; ball="P22" ; sch=${label}; find_pin
label="GPIO0_44" ; ball="P23" ; sch=${label}; find_pin
label="GPIO0_45" ; ball="W27" ; sch=${label}; find_pin
label="GPIO0_46" ; ball="W25" ; sch=${label}; find_pin
label="GPIO0_47" ; ball="W24" ; sch=${label}; find_pin
label="GPIO0_48" ; ball="W23" ; sch=${label}; find_pin
label="GPIO0_49" ; ball="W22" ; sch=${label}; find_pin
label="GPIO0_50" ; ball="W21" ; sch=${label}; find_pin
label="GPIO0_51" ; ball="Y26" ; sch=${label}; find_pin
label="GPIO0_52" ; ball="Y27" ; sch=${label}; find_pin
label="GPIO0_53" ; ball="AA24" ; sch=${label}; find_pin
label="GPIO0_54" ; ball="AA27" ; sch=${label}; find_pin
label="GPIO0_55" ; ball="AA25" ; sch=${label}; find_pin
label="GPIO0_56" ; ball="AB25" ; sch=${label}; find_pin
label="GPIO0_57" ; ball="AA23" ; sch=${label}; find_pin
label="GPIO0_58" ; ball="AA22" ; sch=${label}; find_pin
label="GPIO0_59" ; ball="AB26" ; sch=${label}; find_pin
label="GPIO0_60" ; ball="AB27" ; sch=${label}; find_pin
label="GPIO0_61" ; ball="AB24" ; sch=${label}; find_pin
label="GPIO0_62" ; ball="AC27" ; sch=${label}; find_pin
label="GPIO0_63" ; ball="AB23" ; sch=${label}; find_pin
label="GPIO0_64" ; ball="AC26" ; sch=${label}; find_pin
label="GPIO0_65" ; ball="J27" ; sch=${label}; find_pin
label="GPIO0_66" ; ball="H27" ; sch=${label}; find_pin
label="GPIO0_67" ; ball="G27" ; sch=${label}; find_pin
label="GPIO0_68" ; ball="G26" ; sch=${label}; find_pin
label="GPIO0_69" ; ball="H26" ; sch=${label}; find_pin
label="GPIO0_70" ; ball="F27" ; sch=${label}; find_pin
label="GPIO0_71" ; ball="F26" ; sch=${label}; find_pin
label="GPIO0_72" ; ball="H21" ; sch=${label}; find_pin
label="GPIO0_73" ; ball="AF25" ; sch=${label}; find_pin
label="GPIO0_74" ; ball="AG26" ; sch=${label}; find_pin
label="GPIO0_75" ; ball="AF27" ; sch=${label}; find_pin
label="GPIO0_76" ; ball="AE23" ; sch=${label}; find_pin
label="GPIO0_77" ; ball="AG25" ; sch=${label}; find_pin
label="GPIO0_78" ; ball="AF24" ; sch=${label}; find_pin
label="GPIO0_79" ; ball="AD23" ; sch=${label}; find_pin
label="GPIO0_80" ; ball="AE27" ; sch=${label}; find_pin
label="GPIO0_81" ; ball="AC25" ; sch=${label}; find_pin
label="GPIO0_82" ; ball="AD27" ; sch=${label}; find_pin
label="GPIO0_83" ; ball="AE24" ; sch=${label}; find_pin
label="GPIO0_84" ; ball="AE26" ; sch=${label}; find_pin
label="GPIO0_85" ; ball="AD25" ; sch=${label}; find_pin
label="GPIO0_86" ; ball="AC24" ; sch=${label}; find_pin

rm ${file}-pinmux.txt || true
rm ${file}-main-pinmux.txt || true
rm ${file}-mcu-pinmux.txt || true
#
