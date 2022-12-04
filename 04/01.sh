#!/bin/sh

common=0

while read -r line; do
	range0="${line%,*}"
	min0="${range0%-*}"
	max0="${range0#*-}"

	range1="${line#*,}"
	min1="${range1%-*}"
	max1="${range1#*-}"

	if [ "$min0" -le "$min1" ] && [ "$max0" -ge "$max1" ]; then
		common="$(( common + 1 ))"
		continue
	fi

	if [ "$min0" -ge "$min1" ] && [ "$max0" -le "$max1" ]; then
		common="$(( common + 1 ))"
		continue
	fi
done

echo "$common"
