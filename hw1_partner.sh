#!/usr/bin/bash
file_name='git_address.txt'
line_break='=============='
original_directory=$(pwd)
file=$(cat $file_name)
for line in $file
do
    IFS="," read -r url folder_path <<< "$line"
    if [ -d "$folder_path" ]; then
        cd "$folder_path"
        git pull
        cd "$original_directory"
    else
        git clone "$url" "$folder_path"
    fi
    ls -l
    echo "$line_break"
done