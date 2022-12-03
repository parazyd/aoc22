#!/bin/sh

priority() {
	case "$1" in
	[a-z]) python -c "print(ord('$1') - 96)" ;;
	[A-Z]) python -c "print(ord('$1') - 38)" ;;
	esac
}

answer=0

while read -r line0; read -r line1; read -r line2; do
	ffd="$(mktemp)"
	sfd="$(mktemp)"
	tfd="$(mktemp)"
	tmp="$(mktemp)"

	echo "$line0" | fold -w1 | sort -u > "$ffd"
	echo "$line1" | fold -w1 | sort -u > "$sfd"
	echo "$line2" | fold -w1 | sort -u > "$tfd"

	comm -12 "$ffd" "$sfd" | sort -u > "$tmp"

	prio="$(priority "$(comm -12 "$tmp" "$tfd")")"

	answer="$(( answer + prio ))"

	rm -f "$ffd" "$sfd" "$tfd" "$tmp"
done

echo "$answer"
