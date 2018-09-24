# Handling and Filtering Files

## Splitting files horizontally

### i. `head`

- Outputs the first part (top) of a file.
- By default, it outputs the first 10 lines of the file.
- By using options, it is possible to adjust how many lines will be displayed.

```
$ head file1.txt
$
$ head -n 20 file1.txt
```

### ii. `tail`

- Outputs the last part (bottom) of a file.
- By default, it outputs the last 10 lines of the file.
- By using options, it is possible to adjust how many lines will be displayed.

```
$ tail -n 5 file1.txt # outputs the last 5 lines of the file
$
$ tail +n 6 file1.txt # starts reading from line 6 down.
```

## Splitting files vertically

### `cut`

- Removes sections from each line of a file.
- To extract specific columns, pass the `-c` to determine how many characters should be included.

```
$ cut -c 6-22, 24-34 file1.txt # characters 6 through 22 and characters 24 through 34 will be included in the output
```

- By default, `cut` uses _tab_ as the field delimiter.
- Option `-f` extracts specific fields.
- Option `-d` creates a field delimiter.

```
$ cat file1.txt
two     three     four
beta    gamma     delta
$
$
$ cut -f 1-2,4-5 file1.txt # only include fields 1, 2, 4 and 5 as my output
two     three
beta     gamma
```

## Other commands

### 1. `tee`

- Reads from standard input and writes to standard output and files (if specified) at the same time.

```
$ who | tee test1.txt
admin    pts/0        2018-09-15 22:38 (108.89.4.63)
$
$ cat test1.txt
admin    pts/0        2018-09-15 22:38 (108.89.4.63)
```

### 2. `tr`

