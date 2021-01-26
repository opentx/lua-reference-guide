# serialRead\(\[num\]\)

Reads characters from the serial port. The string is allowed to contain any character, including 0. Note that the returned string may not end in a newline if this character is not present in the buffer.

@status current Introduced in 2.3.8

## Parameters

* `num` \(optional\): maximum number of bytes to read.

  If non-zero, serialRead will read up to num characters from the buffer.

  If 0 or left out, serialRead will read up to and including the first newline character or the end of the buffer.

## Return value

* `string` Empty if no new characters were available.

