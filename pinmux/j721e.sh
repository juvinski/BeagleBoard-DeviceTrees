#!/bin/bash

#https://www.ti.com/lit/ds/symlink/tda4vm.pdf

json_dir="J721E_DRA829_TDA4VM_AM752x"
json_file="J721E_DRA829_TDA4VM_AM752x.json"

main_iopad="J721E_IOPAD"
mcu_iopad="J721E_WKUP_IOPAD"

package_id="ID_0"

source $(dirname "$0")/lib/pinmux.sh

board=j721e

if [ ! -d ./board/${board}/ ] ; then
	mkdir -p ./board/${board}/ || true
fi
file="./board/${board}/j721e"
k3file="./board/${board}/j721e"

echo "" >${file}-pins.txt
echo "" >${file}-pinmux.txt
echo "" >${file}-main-pinmux.txt
echo "" >${file}-mcu-pinmux.txt
echo "" >${file}-pins.csv
echo "" >${file}-pins-gpio.txt
reset_gpio

number_pins=0
number_holes=0
offset=0;

pinctrl_single_pin_base=0
gpio_ranges_line_start=0

echo "#GPIO0," > ${file}-pins.csv
label="GPIO0_0"; ball="AC18"; sch=${label}; find_pin
label="GPIO0_1"; ball="AC23"; sch=${label}; find_pin
label="GPIO0_2"; ball="AG22"; sch=${label}; find_pin
label="GPIO0_3"; ball="AF22"; sch=${label}; find_pin
label="GPIO0_4"; ball="AJ23"; sch=${label}; find_pin
label="GPIO0_5"; ball="AH23"; sch=${label}; find_pin
label="GPIO0_6"; ball="AD20"; sch=${label}; find_pin
label="GPIO0_7"; ball="AD22"; sch=${label}; find_pin
label="GPIO0_8"; ball="AE20"; sch=${label}; find_pin
label="GPIO0_9"; ball="AJ20"; sch=${label}; find_pin
label="GPIO0_10"; ball="AG20"; sch=${label}; find_pin
label="GPIO0_11"; ball="AD21"; sch=${label}; find_pin
label="GPIO0_12"; ball="AF24"; sch=${label}; find_pin
label="GPIO0_13"; ball="AJ24"; sch=${label}; find_pin
label="GPIO0_14"; ball="AG24"; sch=${label}; find_pin
label="GPIO0_15"; ball="AD24"; sch=${label}; find_pin
label="GPIO0_16"; ball="AC24"; sch=${label}; find_pin
label="GPIO0_17"; ball="AE24"; sch=${label}; find_pin
found_hole ; mark_hole
label="GPIO0_18"; ball="AJ21"; sch=${label}; find_pin
label="GPIO0_19"; ball="AE21"; sch=${label}; find_pin
label="GPIO0_20"; ball="AH21"; sch=${label}; find_pin
label="GPIO0_21"; ball="AE22"; sch=${label}; find_pin
label="GPIO0_22"; ball="AG23"; sch=${label}; find_pin
label="GPIO0_23"; ball="AF23"; sch=${label}; find_pin
label="GPIO0_24"; ball="AD23"; sch=${label}; find_pin
label="GPIO0_25"; ball="AH24"; sch=${label}; find_pin
label="GPIO0_26"; ball="AG21"; sch=${label}; find_pin
label="GPIO0_27"; ball="AE23"; sch=${label}; find_pin
label="GPIO0_28"; ball="AC21"; sch=${label}; find_pin
label="GPIO0_29"; ball="Y23"; sch=${label}; find_pin
label="GPIO0_30"; ball="AF21"; sch=${label}; find_pin
label="GPIO0_31"; ball="AB23"; sch=${label}; find_pin
label="GPIO0_32"; ball="AJ25"; sch=${label}; find_pin
label="GPIO0_33"; ball="AH25"; sch=${label}; find_pin
label="GPIO0_34"; ball="AG25"; sch=${label}; find_pin
label="GPIO0_35"; ball="AH26"; sch=${label}; find_pin
label="GPIO0_36"; ball="AJ27"; sch=${label}; find_pin
label="GPIO0_37"; ball="AJ26"; sch=${label}; find_pin
label="GPIO0_38"; ball="AC22"; sch=${label}; find_pin
label="GPIO0_39"; ball="AJ22"; sch=${label}; find_pin
label="GPIO0_40"; ball="AH22"; sch=${label}; find_pin
label="GPIO0_41"; ball="AD19"; sch=${label}; find_pin
label="GPIO0_42"; ball="AD18"; sch=${label}; find_pin
label="GPIO0_43"; ball="AF28"; sch=${label}; find_pin
label="GPIO0_44"; ball="AE28"; sch=${label}; find_pin
label="GPIO0_45"; ball="AE27"; sch=${label}; find_pin
label="GPIO0_46"; ball="AD26"; sch=${label}; find_pin
label="GPIO0_47"; ball="AD25"; sch=${label}; find_pin
label="GPIO0_48"; ball="AC29"; sch=${label}; find_pin
label="GPIO0_49"; ball="AE26"; sch=${label}; find_pin
label="GPIO0_50"; ball="AC28"; sch=${label}; find_pin
label="GPIO0_51"; ball="AC27"; sch=${label}; find_pin
label="GPIO0_52"; ball="AB26"; sch=${label}; find_pin
label="GPIO0_53"; ball="AB25"; sch=${label}; find_pin
label="GPIO0_54"; ball="AJ28"; sch=${label}; find_pin
label="GPIO0_55"; ball="AH27"; sch=${label}; find_pin
label="GPIO0_56"; ball="AH29"; sch=${label}; find_pin
label="GPIO0_57"; ball="AG28"; sch=${label}; find_pin
label="GPIO0_58"; ball="AG27"; sch=${label}; find_pin
label="GPIO0_59"; ball="AH28"; sch=${label}; find_pin
label="GPIO0_60"; ball="AB24"; sch=${label}; find_pin
label="GPIO0_61"; ball="AB29"; sch=${label}; find_pin
label="GPIO0_62"; ball="AB28"; sch=${label}; find_pin
label="GPIO0_63"; ball="AE29"; sch=${label}; find_pin
label="GPIO0_64"; ball="AD28"; sch=${label}; find_pin
label="GPIO0_65"; ball="AD27"; sch=${label}; find_pin
label="GPIO0_66"; ball="AC25"; sch=${label}; find_pin
label="GPIO0_67"; ball="AD29"; sch=${label}; find_pin
label="GPIO0_68"; ball="AB27"; sch=${label}; find_pin
label="GPIO0_69"; ball="AC26"; sch=${label}; find_pin
label="GPIO0_70"; ball="AA24"; sch=${label}; find_pin
label="GPIO0_71"; ball="AA28"; sch=${label}; find_pin
label="GPIO0_72"; ball="Y24"; sch=${label}; find_pin
label="GPIO0_73"; ball="AA25"; sch=${label}; find_pin
label="GPIO0_74"; ball="AG26"; sch=${label}; find_pin
label="GPIO0_75"; ball="AF27"; sch=${label}; find_pin
label="GPIO0_76"; ball="AF26"; sch=${label}; find_pin
label="GPIO0_77"; ball="AE25"; sch=${label}; find_pin
label="GPIO0_78"; ball="AF29"; sch=${label}; find_pin
label="GPIO0_79"; ball="AG29"; sch=${label}; find_pin
label="GPIO0_80"; ball="Y25"; sch=${label}; find_pin
label="GPIO0_81"; ball="AA26"; sch=${label}; find_pin
label="GPIO0_82"; ball="AA29"; sch=${label}; find_pin
label="GPIO0_83"; ball="Y26"; sch=${label}; find_pin
label="GPIO0_84"; ball="AA27"; sch=${label}; find_pin
label="GPIO0_85"; ball="U23"; sch=${label}; find_pin
label="GPIO0_86"; ball="U26"; sch=${label}; find_pin
label="GPIO0_87"; ball="V28"; sch=${label}; find_pin
label="GPIO0_88"; ball="V29"; sch=${label}; find_pin
label="GPIO0_89"; ball="V27"; sch=${label}; find_pin
label="GPIO0_90"; ball="U28"; sch=${label}; find_pin
label="GPIO0_91"; ball="U29"; sch=${label}; find_pin
label="GPIO0_92"; ball="U25"; sch=${label}; find_pin
label="GPIO0_93"; ball="U27"; sch=${label}; find_pin
label="GPIO0_94"; ball="U24"; sch=${label}; find_pin
label="GPIO0_95"; ball="R23"; sch=${label}; find_pin
label="GPIO0_96"; ball="T23"; sch=${label}; find_pin
label="GPIO0_97"; ball="Y28"; sch=${label}; find_pin
label="GPIO0_98"; ball="V23"; sch=${label}; find_pin
label="GPIO0_99"; ball="W23"; sch=${label}; find_pin
label="GPIO0_100"; ball="W28"; sch=${label}; find_pin
label="GPIO0_101"; ball="V25"; sch=${label}; find_pin
label="GPIO0_102"; ball="W27"; sch=${label}; find_pin
label="GPIO0_103"; ball="W29"; sch=${label}; find_pin
label="GPIO0_104"; ball="W26"; sch=${label}; find_pin
label="GPIO0_105"; ball="Y29"; sch=${label}; find_pin
label="GPIO0_106"; ball="Y27"; sch=${label}; find_pin
label="GPIO0_107"; ball="W24"; sch=${label}; find_pin
label="GPIO0_108"; ball="W25"; sch=${label}; find_pin
label="GPIO0_109"; ball="V26"; sch=${label}; find_pin
label="GPIO0_110"; ball="V24"; sch=${label}; find_pin
label="GPIO0_111"; ball="AA2"; sch=${label}; find_pin
label="GPIO0_112"; ball="Y4"; sch=${label}; find_pin
label="GPIO0_113"; ball="AA1"; sch=${label}; find_pin
label="GPIO0_114"; ball="AB5"; sch=${label}; find_pin
label="GPIO0_115"; ball="AA3"; sch=${label}; find_pin
label="GPIO0_116"; ball="Y3"; sch=${label}; find_pin
label="GPIO0_117"; ball="W4"; sch=${label}; find_pin
label="GPIO0_118"; ball="Y1"; sch=${label}; find_pin
label="GPIO0_119"; ball="Y5"; sch=${label}; find_pin
label="GPIO0_120"; ball="Y2"; sch=${label}; find_pin
label="GPIO0_121"; ball="AB2"; sch=${label}; find_pin
label="GPIO0_122"; ball="AB3"; sch=${label}; find_pin
label="GPIO0_123"; ball="AC2"; sch=${label}; find_pin
label="GPIO0_124"; ball="AB1"; sch=${label}; find_pin
label="GPIO0_125"; ball="AA4"; sch=${label}; find_pin
label="GPIO0_126"; ball="AB4"; sch=${label}; find_pin
label="GPIO0_127"; ball="AC4"; sch=${label}; find_pin
found_hole

