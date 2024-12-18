#!/bin/bash

#cat ${json_file} | jq '.devicePins'
#cat ${json_file} | jq '.useCases'
#cat ${json_file} | jq '.packages .'$package_id' .packagePin[202] .devicePinID'

echo_both () {
#	echo "$msg"
	echo "$msg" >> ${file}.dts
}

echo_label () {
	msg="	/* ${pcbpin}                ${label_info} */" ; echo_both ; msg="" ; echo_both
}

echo_label_analog () {
	msg="	/* ${pcbpin} (${ball})  ${label_info} */" ; echo_both ; msg="" ; echo_both
}

get_json_pkg () {
	###Offline: https://www.ti.com/tool/download/SYSCONFIG/1.21.2.3837
	#dl_file="https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-nsUM6f7Vvb/1.21.2.3837/sysconfig-1.21.2_3837-setup.run"
	#wfile="sysconfig-1.21.2_3837-setup.run"

	###Offline: https://www.ti.com/tool/download/SYSCONFIG/1.22.0.3893
	dl_file="https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-nsUM6f7Vvb/1.22.0.3893/sysconfig-1.22.0_3893-setup.run"
	wfile="sysconfig-1.22.0_3893-setup.run"

	if [ -d ./tmp/ ] ; then
		rm -rf ./tmp/ || true
	fi
	wget -c ${dl_file}
	chmod +x ${wfile}
	mkdir tmp
	./${wfile} --unattendedmodeui none --mode unattended --prefix ./tmp
	tree ./tmp/dist/deviceData/ | grep AM62
	#exit 2
	cp -v ./tmp/dist/deviceData/${json_dir}/${json_file} ./
	tree -d ./tmp/dist/deviceData/ | grep -v templates
	rm -rf ./tmp/ || true
	rm -rf ${wfile} || true
}

get_name_mode () {
	#echo "debug-${ball} [cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .signalName']"
	#cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true
	#echo "debug------------------------------------------"

	name=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true)
	mode=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .mode' | sed 's/\"//g' || true)
	ioDir=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID}' .pinModeInfo['$number'] .ioDir' | sed 's/\"//g' || true)
	#echo "debug: get_name_mode; name=${name}; mode=${mode}; ioDir=${ioDir}"
}

get_name_mode_a () {
	name_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pinModeInfo['$number_a'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true)
	mode_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pinModeInfo['$number_a'] .mode' | sed 's/\"//g' || true)
	ioDir_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pinModeInfo['$number_a'] .ioDir' | sed 's/\"//g' || true)
}

get_name_mode_b () {
	name_b=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_b}' .pinModeInfo['$number_b'] .signalName' | sed 's/\"//g' | sed 's/\[/_/g' | sed 's/\]//g' || true)
	mode_b=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_b}' .pinModeInfo['$number_b'] .mode' | sed 's/\"//g' || true)
	ioDir_b=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_b}' .pinModeInfo['$number_b'] .ioDir' | sed 's/\"//g' || true)
}

echo_pwm_prefix () {
	echo "// SPDX-License-Identifier: GPL-2.0-only OR MIT" > ${pwm_overlay_file}
	echo "/*" >> ${pwm_overlay_file}
	echo " * DT Overlay for ${sch} ${pwm_node} connections within the expansion header." >> ${pwm_overlay_file}
	echo " *" >> ${pwm_overlay_file}
	echo " * Copyright (C) 2023 Texas Instruments Incorporated - https://www.ti.com/" >> ${pwm_overlay_file}
	echo " *" >> ${pwm_overlay_file}
	echo " */" >> ${pwm_overlay_file}
	echo "" >> ${pwm_overlay_file}
	echo "/dts-v1/;" >> ${pwm_overlay_file}
	echo "/plugin/;" >> ${pwm_overlay_file}
	echo "" >> ${pwm_overlay_file}
	echo "#include <dt-bindings/gpio/gpio.h>" >> ${pwm_overlay_file}
	echo "#include \"ti/k3-pinctrl.h\"" >> ${pwm_overlay_file}
	echo "" >> ${pwm_overlay_file}
	echo "/*" >> ${pwm_overlay_file}
	echo " * Helper to show loaded overlays under: /proc/device-tree/chosen/overlays/" >> ${pwm_overlay_file}
	echo "*/" >> ${pwm_overlay_file}
	echo "&{/chosen} {" >> ${pwm_overlay_file}
	echo "	overlays {" >> ${pwm_overlay_file}
}

