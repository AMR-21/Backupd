#!/bin/bash

# Variables
dir=$1
backupdir=$2
interval=$3
max=$4

if [[ $dir = "" || $backupdir = "" || $interval = "" || $max = ""  ]]; 
then 
  clear
  echo -e "\nSome arguments are empty, re-enter them\n"
  make
fi

clear

copyFile() {
  # Move to backup directory
  cd ../$backupdir

  # Check limit of backups
  dirs=$(ls | wc -l)

  # Delete
  if [[ $dirs -ge $max ]]; then
    files=(*)
    rm -r ${files[0]}
  fi

  # Generate date
  currentDate=$(date +"%Y-%m-%d-%H-%M-%S")

  # Backup directory
  mkdir $currentDate

  # Copy original directory
  cp -r ../$dir ./$currentDate

  # Return to program directory
  cd ../Backupd

  echo "Backup complete at $currentDate under $backupdir"
}


# Verify Numbers
re='^[0-9]+$'

if ! [[ $interval =~ $re ]] ; then
   echo -e "\nError: Interval should be an integer\n";
   make
fi

if ! [[ $max =~ $re ]] ; then
   echo -e "\nError: Maximum should be an integer\n";
   make
fi

# Get initial directory info
ls -lR ../$dir >directory-info.last

# Initial backup
copyFile

# Supervision Start
while true; do
  sleep $interval

  # Save current directory info
  ls -lR ../$dir >directory-info.new

  if ! cmp --silent directory-info.last directory-info.new; then
    echo "$dir modified"
    echo "Backup underway ..."
    # Backup modified file
    copyFile

    # Update directory info
    cp directory-info.new directory-info.last
  fi
done
