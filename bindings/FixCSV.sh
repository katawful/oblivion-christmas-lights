#!/bin/bash

# this puts the input GIFT CSV into an Oblivion readable format

INPUT=$1
if [[ "${INPUT: -4}" != ".csv" ]]; then
	echo "Error: not a csv file, exiting"
	exit
fi

# rename file
FILENAME="${INPUT%.*}"
FILENAME="$FILENAME.log"
cp "$INPUT" "$FILENAME"

# fancy regex so we add the commas before the dos newline
sed -i "s/\(.\+[0-9]\)\(\r*\)/,\1,\2/g" "$FILENAME"
