#!/bin/sh
#
# Copyright (C) 2017 Chris Blake <chrisrblake93@gmail.com>
#
# Custom upgrade script for Meraki NAND devices
#

. /lib/functions.sh
. /lib/functions/system.sh

get_magic_at() {
	local mtddev=$1
	local pos=$2
	dd bs=1 count=2 skip=$pos if=$mtddev 2>/dev/null | hexdump -v -n 4 -e '1/1 "%02x"'
}

meraki_is_caldata_valid() {
	local board=$1
	local mtddev=$2
	local magic

	case "$board" in
	"mr33")
		magic=$(get_magic_at $mtddev 4096)
		[ "$magic" != "202f" ] && return 0

		magic=$(get_magic_at $mtddev 20480)
		[ "$magic" != "202f" ] && return 0

		magic=$(get_magic_at $mtddev 36864)
		[ "$magic" != "4408" ] && return 0

		return 1
		;;
	*)
		return 1
		;;
	esac
}

merakinand_copy_caldata() {
	local cal_src=$1
	local cal_dst=$2
	local ubidev="$(nand_find_ubi $CI_UBIPART)"
	local board_name="$(board_name)"
	local rootfs_size="$(ubinfo /dev/ubi0 -N rootfs_data | grep "Size" | awk '{ print $6 }')"

	# Setup partitions using board name, in case of future platforms
	case "$board_name" in
	"mr33")
		# Src is MTD
		mtd_src="$(find_mtd_chardev $cal_src)"
		[ -n "$mtd_src" ] || {
			echo "no mtd device found for partition $cal_src"
			exit 1
		}

		# Dest is UBI
		# TODO: possibly add create (hard to do when rootfs_data is expanded & mounted)
		# Would need to be done from ramdisk
		mtd_dst="$(nand_find_volume $ubidev $cal_dst)"
		[ -n "$mtd_dst" ] || {
			echo "no ubi device found for partition $cal_dst"
			exit 1
		}

		meraki_is_caldata_valid "$board_name" "$mtd_src" && {
			echo "no valid calibration data found in $cal_src"
			exit 1
		}

		meraki_is_caldata_valid "$board_name" "/dev/$mtd_dst" && {
			echo "Copying calibration data from $cal_src to $cal_dst..."
			dd if="$mtd_src" of=/tmp/caldata.tmp 2>/dev/null
			ubiupdatevol "/dev/$mtd_dst" /tmp/caldata.tmp
			rm /tmp/caldata.tmp
			sync
		}
		return 0
		;;
	*)
		echo "Unsupported device $board_name";
		return 1
		;;
	esac
}

platform_do_upgrade_merakinand() {
	local tar_file="$1"
	local board_name="$(board_name)"

	# Do we need to do any platform tweaks?
	case "$board_name" in
	"mr33")
		# Check and create UBI caldata if it's invalid
		merakinand_copy_caldata "ART" "ART"

		nand_do_upgrade $1
		;;
	*)
		echo "Unsupported device $board_name";
		exit 1
		;;
	esac
}
