# getFlightMode\(mode\)

Return flight mode data.

@status current Introduced in 2.1.7

## Parameters

* `mode` \(number\) flight mode number to return \(0 - 8\). If mode parameter

  is not specified \(or contains invalid value\), then the current flight mode data is returned.

## Return value

* `multiple` returns 2 values:
  * \(number\) \(current\) flight mode number \(0 - 8\)
  * \(string\) \(current\) flight mode name

