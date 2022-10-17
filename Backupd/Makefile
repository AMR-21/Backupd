.phony: all verify_dir verify_backupdir verify_time_max start

all: verify_dir verify_backupdir verify_time_max start

# Receiving inputs from user
dir := $(shell bash -c 'read -p "Source directory name: " directory; echo $$directory')
backupdir := $(shell bash -c 'read -p "Backup directory name: " backupdirectory; echo $$backupdirectory')
time := $(shell bash -c 'read -p "Interval between backup checks (secs): " interval; echo $$interval')
max := $(shell bash -c 'read -p "Maximum number of backups: " maximum; echo $$maximum')

# Verify source directory
verify_dir:
	@if ! cd ../$(dir); then \
		clear ; \
		echo "\nError: The given directory was not found, Please re-enter the inputs\n" ; \
		make ; \
	fi

# Verify backup directory
verify_backupdir:
	@if ! cd ../$(backupdir); then \
		cd ../  ;\
		mkdir $(backupdir) ;\
		cd Backupd ; \
		echo "\nWarning: The given backup directory was not found, $(backupdir) has been created\n" ; \
		sleep 5 ;\
	fi

# Verify interval and maximum
verify_time_max:
	@if [ ! $(max) ] | [ ! $(time) ]; then \
		clear ; \
		echo "\nError: Interval and/or maximum should not be empty\n" ; \
		make ; \
	fi 

start:
	clear
	./backupd.sh $(dir) $(backupdir) $(time) $(max)