pinctrl_single_pin_base=129
gpio_ranges_line_start=0

echo "" >> ${file}-pins.csv
echo "#GPIO1," >> ${file}-pins.csv
label="GPIO1_0"; ball="AD5"; sch=${label}; find_pin
label="GPIO1_1"; ball="W5"; sch=${label}; find_pin
label="GPIO1_2"; ball="W6"; sch=${label}; find_pin
label="GPIO1_3"; ball="W3"; sch=${label}; find_pin
label="GPIO1_4"; ball="V4"; sch=${label}; find_pin
label="GPIO1_5"; ball="W2"; sch=${label}; find_pin
label="GPIO1_6"; ball="W1"; sch=${label}; find_pin
label="GPIO1_7"; ball="AC5"; sch=${label}; find_pin
label="GPIO1_8"; ball="AA5"; sch=${label}; find_pin
label="GPIO1_9"; ball="Y6"; sch=${label}; find_pin
label="GPIO1_10"; ball="AA6"; sch=${label}; find_pin
label="GPIO1_11"; ball="U2"; sch=${label}; find_pin
label="GPIO1_12"; ball="U3"; sch=${label}; find_pin
label="GPIO1_13"; ball="V6"; sch=${label}; find_pin
label="GPIO1_14"; ball="V5"; sch=${label}; find_pin
label="GPIO1_15"; ball="R26"; sch=${label}; find_pin
label="GPIO1_16"; ball="R25"; sch=${label}; find_pin
label="GPIO1_17"; ball="P24"; sch=${label}; find_pin
label="GPIO1_18"; ball="R24"; sch=${label}; find_pin
label="GPIO1_19"; ball="P25"; sch=${label}; find_pin
label="GPIO1_20"; ball="R29"; sch=${label}; find_pin
label="GPIO1_21"; ball="P23"; sch=${label}; find_pin
label="GPIO1_22"; ball="R28"; sch=${label}; find_pin
label="GPIO1_23"; ball="T28"; sch=${label}; find_pin
label="GPIO1_24"; ball="T29"; sch=${label}; find_pin
label="GPIO1_25"; ball="T27"; sch=${label}; find_pin
label="GPIO1_26"; ball="T24"; sch=${label}; find_pin
label="GPIO1_27"; ball="T26"; sch=${label}; find_pin
label="GPIO1_28"; ball="T25"; sch=${label}; find_pin
found_hole ; mark_hole
mark_hole
mark_hole
mark_hole
mark_hole
mark_hole

