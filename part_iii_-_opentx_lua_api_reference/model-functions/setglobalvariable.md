# model.setGlobalVariable\(index, flight\_mode, value\)

Sets current global variable value. See also model.getGlobalVariable\(\)

## Parameters

* `index` zero based global variable index, use 0 for GV1, 8 for GV9
* `flight_mode` Flight mode number \(0 = FM0, 8 = FM8\)
* `value` new value for global variable. Permitted range is from -1024 to 1024.

## Return value

none

### Notice

Global variable can only store integer values, any floating point value is converted into integer value by truncating everything behind a floating point.