find_pin () {
	echo "##################"
	echo "${label}"
	echo "##################" >> ${file}-pins.txt
	echo "${label}" >> ${file}-pins.txt

	for number in {0..500}
	do
		compare=$(cat ${json_file} | jq '.packages .'$package_id' .packagePin['$number'] .ball' | sed 's/\"//g' || true)
		if [ "x${compare}" = "x${ball}" ] ; then
			echo "debug-${ball}-${compare}-${number}"
			echo "debug-${ball}-${compare}-${number}" >> ${file}-pins.txt

			found_devicePinID_a=$(cat ${json_file} | jq '.packages .'$package_id' .packagePin['$number'] .devicePinID' | sed 's/\"//g' || true)
			found_ball_a=$(cat ${json_file} | jq '.packages .'$package_id' .packagePin['$number'] .ball' | sed 's/\"//g' || true)
			found_powerDomainID_a=$(cat ${json_file} | jq '.packages .'$package_id' .packagePin['$number'] .powerDomainID' | sed 's/\"//g' || true)
			echo "devicePinID_a=${found_devicePinID_a},ball_a=${found_ball_a},powerDomainID_a=${found_powerDomainID_a}"
			echo "devicePinID_a=${found_devicePinID_a},ball_a=${found_ball_a},powerDomainID_a=${found_powerDomainID_a}" >> ${file}-pins.txt
			break;
		fi
	done

	PinID_a=$(cat ${json_file} | jq '.devicePins .'${found_devicePinID_a}' .name' | sed 's/\"//g' || true)
	echo "name_a=${PinID_a}" >> ${file}-pins.txt

	cro_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .controlRegisterOffset' | sed 's/\"//g' || true)
	echo "controlRegisterOffset_a=${cro_a}" >> ${file}-pins.txt

	unset pupdStateDuringHHV_a
	pupdStateDuringHHV_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pupdStateDuringHHV' | sed 's/\"//g' || true)
	if [ ! "x${pupdStateDuringHHV_a}" = "x" ] ; then
		echo "pupdStateDuringHHV_a=${pupdStateDuringHHV_a}" >> ${file}-pins.txt
	fi

	unset pupdStateAfterHHV_a
	pupdStateAfterHHV_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pupdStateAfterHHV' | sed 's/\"//g' || true)
	if [ ! "x${pupdStateAfterHHV_a}" = "x" ] ; then
		echo "pupdStateAfterHHV_a=${pupdStateAfterHHV_a}" >> ${file}-pins.txt
	fi

	unset MCU_ADC_a
	unset got_pruout_a
	unset got_pruin_a
	unset got_uart_a
	unset got_gpio_a
	unset got_mcan_a
	unset got_i2c_a
	unset got_ehrpwm_a
	unset got_eqep_a
	unset got_spi_a
	unset got_dmtimer_a
	for number_a in {0..14}
	do
		interface_a=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pinModeInfo['$number_a'] .interfaceName' | sed 's/\"//g' || true)
		compare=$(cat ${json_file} | jq '.pinCommonInfos .'${found_devicePinID_a}' .pinModeInfo['$number_a'] .interfaceName' | sed 's/\"//g' || true)
		get_name_mode_a
		if [ "x${interface_a}" = "xnull" ] ; then
			break;
		fi
		echo ${label}:${interface_a}:${found_ball_a}:${name_a}:${mode_a}:${ioDir_a}: >> ${file}-pins.txt

		if [ "x${mode_a}" = "x0" ] ; then
			interface=${name_a}
		fi

		iopad="${main_iopad}"
		PIN_a="PIN_INPUT"
		unset type
		core="main"
		print_dts="enable"
		unset export_dts
		unset export_pwm_overlay
		unset pwm_dts

		echo "Testing [${name_a}]"
		case "${name_a}" in
		AUDIO*|CP_*|EHRPWM_TZn_IN*|GPMC*|MAIN*|TRC*|VOUT0_EXTPCLKIN)
			unset print_dts
		;;
		I2C*)
			PIN_a="PIN_INPUT_PULLUP"
			type="i2c"
		;;
		ECAP0_IN_APWM_OUT)
			PIN_a="PIN_OUTPUT"
			type="pwm-ecap"
			pwm_node="ecap0"
			pwm_address="23100000"
			pwm_export="0"
			pwm_dts="enable"
			export_pwm_overlay="enable"
		;;
		ECAP1_IN_APWM_OUT)
			PIN_a="PIN_OUTPUT"
			type="pwm-ecap"
			pwm_node="ecap1"
			pwm_address="23110000"
			pwm_export="0"
			pwm_dts="enable"
			export_pwm_overlay="enable"
		;;
		ECAP2_IN_APWM_OUT)
			PIN_a="PIN_OUTPUT"
			type="pwm-ecap"
			pwm_node="ecap2"
			pwm_address="23120000"
			pwm_export="0"
			pwm_dts="enable"
			export_pwm_overlay="enable"
		;;
		EHRPWM0_A|EHRPWM0_B)
			PIN_a="PIN_OUTPUT"
			type="pwm"
			pwm_node="epwm0"
			pwm_dts="enable"
			if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
				pwm_address="23000000"
			else
				pwm_address="3000000"
			fi
			pwm_export="0"
			if [ "x${name_a}" = "xEHRPWM0_B" ] ; then
				pwm_export="1"
			fi
			export_pwm_overlay="enable"
		;;
		EHRPWM1_A|EHRPWM1_B)
			PIN_a="PIN_OUTPUT"
			type="pwm"
			pwm_node="epwm1"
			pwm_dts="enable"
			if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
				pwm_address="23010000"
			else
				pwm_address="3010000"
			fi
			pwm_export="0"
			if [ "x${name_a}" = "xEHRPWM1_B" ] ; then
				pwm_export="1"
			fi
			export_pwm_overlay="enable"
		;;
		EHRPWM2_A|EHRPWM2_B)
			PIN_a="PIN_OUTPUT"
			type="pwm"
			pwm_node="epwm2"
			pwm_dts="enable"
			if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
				pwm_address="23020000"
			else
				pwm_address="3020000"
			fi
			pwm_export="0"
			if [ "x${name_a}" = "xEHRPWM2_B" ] ; then
				pwm_export="1"
			fi
			export_pwm_overlay="enable"
		;;
		EQEP0_*|EQEP1_*)
			type="eqep"
			export_dts="enable"
		;;
		EQEP2*)
			unset print_dts
		;;
		GPIO*)
			type="gpio"
			export_dts="enable"
			if [ ! "x${offset}" = "x" ] ; then
				pinoffset="$(echo ${cro_a} | sed 's/^..//' || true)"
				hexvalue=$(bc <<< "obase=16; ibase=16; $pinoffset")
				hexoffset=$(bc <<< "obase=16; ibase=16; $hexvalue-$offset")
				register_count=$(bc <<< "obase=10; ibase=16; $hexoffset/4")
				number_pins=$(bc <<< "$number_pins + 1")
				echo "${register_count}, ${number_pins}, ${cro_a}, ${name_a}" >> ${file}-pins.csv
			fi
			;;
		MCASP*)
			type="audio"
		;;
		MCU_GPIO*)
			iopad="${mcu_iopad}"
			type="gpio"
			core="mcu"
			export_dts="enable"
			if [ ! "x${offset}" = "x" ] ; then
				pinoffset="$(echo ${cro_a} | sed 's/^..//' || true)"
				hexvalue=$(bc <<< "obase=16; ibase=16; $pinoffset")
				hexoffset=$(bc <<< "obase=16; ibase=16; $hexvalue-$offset")
				register_count=$(bc <<< "obase=10; ibase=16; $hexoffset/4")
				number_pins=$(bc <<< "$number_pins + 1")
				echo "${register_count}, ${number_pins}, ${cro_a}, ${name_a}" >> ${file}-pins.csv
			fi
		;;
		MCU_I2C*_S*|WKUP_I2C*_S*)
			iopad="${mcu_iopad}"
			PIN_a="PIN_INPUT_PULLUP"
			type="i2c"
			core="mcu"
		;;
		MCU_SPI*)
			#iopad="${mcu_iopad}"
			#type="spi"
			#core="mcu"
			unset print_dts
		;;
		MCU_TIMER*)
			#iopad="${mcu_iopad}"
			#PIN_a="PIN_OUTPUT"
			#type="pwm-timer"
			#core="mcu"
			unset print_dts
		;;
		MCU_UART*_*TSn)
			unset print_dts
		;;
		OLDI0_*)
			unset print_dts
		;;
		PR*_PRU0_GPI*)
			type="pru0in"
			export_dts="enable"
		;;
		PR*_PRU0_GPO*)
			type="pru0out"
			PIN_a="PIN_OUTPUT"
			export_dts="enable"
		;;
		PR*_PRU1_GPI*)
			type="pru1in"
			export_dts="enable"
		;;
		PR*_PRU1_GPO*)
			type="pru1out"
			PIN_a="PIN_OUTPUT"
			export_dts="enable"
		;;
		SPI0*)
			unset print_dts
		;;
		SPI2*)
			type="spi"
		;;
		UART*_TXD)
			PIN_a="PIN_OUTPUT"
			type=$(echo ${name_a} | awk '{print tolower($0)}' | sed 's/_/-/g' || true)
			export_dts="enable"
		;;
		UART*_RXD)
			type=$(echo ${name_a} | awk '{print tolower($0)}' | sed 's/_/-/g' || true)
			export_dts="enable"
		;;
		UART*_*TSn)
			unset print_dts
		;;
		WKUP_DMTIMER*|WKUP_TIMER_IO*)
			#iopad="${mcu_iopad}"
			#PIN_a="PIN_OUTPUT"
			#type="pwm-timer"
			#core="mcu"
			unset print_dts
		;;
		WKUP_GPIO*)
			iopad="${mcu_iopad}"
			type="gpio"
			core="mcu"
			export_dts="enable"
			if [ ! "x${offset}" = "x" ] ; then
				pinoffset="$(echo ${cro_a} | sed 's/^..//' || true)"
				hexvalue=$(bc <<< "obase=16; ibase=16; $pinoffset")
				hexoffset=$(bc <<< "obase=16; ibase=16; $hexvalue-$offset")
				register_count=$(bc <<< "obase=10; ibase=16; $hexoffset/4")
				number_pins=$(bc <<< "$number_pins + 1")
				echo "${register_count}, ${number_pins}, ${cro_a}, ${name_a}" >> ${file}-pins.csv
			fi
		;;
		WKUP_UART*_TXD)
			iopad="${mcu_iopad}"
			PIN_a="PIN_OUTPUT"
			type=$(echo ${name_a} | awk '{print tolower($0)}' | sed 's/_/-/g' || true)
			core="mcu"
		;;
		WKUP_UART*_RXD)
			iopad="${mcu_iopad}"
			PIN_a="PIN_INPUT"
			type=$(echo ${name_a} | awk '{print tolower($0)}' | sed 's/_/-/g' || true)
			core="mcu"
		;;
		esac

		if [ "x${print_dts}" = "xenable" ] ; then
			echo "${name_a}"
			labela=$(echo ${label} | sed 's/_/-/g' || true)
			if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
				cro_aa="0x$(echo ${cro_a} | sed 's/^...//' || true)"
			else
				cro_aa="${cro_a}"
			fi
			typeu=$(echo ${type} | sed 's/-/_/g' || true)
			gpio_sch=$(echo ${sch} | awk '{print tolower($0)}' || true)

			if [ "x${export_pwm_overlay}" = "xenable" ] ; then
				k3gpio=$(echo ${sch} | awk '{print tolower($0)}' || true)
				if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
					pwm_overlay_prefix="k3-am67a-beagley-ai-pwm-${pwm_node}-${k3gpio}"
				else
					pwm_overlay_prefix="k3-j721e-beagleboneai64-pwm-${pwm_node}-${k3gpio}"
				fi
				pwm_overlay_file="${k3file}-pwm-${pwm_node}-${k3gpio}.dts"
				echo_pwm_prefix
				echo "		${pwm_overlay_prefix}.kernel = __TIMESTAMP__;" >> ${pwm_overlay_file}
				if [ "x${json_dir}" = "xJ722S_TDA4VEN_TDA4AEN_AM67" ] ; then
					echo "		${labela}.${pwm_address}.pwm = \"${pwm_overlay_prefix}.${pwm_address}.${pwm_export}.${sch}\";" >> ${pwm_overlay_file}
				fi
				echo "		${gpio_sch}.${pwm_address}.pwm = \"${pwm_overlay_prefix}.${pwm_address}.${pwm_export}.${sch}\";" >> ${pwm_overlay_file}
				echo "	};" >> ${pwm_overlay_file}
				echo "};" >> ${pwm_overlay_file}
				echo "" >> ${pwm_overlay_file}
				echo "&main_pmx0 {" >> ${pwm_overlay_file}
				echo "	${label}_${typeu}: ${labela}-${type}-pins {" >> ${pwm_overlay_file}
				echo "		pinctrl-single,pins = <" >> ${pwm_overlay_file}
				if [ "x${mode_a}" = "x0" ] ; then
					echo "			${iopad}(${cro_aa}, ${PIN_a}, ${mode_a}) /* (${found_ball_a}) ${interface} */" >> ${pwm_overlay_file}
				else
					echo "			${iopad}(${cro_aa}, ${PIN_a}, ${mode_a}) /* (${found_ball_a}) ${interface}.${name_a} */" >> ${pwm_overlay_file}
				fi
				echo "		>;" >> ${pwm_overlay_file}
				echo "	};" >> ${pwm_overlay_file}
				echo "};" >> ${pwm_overlay_file}
				echo "" >> ${pwm_overlay_file}
				echo "&${pwm_node} {" >> ${pwm_overlay_file}
				echo "	pinctrl-names = \"default\";" >> ${pwm_overlay_file}
				echo "	pinctrl-0 = <&${label}_${typeu}>;" >> ${pwm_overlay_file}
				echo "	status = \"okay\";" >> ${pwm_overlay_file}
				echo "};" >> ${pwm_overlay_file}
			fi

			if [ ! "x${type}" = "x" ] ; then
				echo "	${label}_${typeu}: ${labela}-${type}-pins {" >> ${file}-${core}-pinmux.txt
				#echo "		/* ${label}:${interface_a}:${found_ball_a}:${name_a}:${mode_a}:${ioDir_a}: */" >> ${file}-${core}-pinmux.txt
				echo "		pinctrl-single,pins = <" >> ${file}-${core}-pinmux.txt
				if [ "x${mode_a}" = "x0" ] ; then
					echo "			${iopad}(${cro_aa}, ${PIN_a}, ${mode_a}) /* (${found_ball_a}) ${interface} */" >> ${file}-${core}-pinmux.txt
				else
					echo "			${iopad}(${cro_aa}, ${PIN_a}, ${mode_a}) /* (${found_ball_a}) ${interface}.${name_a} */" >> ${file}-${core}-pinmux.txt
				fi
				echo "		>;" >> ${file}-${core}-pinmux.txt
				echo "	};" >> ${file}-${core}-pinmux.txt
				echo "" >> ${file}-${core}-pinmux.txt
			fi
		fi
	done
}

