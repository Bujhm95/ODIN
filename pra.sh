#!/bin/bash

echo "По сколько строк выводить результат?"
read res1
get_size() {
	local path="$1"
	local size=$(du -sh "$path" 2>/dev/null | cut -f1)
	echo $size
}

items=$(ls -AQ)

for item in .* *; do
	if [[ "$item" == ".." ]]; then
		continue
	fi
	size=$(get_size "$item")
	echo -e "$size\t$item"
done | sort -hr -k1 | more -$res1

