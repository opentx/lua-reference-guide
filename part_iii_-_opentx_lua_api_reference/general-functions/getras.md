# getRAS\(\)

Return the RAS value or nil if no valid hardware found

@status current Introduced in 2.2.0

## Parameters

none

## Return value

* `number` representing RAS value. Value bellow 0x33 \(51 decimal\) are all ok, value above 0x33 indicate a hardware antenna issue.

  This is just a hardware pass/fail measure and does not represent the quality of the radio link

### Notice

RAS was called SWR in the past

