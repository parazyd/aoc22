#!/bin/sh

pc_score=0
me_score=0

while read -r line; do
	pc="${line% *}"
	me="${line#* }"

	# A, X => rock, 1
	# B, Y => paper, 2
	# C, Z => scissors, 3
	case "${pc}${me}" in
	AX)
		pc_score=$(( pc_score + 1 + 3 ))
		me_score=$(( me_score + 1 + 3 ))
		;;
	AY)
		pc_score=$(( pc_score + 1 + 0 ))
		me_score=$(( me_score + 2 + 6 ))
		;;
	AZ)
		pc_score=$(( pc_score + 1 + 6 ))
		me_score=$(( me_score + 3 + 0 ))
		;;
	BX)
		pc_score=$(( pc_score + 2 + 6 ))
		me_score=$(( me_score + 1 + 0 ))
		;;
	BY)
		pc_score=$(( pc_score + 2 + 3 ))
		me_score=$(( me_score + 2 + 3 ))
		;;
	BZ)
		pc_score=$(( pc_score + 2 + 0 ))
		me_score=$(( me_score + 3 + 6 ))
		;;
	CX)
		pc_score=$(( pc_score + 3 + 0 ))
		me_score=$(( me_score + 1 + 6 ))
		;;
	CY)
		pc_score=$(( pc_score + 3 + 6 ))
		me_score=$(( me_score + 2 + 0 ))
		;;
	CZ)
		pc_score=$(( pc_score + 3 + 3 ))
		me_score=$(( me_score + 3 + 3 ))
		;;
	esac
done

echo "$me_score"
