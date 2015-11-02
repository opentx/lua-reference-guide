# io.open(&lt;filename&gt; [, &lt;mode&gt;])

The io.open() function is used to open the file on SD card for subsequent reading or writing. After the script is done with the file manipulation [io.close()](io_close.md) function should be used.

*Notice:* this functions is fully functional from OpenTX 2.1.5.


### Parameters

* `filename` full path to the file starting from the SD card root directory. This function can't create a new file in non-existing directory.

* `mode` supported mode strings are:

  * `"r"` read access. File must exist beforehand. The read pointer is located at the beginning of file. This is the default mode if <mode> is omitted.

  * `"w"` write access. File is opened or created (if it didn't exist) and truncated (all existing file contents are lost).

  * "a" write access. File is opened or created (if it didn't exist) and write pointer is located at the end of the file. The existing file contents are preserved.

### Return value

* `<file object>` if file was successfully opened.

* `nil` if file could not be opened.
