#!/bin/sh

elves=""
elf=0

while read -r line; do
	if [ -z "$line" ]; then
		elves="$elves $elf"
		elf=0
		continue
	fi
	elf=$(( elf + line ))
done

printf "%s" "$elves" | tr ' ' '\n' | sort -n | tail -n3 | while read -r line; do
	tot=$(( tot + line ))
	echo "$tot"
done | tail -n1
