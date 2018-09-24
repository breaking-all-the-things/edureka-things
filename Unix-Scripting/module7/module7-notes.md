# Intro to Shell scripting

- To check what shells your operating system supports, along with the path where those shells live, you can look at the `/etc/shells` file:

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

## What is Shell Scripting?

- A shell script is a computer program designed to be run by the Unix shell, a command line interpreter.
- It is a list of commands that are listed in the order of execution.
- A good shell script should contain comments, which are preceded by `#` and includes a brief explanation of what that section of code does.
- Shell scripts are not compiled, they are interpreted.
- As a general rule, all shell scripts should have the `.sh` extension.
- As good practice, the first line of a shell script should be the **shebang line** `#!/bin/sh`, which tells the parent shell which interpreter should be used to execute the upcoming script.

### Running a Shell Script

- Before running a shell script, you must change its access permissions, so that you have execute permissions. Otherwise, you might get a `Permission denied` error.
- There are two ways to run a shell script"
  - If you have execute permissions to the file, you can run `./script.sh` from within the script's directory. This will execute the script in the current shell, without starting a new copy of a shell.
  - If you do not have execute permissions to the file, you can run `sh script.sh`, which will create a child shell and run the script.

## What is a variable?

- A variable is a character/string to which we assign a value.
- The value assigned can be a number, text, filename, device or any other type of data.

### 1. Environmental variables

- An environment is an area in memory where we can place definitions of shell variables so that they are accessible for programs.
- The environmental/system variables are used to define an environment.
- These variables control some of the properties of the shell.
- Environment variables give information about the terminal, prompt, name of home directory, etc.
- Environment variables are written in capital letters and start with a `$` symbol.
- The `.profile` file available in the home directory has all the variables set for your environment.
- The `/etc/profile` file is usually maintained by the system administrator and contains shell initialization information required by all users in the system.
- Any alias, variable or path can be defined in the `.profile` file for permanent usage.

Environment variable | Description
-------------------- | -----------
$HOME | Indicates the home directory for the current user
$IFS | Indicates the Internal Field Separator that is used by the parser for word splitting after expansion and to split lines into words with the read builtin command. The default value is <space><tab><newline>.
$PATH | Specifies the locations in which the shell should look for commands.
$RANDOM | Generates a random integer between 0 and 32,767 each time it is referenced.
$PWD | Indicates the current working directory.
$TERM | Refers to the display type of the terminal.
$LOGNAME | Login name for the user.
$TZ | Refers to timezone.
$PS1 | Specifies the string to be used as the primary prompt.
$PS2 | Specifies the string to be used as the secondary prompt.
$UID | Expands to the numeric user ID of the current user.

### 2. Local variables

- Variables that are local to the shell only.
- Once the shell is terminated, the variable will no longer exist.
- When the shell is invoked again, it won't remember the variable that was created previously.

### 3. Global variables

- Global variables are used within all supported shells of the Unix system where you are working.
- To change a local variable into a global variable, the variable needs to be exported using the `export` command: `export [variable]`.

### 4. Special variables (or Positional Parameters)

- Positional parameters can be used to pass information to a script in 2 ways:
  - Directly: with parameters representing the command line arguments.
  - Indirectly: using `set` and command substitution.
- Within the script, we refer to the first argument as $1, the second argument as $2 and so on.
- The command `set` is used to assign values to positional parameters.
- All the positional parameters are written with a `$` symbol.
- The command line arguments $1, $2, $3...$9 are positional parameters, with $0 pointing to the actual command, program, shell, script or function, and $1, $2, $3...$9 as the arguments to the command.
- After $9, the next positional parameter will be accessed as ${10}, ${11}, etc.

Variable | Description
-------- | ------------
$0 | The filename of the current script.
$n | These variables correspond to the arguments with which a script is invoked.
$# | The number of arguments supplied to a script.
$* | All the arguments are double quoted.
$@ | All the arguments are individually quoted.
$? | The exit status of the last command executed.
$$ | The process number of the current shell.
$! | The process number of the last background command.
$_ | Shell option.

**Note:** The `shift` command will try to push arguments off the command line. Therefore, if 3 arguments are provided: $1, $2 and $3, and `shift` is used, then $1 will be shifted off the command line and $2 will be the new $1. A `shift 2` will shift by two, making $3 the new $1. 
