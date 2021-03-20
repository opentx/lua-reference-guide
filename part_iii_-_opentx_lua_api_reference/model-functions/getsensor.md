# model.getSensor\(sensor\)

Get Telemetry Sensor parameters

@status current Introduced in 2.3.0

## Parameters

* `sensor` \(unsigned number\) sensor number \(use 0 for sensor 1\)

## Return value

* `nil` requested sensor does not exist
* `table` with sensor data:
  * `type` \(number\) 0 = custom, 1 = calculated 
  * `name` \(string\) Name
  * `unit` \(number\) See list of units in the appendix of the OpenTX Lua Reference Guide
  * `prec` \(number\) Number of decimals
  * `id`   \(number\) Only custom sensors
  * `instance` \(number\) Only custom sensors
  * `formula` \(number\) Only calculated sensors. 0 = Add etc. see list of formula choices in Companion popup

