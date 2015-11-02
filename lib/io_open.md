# io.open(\<filename> [, \<mode>])

The io.open() function is used to open the file on SD card for subsequent reading or writing. After the script is done with the file manipulation [io.close()](io_close.md) function should be used.

*Notice:* this functions is fully functional from OpenTX 2.1.5.


### Parameters

* `filename` full path to the file starting from the SD card root directory. This function can't create a new file in non-existing directory.

* `mode` supported mode strings are:

  * `"r"` read access. File must exist beforehand. The read pointer is located at the beginning of file. This is the default mode if <mode> is omitted.

  * `"w"` write access. File is opened or created (if it didn't exist) and truncated (all existing file contents are lost).

  * "a" write access. File is opened or created (if it didn't exist) and write pointer is located at the end of the file. The existing file contents are preserved.

### Return value

* `\<file object>` if file was successfully opened.

* `nil` if file could not be opened.


### io.seek(fd, offset)
`fd` file object
`offset` is always based from the beginning of the file. If offset is bigger than the file size, the pointer is moved to the end of the file.
Other standard seek bases (like "cur", "end") are not supported.

### io.read(fd, length)
`fd` file object
`length` number of characters to read.

Other read *commands* (like "*all") are **not supported**.

Return: string, number of characters returned is <= length. If end of file is reached, then empty string is returned.