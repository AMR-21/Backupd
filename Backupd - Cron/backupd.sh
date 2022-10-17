#!/bin/bash

# Variables
dir=$1
backupdir=$2
interval=$3
max=$4

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
