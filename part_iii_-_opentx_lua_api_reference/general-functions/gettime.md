# getTime\(\)

Return the time since the radio was started in multiple of 10ms

The timer internally uses a 32-bit counter which is enough for 497 days so overflows will not happen.

@status current Introduced in 2.0.0

## Parameters

none

## Return value

* `number` Number of 10ms ticks since the radio was started Example:

  run time: 12.54 seconds, return value: 1254

