## Basic Unix Commands

### 1. `cal`

Option | Description
------- | -------
`-1` | Displays the current month only (default).
`-3` | Displays previous, current and next month.
`-s` | Displays Sunday as the first day of the week (default).
`-m` | Displays Monday as the first day of the week.
`-j` | Displays Julian dates.
`-y` | Displays a calendar of the current year.
`<year>` | Displays the calendar for the `<year>`.

### 2. `date`

Option | Description
------- | -------
`+%a` | Displays the abbreviated weekday, such as Mon, Tue, etc.
`+%A` | Displays the weekday fully, such as Monday, Tuesday, etc.
`+%b` | Displays abbreviated month, such as Jan, Feb, etc.
`+%B` | Displays the month fully, such as January, February, etc.
`+%d` | Displays the day of the month.
`+%D` | Displays the current date in MM/DD/YYYY format.
`+%F` | Displays the current date in MM-DD-YYYY format.
`+%H` | Displays the time in 24h (00..23) format.
`+%I` | Displays the time in 12h (01..12) format.
`+%j` | Displays the day of the year (001.366).
`+%m` | Displays the month (01..12).
`+%M` | Displays the minute (00.59).
`+%S` | Displays the second (00.60).
`+%N` | Displays the nanoseconds (000000000..999999999).
`+%Y` | Displays the full year (2018).
`+%Z` | Displays alphabetic timezone abbreviation (PDT, EDT, etc).

**Note:** The date and time of the system can be set by using `-s` or `-set`:

```
$ date -s "Monday Dec 19 22:00:00 EST 1988"
```

### 3. `history`

Displays a numbered list with the commands used in the command line. Option `-c` clears the history list by deleting all of the entries.

### 4. `sleep`

Suspend execution for an interval of time. Used to schedule the execution of a command X number of seconds later.

```
sudo systemctl stop Java
sleep 10
sudo systemctl start Java
```

### 5. `passwd`

Used to change a <user's> password.

### 6. `who`

Displays who is logged in. It displays the following columns:

- Login name.
- Terminal name.
- Login date and time.
- Hostname if not local.

```
$ who
talktopri console  Sep 15 13:46
talktopri ttys001  Sep 15 13:46
talktopri ttys002  Sep 15 13:46
talktopri ttys003  Sep 15 13:46
```

### 7. `w`

Displays who is logged in and what they are doing.

The first line displays the current time of day, how long the system has been running, the number of
users logged into the system, and the load averages.  The load average numbers give the number of jobs
in the run queue averaged over 1, 5 and 15 minutes.

The fields output are the user's login name, the name of the terminal the user is on, the host from
which the user is logged in, the time the user logged on, the time since the user last typed anything,
and the name and arguments of the current process.

```
$ w
15:12  up  1:27, 4 users, load averages: 2.08 2.03 2.01
USER     TTY      FROM              LOGIN@  IDLE WHAT
talktopri console  -                13:46    1:26 -
talktopri s001     -                13:46       - w
talktopri s002     -                13:46      33 -bash
talktopri s003     -                13:46    1:25 -bash
```

### 8. `logname`

Displays the user's login name.

This command reads the `/etc/utmp` file to display the name of the current user.

### 9. `last`

Indicates the last logins of the users and ttys. This commands reads from the `/var/log/wtmp` file.

```
$ last -5
talktopri  ttys003                   Sat Sep 15 13:46   still logged in
talktopri  ttys002                   Sat Sep 15 13:46   still logged in
talktopri  ttys001                   Sat Sep 15 13:46   still logged in
talktopri  ttys000                   Sat Sep 15 13:46 - 13:46  (00:00)
talktopri  console                   Sat Sep 15 13:46   still logged in
```

### 10. `whatis`

Search the `whatis` database for complete commands.

```
$ whatis cp
gcp(1), cp(1)            - copy files and directories
cp(1)                    - copy files
```

### 11. `man`

Format and display the on-line manual pages. Incredibly useful and frequently used to understand what a command does and what options are available with that command.

### 12. `echo`

Writes arguments to the standard output.

`echo -e` enables interpretation of backslash escapes.

#### Special options used with the `echo` command

Option | Description
------ | ---------
`\\` | A literal backslash character `\`.
`\a` | Sound alert. Using this will emit a "beep" sound with the command.
`\b` | Backspace.
`\c` | No new line and the cursor will be on the same line.
`\n` | New line.
`\r` | Carriage return.
`\t` | Horizontal tab.
`\v` | Vertical tab.
`\f` | Form feed.

```
$ echo -e "Welcome \bto \bthis \brepository"
Welcometothisrepository
$
$
$ echo -e "Welcome \nto \nthis \nrepository"
Welcome
to
this
repository
$
$
$ echo -e "Welcome \tto \tthis \trepository"
Welcome 	to 	this 	repository
$
$
$ echo -e "Welcome \n\tto \n\tthis \n\trepository"
Welcome
	     to
	     this
	     repository
$
$
$ echo -e "Welcome \vto \vthis \vrepository"
Welcome
        to
           this
                repository
$
$
$ echo -e "Welcome to \rthis repository"
this repository
```

- `echo` can also be used with the redirect operator (>) to send the output to a file and not standard output:

```
$ echo "Hello World" > file1.txt
$
$
$ cat file1.txt
Hello World
```

### 13. `df`

Displays free disk space available. If neither a file or a filesystem operand is specified, statistics for all mounted filesystems are displayed.
`df` looks at disk used blocks directly in the filesystem metadata. `du` reads through directory trees and therefore, is slower than `df`.

The `-h` flag puts the output in "human readable" format.

```
$ df -h
Filesystem                                      Size  Used Avail Use% Mounted on
udev                                             10M     0   10M   0% /dev
tmpfs                                           3.2G  456K  3.2G   1% /run
/dev/xvda1                                       40G   13G   26G  33% /
tmpfs                                           7.9G  688K  7.9G   1% /dev/shm
tmpfs                                           5.0M     0  5.0M   0% /run/lock
tmpfs                                           7.9G     0  7.9G   0% /sys/fs/cgroup
/dev/mapper/ghe_storage_580329aa-ghe_user_data   99G  1.2G   93G   2% /data/user
tmpfs                                           1.6G     0  1.6G   0% /run/user/501
```

### 14. `du`

Estimates file space usage. It doesn't give exact information due to the possibility of unreadable files, etc.

### 15. `uname`

Prints system information, such as system name, node name, release, version, etc. If no options are passed, `-s` is the default.

```
$ uname -a
Linux 18-236-231-170 4.9.0-0.bpo.6-amd64 #1 SMP Debian 4.9.88-1+deb9u1~bpo8+1 (2018-05-13) x86_64 GNU/Linux
```
