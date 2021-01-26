# model.getInput\(input, line\)

Return input data for given input and line number

@status current Introduced in 2.0.0, curveType/curveValue/carryTrim added in 2.3, inputName added 2.3.10, flighmode reworked in 2.3.11

## Parameters

* `input` \(unsigned number\) input number \(use 0 for Input1\)
* `line` \(unsigned number\) input line \(use 0 for first line\)

## Return value

* `nil` requested input or line does not exist
* `table` input data:
  * `name` \(string\) input line name
  * `inputName` \(string\) input input name
  * `source` \(number\) input source index
  * `weight` \(number\) input weight
  * `offset` \(number\) input offset
  * `switch` \(number\) input switch index
  * `curveType` \(number\) curve type \(function, expo, custom curve\)
  * `curveValue` \(number\) curve index
  * `carryTrim` \(boolean\) input trims applied
  * 'flightModes' \(number\) bit-mask of active flight modes

