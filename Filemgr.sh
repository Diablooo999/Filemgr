#!/bin/bash

# Made by Piotr Sobczyk 

# filemgr

#`filemgr` is a script designed to find, modify, and delete files and directories. It allows you to search for files or directories, and perform actions such as deletion.

## Usage

## - **To manage files**:
#  - The script will prompt you to enter the file name you want to track.
#  - You can then select a file from the search results and choose to delete it.

## - **To manage directories**:
#  - The script will prompt you to enter the directory name you want to track.
#  - You can then select a directory from the search results and choose to delete it.

## Warning

#**This script can potentially destroy your system if you delete critical files or #directories.** Use with caution, especially when deleting system directories like `/etc` or `/#bin`. Always ensure that you are deleting only the intended files or directories.

## Created

# 30.07.2024

## Last Modified

# 30.07.2024 16:07

if [ $EUID -ne 0 ]; then 
	echo "You have to run this script as root"
	sleep 3 
	exit
fi 


echo "Do you want to track File or Directory? (F/D)"
read ANSWER
LOWERCASE=$(echo "$ANSWER" | tr '[:upper:]' '[:lower:]')

if [ "$LOWERCASE" = "f" ]; then
    echo "What file do you want to track?"
    read FILE
    echo "Searching for file..."
    sleep 1 

    
    PATHFILE=$(locate "$FILE" | grep -v '/$')

    if [ -z "$PATHFILE" ]; then
        echo "File not found."
    else
        count=1
        echo "Found files:"
        FILES=()  
        while IFS= read -r path; do
            echo "$count. $path"
            FILES+=("$path")
            count=$((count + 1))
        done <<< "$PATHFILE"
        
        echo "Enter the number of the file you want to delete:"
        read FILE_CHOICE
        if [[ $FILE_CHOICE -ge 1 && $FILE_CHOICE -le ${#FILES[@]} ]]; then
            SELECTED_FILE="${FILES[$((FILE_CHOICE - 1))]}"
            echo "Selected file: $SELECTED_FILE"
            echo "Are you sure you want to delete this file? (yes/no)"
            read CONFIRM

            if [ "$CONFIRM" = "yes" ]; then
                echo "Deleting $SELECTED_FILE..."
                rm "$SELECTED_FILE"
                echo "File deleted."
            else
                echo "File deletion canceled."
            fi
        else
            echo "Invalid choice."
        fi
    fi

elif [ "$LOWERCASE" = "d" ]; then
    echo "What directory do you want to track?"
    read DIR
    echo "Searching for directory..."
    sleep 1 

    
    DIRPATH=$(find / -type d -name "*$DIR*" 2>/dev/null)

    if [ -z "$DIRPATH" ]; then 
        echo "Directory not found."
    else 
        X=1
        echo "Found directories:"
        DIRECTORIES=()  
        while IFS= read -r dirpath; do
            echo "$X. $dirpath"
            DIRECTORIES+=("$dirpath")
            X=$((X + 1))
        done <<< "$DIRPATH"
        
        echo "Enter the number of the directory you want to delete:"
        read DIR_CHOICE
        if [[ $DIR_CHOICE -ge 1 && $DIR_CHOICE -le ${#DIRECTORIES[@]} ]]; then
            SELECTED_DIR="${DIRECTORIES[$((DIR_CHOICE - 1))]}"
            echo "Selected directory: $SELECTED_DIR"
            echo "Are you sure you want to delete this directory and its contents? (yes/no)"
            read CONFIRM

            if [ "$CONFIRM" = "yes" ]; then
                echo "Deleting $SELECTED_DIR..."
                rm -r "$SELECTED_DIR"
                echo "Directory deleted."
            else
                echo "Directory deletion canceled."
            fi
        else
            echo "Invalid choice."
        fi
    fi
else
    echo "Invalid option. Please enter 'F' for file or 'D' for directory."
fi