pinctrl_single_pin_base=164
gpio_ranges_line_start=29

label="GPIO1_29"; ball="U6"; sch=${label}; find_pin
label="GPIO1_30"; ball="AD1"; sch=${label}; find_pin
label="GPIO1_31"; ball="AC1"; sch=${label}; find_pin
label="GPIO1_32"; ball="AC3"; sch=${label}; find_pin
label="GPIO1_33"; ball="AD3"; sch=${label}; find_pin
label="GPIO1_34"; ball="AD2"; sch=${label}; find_pin
label="GPIO1_35"; ball="AE2"; sch=${label}; find_pin
found_hole

pinctrl_single_pin_base=44
gpio_ranges_line_start=0

echo "" >> ${file}-pins.csv
echo "#WKUP_GPIO0," >> ${file}-pins.csv
label="WKUP_GPIO0_0"; ball="F26"; sch=${label}; find_pin
label="WKUP_GPIO0_1"; ball="F25"; sch=${label}; find_pin
label="WKUP_GPIO0_2"; ball="F28"; sch=${label}; find_pin
label="WKUP_GPIO0_3"; ball="F27"; sch=${label}; find_pin
label="WKUP_GPIO0_4"; ball="G25"; sch=${label}; find_pin
label="WKUP_GPIO0_5"; ball="G24"; sch=${label}; find_pin
label="WKUP_GPIO0_6"; ball="F29"; sch=${label}; find_pin
label="WKUP_GPIO0_7"; ball="G28"; sch=${label}; find_pin
label="WKUP_GPIO0_8"; ball="G27"; sch=${label}; find_pin
label="WKUP_GPIO0_9"; ball="G26"; sch=${label}; find_pin
label="WKUP_GPIO0_10"; ball="H26"; sch=${label}; find_pin
label="WKUP_GPIO0_11"; ball="H27"; sch=${label}; find_pin
label="WKUP_GPIO0_12"; ball="G29"; sch=${label}; find_pin
label="WKUP_GPIO0_13"; ball="H28"; sch=${label}; find_pin
label="WKUP_GPIO0_14"; ball="H29"; sch=${label}; find_pin
label="WKUP_GPIO0_15"; ball="J27"; sch=${label}; find_pin
found_hole_wkup

