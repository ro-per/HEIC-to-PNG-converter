#!/bin/bash

folder="*.HEIC"

# ------------------------ FUNCTIONS ------------------------
function convert_files {
    echo "starting to convert $total files"
    count=0
    for filename in $folder; do
        new_name="${filename%.*}.png"
        count=$((count+1))
        percentage=$((count*100/total))
        echo "Converting $new_name -------------- $percentage%"
        
        heif-convert "$filename" "$new_name"
    done
}

# ------------------------ COUNT NUMBER OF FILES ------------------------
count="$(find $folder -maxdepth 1 -type f  -printf x | wc -c)"
total=$count

# ------------------------ ASK TO CONTINUE ------------------------
read -r -p "Do you want to convert $total files? [Y/n]" choice
case "$choice" in
    n|N) echo "Exit";;
    y|Y) convert_files;;
    *) convert_files;;
esac
