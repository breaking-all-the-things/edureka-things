# File Attributes

## File security and types of access

- File security means access control to files and directories.
- File ownership is a secure way to store files.
- Files and directories can be protected by setting or changing access permissions.
- Every file in Unix has 3 attributes or user categories that determine file access:

### Permissions

#### 1. User/owner permissions

- Represented by `u`.
- Determines what actions the owner of the file can perform on the file.
- User/owner is usually the person who created the file or directory.
- Only the owner of the file or directory (or the super user) has the rights to change the file or directory permissions.

#### 2. Group permissions

- Represented by `g`.
- Determines what actions a member of the group can perform on the file.
- It specifies the group to which the file belongs.

#### 3. Others/public permissions

- Represented by `o`.
- Determines what actions all other users can perform on the file.
- All other users are considered as public.

**Note:** All permissions is represented by `a` and it includes Owner, Group and Others permissions.


### Access modes or absolute permissions

- There are 3 permission levels in Unix:
  - Read permission: grants access to reading the contents of the file. For directories, it grants access to look at the file names inside the directory. Value 4 (octal 100).
  - Write permission: grants the rights to modify or remove the contents of a file. For directories, it grants access to add or delete files to the directory. Value 2 (octal 010).
  - Execute permission: grants access to executing the file as a program. It doesn't do much for directories. Value 1 (octal 001).

#### Permission Indicators

Category | Indicator | Description
-------- | --------- | -----------
User Class    u | Owner
              g | Group
              o | Others
            | a | All
Operation     = | Assign permission absolutely
              + | Adds a permission
             | - | Removes a permission
Permission   r | Read
             w | Write
             x | Execute
             s | Set user or Group ID

- Using the `ls -l` command, we can see information related to the file and directory permissions:

```
$ ls -l
-rwxr--r--@ 1 talktopri  staff   198 Sep 11 20:38 Test-vowel.sh
drwxr-xr-x  4 talktopri  staff   128 Sep 15 14:37 module1
```      

- The first character of the output indicates whether the file is a normal file type `-` or a directory `d`.
- The subsequent characters are broken into three groups:
  - the first group of three characters (characters 2, 3 and 4 `rwx` for the `Test-vowel.sh` file) represents the permissions for the file's owner.
  - the second or middle group of characters (characters 5, 6 and 7 `r--` for the `Test-vowel.sh` file) represents the permissions for the group.
  - the third or last group of characters (characters 8, 9 and 10 `r--` for the `Test-vowel.sh` file) represents the permissions for everyone else.

### Changing file Permissions

- To change file or directory permissions, the `chmod` (change mode) command is  used. There are two ways to use `chmod`:

#### Symbolic Mode

- By using operators, we can add, delete or specify the permissions:

```
$ chmod o+wx file.txt
```

adds write and execute rights to Others.

```
$ chmod o+wx,u-x,g=r-x file.txt
```

adds write and execute rights to Others, removes the execute right from the User and sets the Group permissions as read and execute.

#### Absolute Mode

- `chmod` uses a number to specify each set of permissions to a file.

```
$ chmod 755 file.txt
```

grants the User group read, write and execute rights (read=4 + write=2 + execute=1), also grants the Group and Others read and execute rights (read=4 + execute=1).

### Changing file ownership

#### `chown`

- The `chown` command is used to change the ownership of a file.
- Syntax: `chown <user> file.txt`

#### `chgrp`

- The `chgrp` command is usedd to change the group ownership of a file.
- Syntax `chgrp <group. file.txt`

### `umask`

- `umask` is a shell built-in command that displays or sets what permissions files and directories will have upon creation.
- The minimum and maximum UMASK values for a folder is 000 and 777 respectively.
- The minimum and maximum UMASK values for a file is 000 and 666 respectively.
- To see what your machine's default UMASK value is, type `umask` in the command prompt.

```
$ umask
0022
```

The value above means that the default UMASK value for machine is `0022`.

- In order to calculate what the default file and directory permissions are in my machine, I need to subtract **777-022** for directories and **666-022**. This means that the default permissions for my machine are 755 (drwxr-xr-x) for directories and 644 (-rw-r--r--) for files.
  - To verify that these values actually apply, I created a directory and a file, and then I checked for their permissions:

```
$ mkdir directory-test
$
$ ls -l
drwxr-xr-x    2 talktopri  staff        64 Sep 24 14:15 directory-test  
$
$
$ touch file-test.txt
$
$ ls -l
-rw-r--r--  1 talktopri  staff  0 Sep 24 14:17 file-test.txt
```
