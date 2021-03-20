# model.getLogicalSwitch\(switch\)

Get Logical Switch parameters

@status current Introduced in 2.0.0

## Parameters

* `switch` \(unsigned number\) logical switch number \(use 0 for LS1\)

## Return value

* `nil` requested logical switch does not exist
* `table` logical switch data:
  * `func` \(number\) function index
  * `v1` \(number\) V1 value \(index\)
  * `v2` \(number\) V2 value \(index or value\)
  * `v3` \(number\) V3 value \(index or value\)
  * `and` \(number\) AND switch index
  * `delay` \(number\) delay \(time in 1/10 s\)
  * `duration` \(number\) duration \(time in 1/10 s\)