pinctrl_single_pin_base=0
gpio_ranges_line_start=16

label="WKUP_GPIO0_16"; ball="E20"; sch=${label}; find_pin
label="WKUP_GPIO0_17"; ball="C21"; sch=${label}; find_pin
label="WKUP_GPIO0_18"; ball="D21"; sch=${label}; find_pin
label="WKUP_GPIO0_19"; ball="D20"; sch=${label}; find_pin
label="WKUP_GPIO0_20"; ball="G19"; sch=${label}; find_pin
label="WKUP_GPIO0_21"; ball="G20"; sch=${label}; find_pin
label="WKUP_GPIO0_22"; ball="F20"; sch=${label}; find_pin
label="WKUP_GPIO0_23"; ball="F21"; sch=${label}; find_pin
label="WKUP_GPIO0_24"; ball="E21"; sch=${label}; find_pin
label="WKUP_GPIO0_25"; ball="B22"; sch=${label}; find_pin
label="WKUP_GPIO0_26"; ball="G21"; sch=${label}; find_pin
label="WKUP_GPIO0_27"; ball="F19"; sch=${label}; find_pin
label="WKUP_GPIO0_28"; ball="E19"; sch=${label}; find_pin
label="WKUP_GPIO0_29"; ball="F22"; sch=${label}; find_pin
label="WKUP_GPIO0_30"; ball="A23"; sch=${label}; find_pin
label="WKUP_GPIO0_31"; ball="B23"; sch=${label}; find_pin
label="WKUP_GPIO0_32"; ball="D22"; sch=${label}; find_pin
label="WKUP_GPIO0_33"; ball="G22"; sch=${label}; find_pin
label="WKUP_GPIO0_34"; ball="D23"; sch=${label}; find_pin
label="WKUP_GPIO0_35"; ball="C23"; sch=${label}; find_pin
label="WKUP_GPIO0_36"; ball="C22"; sch=${label}; find_pin
label="WKUP_GPIO0_37"; ball="E22"; sch=${label}; find_pin
label="WKUP_GPIO0_38"; ball="B27"; sch=${label}; find_pin
label="WKUP_GPIO0_39"; ball="C25"; sch=${label}; find_pin
label="WKUP_GPIO0_40"; ball="A28"; sch=${label}; find_pin
label="WKUP_GPIO0_41"; ball="A27"; sch=${label}; find_pin
label="WKUP_GPIO0_42"; ball="A26"; sch=${label}; find_pin
label="WKUP_GPIO0_43"; ball="B25"; sch=${label}; find_pin
label="WKUP_GPIO0_44"; ball="B26"; sch=${label}; find_pin
label="WKUP_GPIO0_45"; ball="C24"; sch=${label}; find_pin
label="WKUP_GPIO0_46"; ball="A25"; sch=${label}; find_pin
label="WKUP_GPIO0_47"; ball="D24"; sch=${label}; find_pin
label="WKUP_GPIO0_48"; ball="A24"; sch=${label}; find_pin
label="WKUP_GPIO0_49"; ball="B24"; sch=${label}; find_pin
label="WKUP_GPIO0_50"; ball="E23"; sch=${label}; find_pin
label="WKUP_GPIO0_51"; ball="F23"; sch=${label}; find_pin
label="WKUP_GPIO0_52"; ball="E27"; sch=${label}; find_pin
label="WKUP_GPIO0_53"; ball="E24"; sch=${label}; find_pin
label="WKUP_GPIO0_54"; ball="E28"; sch=${label}; find_pin
label="WKUP_GPIO0_55"; ball="E25"; sch=${label}; find_pin
label="WKUP_GPIO0_56"; ball="J29"; sch=${label}; find_pin
label="WKUP_GPIO0_57"; ball="J28"; sch=${label}; find_pin
label="WKUP_GPIO0_58"; ball="D29"; sch=${label}; find_pin
label="WKUP_GPIO0_59"; ball="C29"; sch=${label}; find_pin
found_hole_wkup

