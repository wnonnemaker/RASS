#!/bin/bash
# A script to find all rs files and copy them to a new directory
echo "welcome to the extension finder!"

while true; do
#read extension 
    echo "What extension would you like to find and copy? (type none to exit)"
    read EXT
    if [[ "$EXT" == "none" ]]; then
        echo "We done here"
        exit 1
    fi

    echo "You are looking for $EXT files" 

  #ask where they want to search
    read -p "What directory would you like to search in? " SEARCHDIR
    SEARCHDIR="$(eval echo ${SEARCHDIR//>})"

 #create holder file for filenames
    HOLDER="${EXT:1}files.txt"

    find "$SEARCHDIR" -name "*${EXT}" -print > "$HOLDER"
    echo "I found $(wc -l ${HOLDER}) files for you!" 

    FOLDER="${EXT:1}dir"
    mkdir $FOLDER

  #copy the files from holder into a directory
    read -p "Do you want to copy all those files to $FOLDER? (y/n): " answer
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        echo "Continuing..."
    else
        echo "Operation canceled."
        exit 1
    fi


    for file in $(cat ${HOLDER})
        do
            echo "copying $file"
            cp $file $FOLDER
        done
    rm "$HOLDER" 
  done

