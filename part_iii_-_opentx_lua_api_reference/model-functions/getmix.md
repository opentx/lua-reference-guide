# model.getMix\(channel, line\)

Get configuration for specified Mix

@status current Introduced in 2.0.0, parameters below `multiplex` added in 2.0.13

## Parameters

* `channel` \(unsigned number\) channel number \(use 0 for CH1\)
* `line` \(unsigned number\) mix number \(use 0 for first line\(mix\)\)

## Return value

* `nil` requested channel or line does not exist
* `table` mix data:
  * `name` \(string\) mix line name
  * `source` \(number\) source index
  * `weight` \(number\) weight \(1024 == 100%\) value or GVAR1..9 = 4096..4011, -GVAR1..9 = 4095..4087
  * `offset` \(number\) offset value or GVAR1..9 = 4096..4011, -GVAR1..9 = 4095..4087
  * `switch` \(number\) switch index
  * `multiplex` \(number\) multiplex \(0 = ADD, 1 = MULTIPLY, 2 = REPLACE\)
  * `curveType` \(number\) curve type \(function, expo, custom curve\)
  * `curveValue` \(number\) curve index
  * `flightModes` \(number\) bit-mask of active flight modes
  * `carryTrim` \(boolean\) carry trim
  * `mixWarn` \(number\) warning \(0 = off, 1 = 1 beep, .. 3 = 3 beeps\)
  * `delayUp` \(number\) delay up \(time in 1/10 s\)
  * `delayDown` \(number\) delay down
  * `speedUp` \(number\) speed up
  * `speedDown` \(number\) speed down

