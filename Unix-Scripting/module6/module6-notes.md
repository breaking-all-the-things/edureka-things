# Vi and `sed`

## Vi

- This chapter was very detailed and explained vi's modes and commands.
- Because there are countless vi tutorials online, I will not outline Module 6 here in details.
- One cool thing to remember is that while inside of vi, you can set line numbers, by using `set: number`.
- Another thing to remember is that while inside of vi, you can substitute terms using variations of `s/old-term/new-term/`.
- Here is a nice resource online to help with vi: https://www.ccsf.edu/Pub/Fac/vi.html
- Other resources: an interactive vim tutorial: https://www.openvim.com/

## `sed`

- The `sed` utility reads the specified files, or the standard input if no files are specified, modifying the input as specified by a list of commands. The input is then written to the standard output.
- A single command may be specified as the first argument to `sed`. Multiple commands may be specified by using the `-e` or `-f` options. All commands are applied to the input in the order they are specified regardless of their origin.
- Syntax: `sed [option] command [inpu-file]`

### Deleting lines

- the `d` flag is used to delete lines.
- the `-i` flag edits files in-place.

Delete command | Description
-------------- | -----------
`sed -i '1d' file.txt` | Deletes the first line of file.txt on the file itself (because the `-i` flag was used).
`sed '3d' file.txt > file-without-deleted-line.txt` | Deletes a particular line from file.txt and saves it to a different file, file-without-deleted-line.txt
`sed '$d' file.txt` | Deletes the last line of the file.
`sed '2,4d' file.txt` | Deletes line 2-4 of the file.
`sed '2,4!d' file.txt` | Deletes all lines **except** for lines 2-4 of the file.
`sed '1d,$d' file.txt` | Deletes the first **and** the last line of the file.
`sed '/^L/d' file.txt` | Deletes all lines beginning with a particular character (L in this case).
`sed '/x$/d' file.txt` | Deletes all lines that end with a particular character (x in this case).
`sed '/[xX]$/d' file.txt` | Deletes all lines that end with either x or X.
`sed '/^$/d' file.txt` | Deletes all empty lines in the file.
`sed '/^ *$/d' file.txt` | Deletes all lines that are empty or that contain blank spaces.
`sed '/^[A-Z]*$/d' file.txt` | Deletes all lines that are entirely in capital letters.
`sed '/Unix/d' file.txt` | Deletes all lines containing the pattern Unix.
`sed '/Unix/!d' file.txt` | Deletes all lines that **do not** contain the pattern Unix.
`sed '/Unix\|Linux/d' file.txt` | Deletes all lines containing either the pattern Unix or Linux.
`sed '1,/Linux/d' file.txt` | Deletes the lines starting from the 1st line until it encounters the pattern Linux.
`sed '/Linux/,$d' file.txt` | Deletes all the lines starting from pattern Linux until the last line.
`sed '${/AIX/d;}' file.txt` | Deletes the last line only if it contains the pattern AIX.

**Obs:** if a line has tab or spaces that you can't see, it does not mean that the line is empty. Empty lines means no characters at all: no tabs, no spaces and no visible characters.


### Printing the lines

- The `p` flag is used for printing.
- By default, each line of input is echoed to the standard output after all of the commands have been applied to it.  The `-n` option suppresses this behavior.

Print command | Description
------------- | -----------
`sed -n '3~2p' file.txt` | Prints every 2nd line starting from the 3rd line.
`sed -n '5,$p' file.txt` | Prints from the 5th line to the end of the file.

### Writing selected lines to a file

- The `w` flag is used  to write selected lines to a separate file.
- Option `-n` is also used here.

Write command | Description
------------- | -----------
`sed -n '/director/w file1.txt' file2.txt` | Writes all lines that match the "director" pattern from file1.txt to file2.txt
`sed -n '2.100w file1.txt 150,$w file2.txt' file3.txt` | Writes lines 2-100 from file1.txt and lines 150 until the end of the file2.txt to file3.txt

### Substitutions

- The `s` flag is used for substitutios.
- `g` is used at the end of a substitution to change the values globally. Without it, the left-most occurrence will be replaced.

Substitution command | Description
-------------------- | ------------
`sed 's/Unix/Linux/g' file.txt` | Replaces Unix with Linux globally for file.txt
`sed 's/\|/:/g' file.txt` | Replaces all `|` with `:`
`sed '3,10s/director/manager' file.txt` | Replaces director with manager on lines 3 through 10.

----

## `xargs`

- The `xargs` utility reads space, tac, newline and end-of-file delimited strings from the standard input and executes utility with the strings as arguments.
- `xargs` works similarly to `-exec`, but it is faster.
- Can be used with `find` and `grep`.
- Syntax is similar to `find . -name "*.java" | xargs grep "Stock"`

Command | Description
------- | -----------
`find /tmp -name "*.tmp" \| xargs rm` | Deletes temporary files .
`ls -1 *.txt \| xargs` | Converts multi-line output into a single line.
`ls -1 *.txt \| xargs wc -l` | Counts the number of lines in each file.
`echo a b c d e f \| xargs -n 3` | Limits output per line using the `-n` flag: outputs `a b c` in one line and `d e f` in another line. 
