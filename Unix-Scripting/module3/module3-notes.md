# Module 3 - Files and Directories

## Metacharacters

Symbol | Description | Example
------ | ----------- | --------
`*` | Zero or many occurrences of that pattern. | `*e[0-9]f`: any file ending with "e", a single number and "f" (e1f, e2f, etc).
`?` | Matches zero or one character. | `[abc]??`: 3 character filename beginning with either "a" or "b" or "c".
`[]` | Any of the characters within the square brackets will be matched. | See examples above.
`{}` | Search range. `{x}`: match _exactly_ x; `{x,y}`: match x _or_ y, but no more than y. | `cp {*.doc,*.pdf} ~`: copy any .doc or .pdf files to the user's home directory. Spaces are not allowed after the comma.
`-` | Hyphen used within `[]` denotes a range of characters.
`!` | Negative. Meaning it does not match <pattern>. | `[!A-Z]??`: 3 character filename that does not begin with an uppercase letter.
`^` | Line starts with [pattern]. | `^file`: filename starts with "file".
`$` | Line ends with [pattern]. | `ls \| grep X$`: Lists all files in the directory that end in "X".

## File creation

### 1. `touch`

Changes file timestamps for existing files or creates a new empty file.

- `touch` does not insert any content into the file.
- `touch` can be used to create many different files with one single command.

```
$ touch file{1,2,3,4}.txt
```

### 2. `cat`

- If the file already exists, `cat` will output the contents of the file to standard output.
- If the file does not exist, then `cat` creates a new file in write mode and you can insert content. Use `ctrl + d` to exit write mode.
- `cat` only allows the creation of one file at a time.

```
$ cat > newfile.txt
$
$ cat file1.txt file2.txt > file3.txt #concatenates file1.txt and file2.txt into file3.txt
```

### 3. `vi`

- If the file already exists, `vi` will open the file in edit mode.
- If the file does not exist, `vi` creates a new file in write/edit mode, where new content can be added. Use keyboard "esc"+`wq` to save the file and exit the `vi` editor.
- `vi` allows for the creation of single or multiple files at a time in write mode.


## Displaying file content

Other than using `cat` and `vi` to display file contents, you can use the options below.

### a. `od`

- Displays the octal dump of the file, so that you can see the invisible characters which are not displayed by `cat`, `more`, `less`, etc.

```
$ cat test.txt
Hello world
  Hello universe		

bye!
$
$
$ od -c test.txt
0000000   H   e   l   l   o       w   o   r   l   d  \n           H   e
0000020   l   l   o       u   n   i   v   e   r   s   e  \t  \t  \n  \n
0000040   b   y   e   !  \n
0000045
```

### b. `more`

- `more`  is  a filter for paging through text one screenful at a time.
- Press spacebar to scroll the page up.
- `more` does not allow scrolling the file down.
- Use `q` to quit viewing the file.

### c. `less`

- `less` is similar to `more`, but `less` allows scrolling down.
- `less` also run quicker than `more` because `less` does not read the whole content of the file before displaying it.

## Managing files

### i. `rm`

Removes or deletes the file.

### ii. `cp`

Copies files and directories.

```
$ cp ~/Desktop/file1.txt . #copies file1.txt into the current directory.
$
$
$ cp -R testdirectory/ ~/Desktop #copies testdirectory/ into Desktop recursively.
```

### iii. `wc`

Prints the number of lines (`l`), words (`-w`), characters (`-c`), etc from a file.

```
$ wc -l file1.txt
```

## Piping and redirection

### Piping

By using the pipe symbol `|` the output of one command can be passed onto the next command:

```
$ cat file1.txt | wc -l
```

### Redirection

Option | Description | Example
------ | ----------- | --------
`< file1.txt` | Takes standard input from the file and redirects it to the command. | `$ wc < file1.txt`
`> file1.txt` | Redirects standard output to the file. | `cal > file1.txt`
`>> file1.txt` | Output will be appended to the file. | `wc file1.txt >> output.txt`
`2>file1.txt` | Redirects standard error to the file. | `cat unexistentfile.txt 2>error.log`
`file1.txt 2>&1` | Merges standard error and standard output into the file. | `cat foo.txt > output.txt 2>&1`