mark_hole () {
	register_count=$(bc <<< "$register_count + 1")
	register=$(bc <<< "obase=16; ibase=10; $register_count*4")
	register=$(bc <<< "obase=16; ibase=16; $register+$offset")
	echo "${register_count}, 0, 0x${register}, HOLE" >> ${file}-pins.csv
}

found_hole () {
	#pinctrl-single,gpio-range = pin base, nr pins & gpio function
	echo "<&main_pmx0_range ${pinctrl_single_pin_base} ${number_pins} PIN_GPIO_RANGE_IOPAD>," >> ${file}-pins-gpio-main-a.txt

	#    gpio-ranges = <&foo 0 20 10>, <&bar 10 50 20>;
	#
	#This means:
	#- pins 20..29 on pin controller "foo" is mapped to GPIO line 0..9 and
	#- pins 50..69 on pin controller "bar" is mapped to GPIO line 10..29
	echo "<&main_pmx0 ${gpio_ranges_line_start} ${pinctrl_single_pin_base} ${number_pins}>," >> ${file}-pins-gpio-main-b.txt

	pinctrl_single_pin_base=$(bc <<< "$pinctrl_single_pin_base + $number_pins + 1")
	gpio_ranges_line_start=$(bc <<< "$gpio_ranges_line_start + $number_pins")
	number_holes=$(bc <<< "$number_holes + 1")
	number_pins=0
}

