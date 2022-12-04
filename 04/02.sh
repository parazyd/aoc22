#!/bin/sh

common=0

while read -r line; do
	range0="${line%,*}"
	min0="${range0%-*}"
	max0="${range0#*-}"

	range1="${line#*,}"
	min1="${range1%-*}"
	max1="${range1#*-}"

	if [ "$min1" -ge "$min0" ] && [ "$min1" -le "$max0" ]; then
		common="$(( common + 1 ))"
		continue
	fi

	if [ "$max1" -ge "$min0" ] && [ "$max1" -le "$max0" ]; then
		common="$(( common + 1 ))"
		continue
	fi

	if [ "$min0" -ge "$min1" ] && [ "$min0" -le "$max1" ]; then
		common="$(( common + 1 ))"
		continue
	fi

	if [ "$max0" -ge "$min1" ] && [ "$max0" -le "$max1" ]; then
		common="$(( common + 1 ))"
		continue
	fi
done

echo "$common"
