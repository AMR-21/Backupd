#!/bin/bash

# Directories data
data=('dir' 'max')

cd ./Backupd-Cron

# Configure file
config='config.cfg'

i=0
while read line; do
  data[i]="$line"
  i=$(($i + 1))

  if [[ $i -eq 2 ]]; then
    break
  fi

done <$config

dir=${data[0]}
max=${data[1]}

copyFile() {
  # Move to backup directory
  cd ../backups

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
  cd ../Backupd-Cron
  echo "Backup complete at $currentDate" >>./log.txt
}

# Save current directory info
ls -lR ../$dir >directory-info.new

if ! cmp --silent directory-info.last directory-info.new; then
  # Backup modified file
  copyFile

  # Update directory info
  cp directory-info.new directory-info.last
fi