pinctrl_single_pin_base=60
gpio_ranges_line_start=60

label="WKUP_GPIO0_60"; ball="D26"; sch=${label}; find_pin
label="WKUP_GPIO0_61"; ball="D25"; sch=${label}; find_pin
label="WKUP_GPIO0_62"; ball="J25"; sch=${label}; find_pin
label="WKUP_GPIO0_63"; ball="H24"; sch=${label}; find_pin
label="WKUP_GPIO0_64"; ball="J26"; sch=${label}; find_pin
label="WKUP_GPIO0_65"; ball="H25"; sch=${label}; find_pin
label="WKUP_GPIO0_66"; ball="E26"; sch=${label}; find_pin
label="WKUP_GPIO0_67"; ball="G23"; sch=${label}; find_pin
label="WKUP_GPIO0_68"; ball="K25"; sch=${label}; find_pin
label="WKUP_GPIO0_69"; ball="K26"; sch=${label}; find_pin
label="WKUP_GPIO0_70"; ball="K28"; sch=${label}; find_pin
label="WKUP_GPIO0_71"; ball="L28"; sch=${label}; find_pin
label="WKUP_GPIO0_72"; ball="K24"; sch=${label}; find_pin
label="WKUP_GPIO0_73"; ball="K27"; sch=${label}; find_pin
label="WKUP_GPIO0_74"; ball="K29"; sch=${label}; find_pin
label="WKUP_GPIO0_75"; ball="L29"; sch=${label}; find_pin
label="WKUP_GPIO0_76"; ball="N23"; sch=${label}; find_pin
label="WKUP_GPIO0_77"; ball="M25"; sch=${label}; find_pin
label="WKUP_GPIO0_78"; ball="L24"; sch=${label}; find_pin
label="WKUP_GPIO0_79"; ball="L26"; sch=${label}; find_pin
label="WKUP_GPIO0_80"; ball="N24"; sch=${label}; find_pin
label="WKUP_GPIO0_81"; ball="M24"; sch=${label}; find_pin
label="WKUP_GPIO0_82"; ball="L25"; sch=${label}; find_pin
label="WKUP_GPIO0_83"; ball="L27"; sch=${label}; find_pin
found_hole_wkup
finalize_gpio

rm ${file}-pinmux.txt || true
rm ${file}-main-pinmux.txt || true
rm ${file}-mcu-pinmux.txt || true
#