found_hole_mcu () {
	#pinctrl-single,gpio-range = pin base, nr pins & gpio function
	echo "<&mcu_pmx_range ${pinctrl_single_pin_base} ${number_pins} PIN_GPIO_RANGE_IOPAD>," >> ${file}-pins-gpio-mcu-a.txt

	#    gpio-ranges = <&foo 0 20 10>, <&bar 10 50 20>;
	#
	#This means:
	#- pins 20..29 on pin controller "foo" is mapped to GPIO line 0..9 and
	#- pins 50..69 on pin controller "bar" is mapped to GPIO line 10..29
	echo "<&mcu_pmx0 ${gpio_ranges_line_start} ${pinctrl_single_pin_base} ${number_pins}>," >> ${file}-pins-gpio-mcu-b.txt

	pinctrl_single_pin_base=$(bc <<< "$pinctrl_single_pin_base + $number_pins + 1")
	gpio_ranges_line_start=$(bc <<< "$gpio_ranges_line_start + $number_pins")
	number_holes=$(bc <<< "$number_holes + 1")
	number_pins=0
}

found_hole_wkup () {
	#pinctrl-single,gpio-range = pin base, nr pins & gpio function
	echo "<&wkup_pmx_range ${pinctrl_single_pin_base} ${number_pins} PIN_GPIO_RANGE_IOPAD>," >> ${file}-pins-gpio-mcu-a.txt

	#    gpio-ranges = <&foo 0 20 10>, <&bar 10 50 20>;
	#
	#This means:
	#- pins 20..29 on pin controller "foo" is mapped to GPIO line 0..9 and
	#- pins 50..69 on pin controller "bar" is mapped to GPIO line 10..29
	echo "<&wkup_pmx0 ${gpio_ranges_line_start} ${pinctrl_single_pin_base} ${number_pins}>," >> ${file}-pins-gpio-mcu-b.txt

	pinctrl_single_pin_base=$(bc <<< "$pinctrl_single_pin_base + $number_pins + 1")
	gpio_ranges_line_start=$(bc <<< "$gpio_ranges_line_start + $number_pins")
	number_holes=$(bc <<< "$number_holes + 1")
	number_pins=0
}

