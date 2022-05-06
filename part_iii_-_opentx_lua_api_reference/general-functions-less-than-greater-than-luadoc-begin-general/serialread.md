# serialRead([num])
@param num (optional): maximum number of bytes to read.
                       If non-zero, serialRead will read up to num characters from the buffer.
                       If 0 or left out, serialRead will read up to and including the first newline character or the end of the buffer.
                       Note that the returned string may not end in a newline if this character is not present in the buffer.



Reads characters from the serial port. The string is allowed to contain any character, including 0.

@status current Introduced in 2.3.8


## Parameters

none

## Return value

* `str` string. Empty if no new characters were available.



