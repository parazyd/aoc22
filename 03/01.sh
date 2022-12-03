#!/bin/sh

priority() {
	case "$1" in
	[a-z]) python -c "print(ord('$1') - 96)" ;;
	[A-Z]) python -c "print(ord('$1') - 38)" ;;
	esac
}

answer=0

while read -r line; do
	first="$(echo "$line" | awk '{print substr($0,1,length/2);}')"
	secnd="$(echo "$line" | awk '{print substr($0,length/2+1);}')"

	ffd="$(mktemp)"
	sfd="$(mktemp)"

	printf "%s" "$first" | fold -w1 | sort -u > "$ffd"
	printf "%s" "$secnd" | fold -w1 | sort -u > "$sfd"

	common="$(comm -12 "$ffd" "$sfd")"
	prio="$(priority "$common")"
	answer="$(( answer + prio ))"

	rm -f "$ffd" "$sfd"
done

echo "$answer"
