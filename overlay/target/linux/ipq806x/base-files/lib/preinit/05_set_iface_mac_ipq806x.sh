#!/bin/sh

. /lib/functions.sh

fetch_mac_from_file() {
	local path="$1"
	local offset="$2"

	if [ -z "$path" ]; then
		echo "fetch_mac_from_file: file $path not found!" >&2
		return
	fi

	hexdump -v -n 6 -s $offset -e '5/1 "%02x:" 1/1 "%02x"' $path 2>/dev/null
}

preinit_set_mac_address() {
	case $(board_name) in
		mr33)
			mac_lan=$(fetch_mac_from_file "/sys/bus/i2c/devices/0-0050/eeprom" 102)
			[ -n "$mac_lan" ] && ifconfig eth0 hw ether "$mac_lan"
			;;
	esac
}

boot_hook_add preinit_main preinit_set_mac_address
