# io.seek(&lt;file object&gt; , &lt;offset&gt;)

The io.seek() function is used to move the current read/write position.

*Notice:* other read standard seek bases (like "cur", "end") are **not supported**.


### Parameters

* `file object` a file object that was returned by the io.open() function.

* `offset` position the read/write file pointer at the specified offset from the beginning of the file. If specified offset is bigger than the file size, then the pointer is moved to the end of the file.

### Return value

* `0` success

* `<number>` any other value means failure.
