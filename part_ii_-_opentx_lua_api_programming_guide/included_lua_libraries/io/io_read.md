# io.read\(\)

The io.read\(\) function is used to read data from the file on SD card.

_Notice:_ other read _commands_ \(like "_all", etc..\) are \*not supported_.

## Parameters

* `file object` a file object that was returned by the io.open\(\) function. The file must be opened in read mode.
* `length` number of characters/bytes to read. The number of actual read/returned characters can be less if the file end is reached.

## Return value

* `<string>` a string with a length equal or less than 
* `""` a zero length string if the end of file was reached

