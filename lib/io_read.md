# io.read(\<file object> , \<length>)

The io.read() function is used to read data from the file on SD card.

*Notice:* other read *commands* (like "*all", etc..) are **not supported**.


### Parameters

* `file object` a file object that was returned by the io.open() function. The file must be opened in read mode.

* `length` number of characters/bytes to read. The number of actual read/returned characters can be less if the file end is reached. 

### Return value

* `\<string>` a string with a length equal or less than <length>

* `""` a zero length string if the end of file was reached
