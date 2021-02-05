# getTxGPS\(\)

Return the internal GPS position or nil if no valid hardware found

@status current Introduced in 2.2.2

## Parameters

none

## Return value

* `table` representing the current radio position
  * `lat` \(number\) internal GPS latitude, positive is North
  * `lon` \(number\) internal GPS longitude, positive is East
  * 'numsat' \(number\) current number of sats locked in by the GPS sensor
  * 'fix' \(boolean\) fix status
  * 'alt' \(number\) internal GPS altitude in m
  * 'speed' \(number\) internal GPSspeed in 1cm/s
  * 'heading'  \(number\) internal GPS ground course estimation in degrees \* 10
  * 'hdop' \(number\)  internal GPS horizontal dilution of precision (std. \* 100, good signal approx. 100)

