# Backupd - Cron

Backupd - Cron is an automated Shell Script for backing up files upon modifications.

## Overview

The script is designed to watch a directory and check for modifications on a given durations using cron job, learn more about [cron jobs](https://www.freecodecamp.org/news/cron-jobs-in-linux). Once a modification is spotted it will we backed-up to the backups directory.
The code directory contains the following files:

```markdown
Backupd/
├── backupd.sh
└── config.cfg
```

The program requires cron to be on the machine, you can see the steps of cron installation/verification below

## Installation

### Backupd-Cron

Download the whole code as a zip and unzip it in the root directory in your system (eg. Home in Ubuntu), and also the source directory in the root, just like the following hierarchy:

```markdown
root/
├── Backupd-Cron/
│ ├── backupd-cron.sh
│ ├── config.cfg
│ └── README.md
│
└── backup me/
```

To clarify it, assume we want to backup a directory on the desktop called Test with file [ a.txt b.txt c.txt ], so the correct hierarchy should be:

```markdown
root/
├── Backupd-Cron/
│ ├── backupd-cron.sh
│ ├── config.cfg
│ └── README.md
│
├── Test/
│ ├── a.txt
│ ├── b.txt
│ └── c.txt
└──
```

#### Optional

You can create the backup directory named backups manually on the root directory:

```markdown
root/
├── Backupd/
├── Test/
└── backups/
```

### Cron

Following steps work on linux only

1 Open the terminal and type the following

```bash
 $ crontab -e
```

2 If your are not allowed to access crontab, modify the access, then restart the terminal, otherwise jump to next step 3

```bash
 $ sudo cat cron.allow $user
```

3 Restart the terminal then add cron jobs to the linux:

```bash
 $ sudo systemctl status cron.service
```

4 Type crontab -e to add the backupd job (if prompted, select option 1)

```bash
 $ crontab -e
```

5 Navigate to the end of text shown and add the job like the following:

```bash
 * * * * * ~/Backupd-Cron/backupd-cron.sh
```

6 To generate the interval of repetition you can use [crontab guru](https://crontab.guru/#*_*_*_*_*), for example to run the backup every 3rd Friday
of the month at 12:31 am, it will be as the following:

```bash
 31 0 3 * fri ~/Backupd-Cron/backupd-cron.sh
```

7 Save and exit

8 You can check that your cron job is working by typing:

```bash
 $ crontab -l
```

## Usage

1 Open the config.cfg file

2 Type the name of source directory and maximum number allowed of backups, for example:

```cfg
test
10
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
