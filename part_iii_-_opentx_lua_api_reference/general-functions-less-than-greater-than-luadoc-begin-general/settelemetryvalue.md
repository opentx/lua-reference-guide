# setTelemetryValue\(id, subID, instance, value \[, unit \[, precision \[, name\]\]\]\)

@status current Introduced in 2.2.0

## Parameters

* `id` Id of the sensor, valid range is from 0 to 0xFFFF
* `subID` subID of the sensor, usually 0, valid range is from 0 to 7
* `instance` instance of the sensor \(SensorID\), valid range is from 0 to 0xFF
* `value` fed to the sensor
* `unit` unit of the sensor [Full list](../../part_vii_-_appendix/units.html)
* `precision` the precision of the sensor
  * `0 or not present` no decimal precision.
  * `!= 0` value is divided by 10^precision, e.g. value=1000, prec=2 =&gt; 10.00.
* `name` \(string\) Name of the sensor if it does not yet exist \(4 chars\).
  * `not present` Name defaults to the Id.
  * `present` Sensor takes name of the argument. Argument must have name surrounded by quotes: e.g., "Name"

## Return value

* `true,` if the sensor was just added. In this case the value is ignored \(subsequent call will set the value\)

### Notice

All three parameters `id`, `subID` and `instance` can't be zero at the same time. At least one of them must be different from zero.