reset_gpio () {
	if [ -f ${file}-pins-gpio-main-a.txt ] ; then
		rm ${file}-pins-gpio-main-a.txt || true
	fi
	if [ -f ${file}-pins-gpio-main-b.txt ] ; then
		rm ${file}-pins-gpio-main-b.txt || true
	fi
	if [ -f ${file}-pins-gpio-mcu-a.txt ] ; then
		rm ${file}-pins-gpio-mcu-a.txt || true
	fi
	if [ -f ${file}-pins-gpio-mcu-b.txt ] ; then
		rm ${file}-pins-gpio-mcu-b.txt || true
	fi
}

finalize_gpio () {
	echo "# main_gpio" > ${file}-pins-gpio.txt
	cat ${file}-pins-gpio-main-a.txt >> ${file}-pins-gpio.txt
	echo "" >> ${file}-pins-gpio.txt
	cat ${file}-pins-gpio-main-b.txt >> ${file}-pins-gpio.txt
	echo "" >> ${file}-pins-gpio.txt
	echo "# mcu_gpio" >> ${file}-pins-gpio.txt
	cat ${file}-pins-gpio-mcu-a.txt >> ${file}-pins-gpio.txt
	echo "" >> ${file}-pins-gpio.txt
	cat ${file}-pins-gpio-mcu-b.txt >> ${file}-pins-gpio.txt
	echo "" >> ${file}-pins-gpio.txt
	reset_gpio
}

if [ ! -f ${json_file} ] ; then
	get_json_pkg
fi
#