#!/bin/bash

SRC_DIR="32x32"
SRC_DIR_ABS=$(realpath "$SRC_DIR")

SIZES=("64x64" "128x128" "256x256" "512x512" "1024x1024")
SCALE_FACTORS=(200% 400% 800% 1600% 3200%)

process_image() {
	local size_dir="$1"
	local scale="$2"
	local file="$3"

	local file_abs
	file_abs=$(realpath "$file")
	local rel_path
	rel_path=$(realpath --relative-to="$SRC_DIR_ABS" "$file_abs")
	rel_path="${rel_path#/}"

	local out_path="$size_dir/$rel_path"
	mkdir -p "$(dirname "$out_path")"
	magick "$file_abs" -filter point -resize "$scale" "$out_path"
	echo "Created: $out_path"
}

export -f process_image
export SRC_DIR_ABS

files=( $(find "$SRC_DIR" -type f -iname "*.png") )

for i in "${!SIZES[@]}"; do
	size="${SIZES[i]}"
	scale="${SCALE_FACTORS[i]}"
	printf "%s\n" "${files[@]}" | parallel --jobs 0 process_image "$size" "$scale" {}
done
