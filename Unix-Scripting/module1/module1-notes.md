## Unix Fundamentals

- To check what shells are supported in a given system, check the `/etc/shells` file:

```
$ cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

### Differences between Internal and External commands:

Internal Commands | External Commands
----------------- | -----------------
Executed by the Shell. | Executed by the Kernel.
Do not have a separate process ID. | Each running External command has a different process ID.
Shell built-in. | Stored as binaries.

**Note**: Internal commands usually run faster than External commands.

### Unix Directory Structure

Directory | Description
------ | -------
`/` | **The Root Directory**. Origin of Unix directory structure. Only the root user has write access to this directory.
`/root` | Home directory of the root user. Not the same as `/`.
`/bin` | **User binaries**. Contains binary executable files, such as `ps`, `ls`, `ping`, `grep`, `cp`, etc.
`/sbin` | **System binaries**. Like `/bin`, contains binary executable programs. Usually System Administrators run commands that call files from this directory, such as `fdisk`, `ifconfig`, `reboot`, etc.
`/dev` | **Device files**. Includes device files like terminal devices, USB or any device attached to the system, such as `/dev/tty1`, `/dev/usbdsk1`, etc.
`/proc` | **Process information**. Contains information about system running processes. For example: `/proc/<pid>` includes information about the process with that particular pid
`/var` | **Variable files**. Contains files that are expected to grow over time. For example: Log files (`/var/log`), database files (`/var/lib`),  temp files that persist across reboots (`/var/tmp`).
`/tmp` | **Temporary files**. Contains temporary files created by users and by the system. Files under this directory are deleted once the system is rebooted.
`/usr` | **User programs**. Contains binaries, libraries, documentation, source-code, etc for second level programs. For example: `usr/bin` contains binary files for user programs if user binaries are not present under `/bin`.
`/home` | **Home directory**. Also represented by the `~` (tilde) symbol. This is the home directory where all users store their personal files. For example: `/home/talktopri`.
`/boot` | **Boot loader files**. Contains boot loader related files, such as the Kernel `initrd`, `vmlinux`, `grub` files, etc.
`/lib` | **System libraries**. Contains library files support to the binaries located under `/bin` and `/sbin`.
`/opt` | **Optional applications**. Contains other applications for individual vendor, such as Java, Oracle, etc.
`/mnt` | **Mount**. Temporary mount directory where sysadmin can mount file systems.
`/media` | **Media removable devices**. Keeps the details of media removable devices.
`/srv` | **Service data**. Keeps server related services data. For example: `/srv/cvs` contains CVS related data.
`/lost+found` | **Recover utility**. Used for recovering files that may be corrupt due to unexpected shutdown.
`/etc` | **Configuration files**. Contains configuration files required by the programs.
`/kernel` | **Kernel files**. Contains kernel files.
`./sys` | **Virtual file system**. Linux distributions include a virtual file system that stores and allows modification of the devices connected to the system.

#### Importat files:

1. `/dev/null`: This is a pseudo-device that does not exist. Error and garbage output is redirected here and it gets lost forever.
2. `/etc/crontab`: Shell script to run a job at a pre-scheduled time interval.
3. `/etc/hosts`: List of IP addresses and hostnames.
4. `/proc/cpuinfo`: CPU usage information.
5. `/proc/meminfo`: Memory usage information.
