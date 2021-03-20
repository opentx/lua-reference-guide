# model.getCustomFunction\(function\)

Get Custom Function parameters

@status current Introduced in 2.0.0, TODO rename function

## Parameters

* `function` \(unsigned number\) custom function number \(use 0 for CF1\)

## Return value

* `nil` requested custom function does not exist
* `table` custom function data:
  * `switch` \(number\) switch index
  * `func` \(number\) function index
  * `name` \(string\)  Name of track to play \(only returned only returned if action is play track, sound or script\)
  * `value` \(number\) value \(only returned only returned if action is **not** play track, sound or script\)
  * `mode` \(number\) mode \(only returned only returned if action is **not** play track, sound or script\)
  * `param` \(number\) parameter \(only returned only returned if action is **not** play track, sound or script\)
  * `active` \(number\) 0 = disabled, 1 = enabled