- Translates or deletes characters in a line.
- It only takes input from standard input.
- It does not take a file as an argument.
- Use single quotes (') in the expression.
- The options for `tr` are:
  - `-c`: uses the complement of set1.
  - `-d`: deletes characters in set1. Do not translate.
  - `-s`: replaces each input sequence of a repeated character that is listed in set1 with a single occurrence of that character.
  - `-t`: first truncates set1 to the length of set2.

```
$ echo "linux   server" | tr -s " " "," # replaces extra spaces with a comma
linux,server
$
$
$ echo "linux server" | tr "[a-z]" "[A-Z]" # replaces lowercase characters with uppercase characters
LINUX SERVER
$
$
$ echo "unix" | tr -c "u" "a" # complemented the set1 with set2
uaaaa
$
$
$ echo "linuxserver" | tr -d "linux" # deletes characters in set1
server
```

### 3. `diff`

- Compares files line by line.

```
$ diff test.txt test1.txt
1,2c1
< two	three	four
< beta	gamma	delta
---
> admin    pts/0        2018-09-15 22:38 (108.89.4.63)
```

### 4. `cmp`

- Compares two files byte by byte.

```
$ cmp test.txt test1.txt
test.txt test1.txt differ: byte 1, line 1
```

### 5. `comm`

- Compares two sorted files line by line.
- The first column has the unique lines for file1.
- The second column has the unique lines for file2.
- The third column has the common lines between both files.

```
$ comm test.txt test2.txt
two	three	four
beta	gamma
	uno	dos	tres
	quatro	cinco	seis
    delta
```

### 6. `alias`

- Allows you to create your own name or abbreviation for a command.
- To set an alias use `alias [aliasname]=[command]`.
- To unset an alias use `unalias [aliasname]`.

```
$ alias RAM='free -m'
```

----

## File Search

### `find`

- Searches for files in a directory hierarchy.
- Uses the syntax `find [path] [option]`
- The `find` command can be used to find files according to:
  - File name.
  - File type.
  - Permissions.
  - Owner.
  - Modification date and time.
  - Size.

```
$ find /home -name test.txt #searches for files based on their name.
$
$
$ find . -name test.txt # searches for files called test.txt in the current directory
$
$
$ find /home -iname test.txt # -iname is used to ignore case distinction for the file name.
$
$
$ find / -type d -name dir # searches the directories in root that are called dir.
$
$
$ find / -type f -name *.mp3 # searches for all files with extension mp3 in the root directory.
$
$
$ find / -perm 775 # searches for all the files with permissions 755 in the root directory.
$
$
$ find / -size +100M -exec rm -rf {} \; # searches and deletes all files that are over 100M in size.

----  

## Compressing and archiving Files

- To create a `tar` file:

```
$ tar -cvf file.tar [directory-to-be-compressed]
```

- To extract a tar file:

```
$ tar -xvf file.tar
$
$
$ tar -xvf file.tar ~ # extracts the file in the home directory.
```

Similar commands can be run for `zip`, `unzip`, `gzip`, `gunzip`, etc.

**Note:** if you don't want to extract the compressed file in order to search for patterns, you can use `zcat`, `gzcat`, `zmore`,`gzmore`,`zgrep`, etc.


----

## String search and sorting

### `grep`, `egrep` and `fgrep`

- `grep` searches the named input files (or standard input if no files are named) for lines containing a match to the given pattern. By default, `grep` prints the matching lines.
- `egrep` is the same as `grep -E`, and it searches for multiple patterns. The syntax looks like `egrep "string1 | string2" file1.txt`
- `fgrep` is the same as `grep -F`, and it searches for fixed strings, rather than regular expressions, separated by new lines.

#### Common options used with `grep`

Option | Description
------ | -----------
`-v` | Means **invert-match**. Prints all lines that **do not** match the pattern.
`-n` | Prints the matched line and its line number.
`-l` | Prints only the names of the files with lines matching the pattern.
`-c` | Prints only a count of lines that match the pattern.
`-i` | Ignores case distinction and prints lowercase and uppercase matches.
`-s` | Suppresses error messages about non-existent or unreadable files.
`-x` | Prints only the matches that match exactly the whole line.

### `sort`

- Sorts lines of text files.
- By default (if no options are passed), lines starting with a number appear before lines starting with a letter. Lines starting with a lowercase letter appear before lines starting with uppercase letters.

Option | Description
------ | -----------
`-r` | Reverse. Sorts in reverse alphabetical or descending order.
`-n` | Numeric sort. Sorts numeric in ascending order, ignoring blanks and tabs.
`-u` | Unique. Outputs only the first match of an equal run.
`-b` | Ignores leading blanks. Sorts by ignoring the spaces between columns.
`-c` | Checks for sorted input, but does not sort.
`-f` | Ignores case. Folds lowercase to uppercase characters.

### `uniq`

- Reports or omits repeated lines.
- Filters adjacent the matching lines from file (or standard input), writing to the screen (or to another file, if one is passed).
- With no options, the matching lines are merged to the first occurrence.

Option | Description
------ | -----------
`-c` | Prefixes lines by the number of occurrences.
`-d` | Prints only duplicate lines.
`-f` | Skip fields. Avoids comparing the first N fields.
`-s` | Skip chars. Avoids comparing the first N characters.
`-u` | Unique. Prints only unique lines.
`-i` | Ignores differences in case when comparing.

## `awk`

- Pattern-directed scanning and processing language.
- Syntax: `awk 'pattern{action}' file` --> either the pattern or the action are optional, but at least one of them must exist in order for `awk` to work.
- If the search pattern is not given, then `awk` performs the given action for each line of input.
- If the action is not given, `awk` will print all the lines that match the pattern given.
- Single quotes are needed to help the shell interpret special characters.
- Empty braces does nothing.
- Each statement within the actions array should be delimited by a semicolon.
- `awk` is a very complex processing language and has variables, conditionals, loops, arithmetic and string operators.
- http://linuxcommand.org/lc3_adv_awk.php is a great resource to learn more about `awk`.
- [The GNU Awk User's guide](https://www.gnu.org/software/gawk/manual/gawk.html).

### Examples

Command | Description
------- | -----------
`$ awk '{print;}' file.txt` | Default behavior: prints file.txt to the standard output (screen).
`$ awk '{print $2,$5;}' file.txt` | Prints only the specified fields. In this example, it will be fields 2 and 5.
`$ awk -F: '{print $2}' file.txt` | Prints field 2 with `:` as the specified delimiter
`$ awk '{print NF}' file.txt` | Used to know the number of fields (NF) in file.txt
`$ awk '{print NR}' file.txt'` | Used to know the number of lines in file.txt
