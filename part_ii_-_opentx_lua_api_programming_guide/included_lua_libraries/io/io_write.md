# io.write\(\)

The io.write\(\) function is used to write data to the file on SD card.

## Parameters

* `file object` a file object that was returned by the io.open\(\) function. The file must be opened in write or append mode.
* `data` any Lua type that can be converted into string. If more than one data parameter is used their contents are written to the file by one in the same order as they are specified.

## Return value

* `<file object>` if data was successfully opened.
* `nil, <error string>, <error number>` if the data can't be written.

