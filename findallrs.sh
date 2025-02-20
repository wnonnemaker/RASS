#!/bin/bash
# A script to find all rs files and copy them to a new directory

EXT=".rs"
echo "You are looking for $EXT files" 
find . -name "*.rs" -print > rustfiles.txt
echo "I found $(wc -l rustfiles.txt) files for you!" 

FOLDER="${EXT:1}dir"
mkdir $FOLDER

read -p "Do you want to copy all those files to $FOLDER? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Continuing..."
else
    echo "Operation canceled."
    exit 1
fi


for file in $(cat rustfiles.txt)
    do
        echo "copying $file"
        cp $file $FOLDER
    done
