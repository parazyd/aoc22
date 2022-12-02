#!/bin/sh

pc_score=0
me_score=0

while read -r line; do
	pc="${line% *}"
	me="${line#* }"

	# A => rock, 1
	# B => paper, 2
	# C => scissors, 3
	# X => lose
	# Y => draw
	# Z => win
	case "${pc}${me}" in
	AX)
		pc_score=$(( pc_score + 1 + 6 ))
		me_score=$(( me_score + 3 + 0 ))
		;;
	BX)
		pc_score=$(( pc_score + 2 + 6 ))
		me_score=$(( me_score + 1 + 0 ))
		;;
	CX)
		pc_score=$(( pc_score + 3 + 6 ))
		me_score=$(( me_score + 2 + 0 ))
		;;
	AY)
		pc_score=$(( pc_score + 1 + 3 ))
		me_score=$(( me_score + 1 + 3 ))
		;;
	BY)
		pc_score=$(( pc_score + 2 + 3 ))
		me_score=$(( me_score + 2 + 3 ))
		;;
	CY)
		pc_score=$(( pc_score + 3 + 3 ))
		me_score=$(( me_score + 3 + 3 ))
		;;
	AZ)
		pc_score=$(( pc_score + 1 + 0 ))
		me_score=$(( me_score + 2 + 6 ))
		;;
	BZ)
		pc_score=$(( pc_score + 2 + 0 ))
		me_score=$(( me_score + 3 + 6 ))
		;;
	CZ)
		pc_score=$(( pc_score + 3 + 0 ))
		me_score=$(( me_score + 1 + 6 ))
		;;
	esac
done

echo "$me_score"
