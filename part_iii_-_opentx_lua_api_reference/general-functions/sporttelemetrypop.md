# sportTelemetryPop\(\)

Pops a received SPORT packet from the queue. Please note that only packets using a data ID within 0x5000 to 0x50FF \(frame ID == 0x10\), as well as packets with a frame ID equal 0x32 \(regardless of the data ID\) will be passed to the LUA telemetry receive queue.

@status current Introduced in 2.2.0

## Parameters

none

## Return value

* `nil` queue does not contain any \(or enough\) bytes to form a whole packet
* `multiple` returns 4 values:
  * sensor ID \(number\)
  * frame ID \(number\)
  * data ID \(number\)
  * value \(number\)

