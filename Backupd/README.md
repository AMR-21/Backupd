# Backupd

Backupd is a Shell Script for backing up files upon modifications.

## Overview

The script is designed to watch a directory and check for modifications on a given interval of time (in seconds). Once a modification is spotted it will we backed-up to the specified backup directory. Along with the code, there is a Makefile to receive inputs, validate them, and run the script.  
The code directory contains the following files:

```markdown
Backupd/
├── backupd.sh
├── Makefile
└── README.md
```

The program does not require any perquisites

## Installation

Download the whole code as a zip and unzip it in the parent directory of the target directory, just like the following hierarchy:

```markdown
parent/
├── Backupd/
│ ├── backupd.sh
│ ├── Makefile
│ └── README.md
│
└── backup me/
```

To clarify it, assume we want to backup a directory on the desktop called Test with file [ a.txt b.txt c.txt ], so the correct hierarchy should be:

```markdown
Desktop/
├── Backupd/
│ ├── backupd.sh
│ ├── Makefile
│ └── README.md
│
├── Test/
│ ├── a.txt
│ ├── b.txt
│ └── c.txt
└──
```

### Optional

You can create the backup directory manually on the same level as Backupd directory and the target directory:

```markdown
Desktop/
├── Backupd/
├── Test/
└── backupdir/
```

## Usage

### Method 1 - Makefile (recommended)

Consider the following steps to run the script:

1 Open the Backupd directory in the terminal

2 Type make

```bash
 ../Backupd$ make
```

3 You will be asked to enter some data, like this:

```bash
Source directory name: test
Backup directory name: backup
Interval between backup checks (secs): 5
Maximum number of backups: 5
```

### Notes

- You have to make sure that the source directory exists on the same hierarchal level as the Backupd
- If you entered a non existing backup directory name, a new one will be created automatically with same name after 5 seconds (automated).
- Interval and Maximum values should be integers

4 Once you are done, you will see a message like this

```bash
./backupd.sh test backup 5 5
Backup complete at 2022-10-17-00-48-45 under backup

```

5 When a modification occurs in the watched directory, it will be backed-up to the backup directory in folder named with date modification and you see a message like this

```bash
test modified
Backup underway ...
Backup complete at 2022-10-17-00-52-37 under backup
```

### Method 2 - Terminal

1 Open the Backupd directory in the terminal

2 Type ./backupd.sh and pass needed arguments in the following order:

```bash
 ../Backupd$ ./backupd.sh source backupdir interval maximum
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
