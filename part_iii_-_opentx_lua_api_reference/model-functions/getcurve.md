# model.getCurve\(curve\)

Get Curve parameters

Note that functions returns the tables starting with index 0 contrary to LUA's usual index starting with 1

@status current Introduced in 2.0.12

## Parameters

* `curve` \(unsigned number\) curve number \(use 0 for Curve1\)

## Return value

* `nil` requested curve does not exist
* `table` curve data:
  * `name` \(string\) name
  * `type` \(number\) type
  * `smooth` \(boolean\) smooth
  * `points` \(number\) number of points
  * `y` \(table\) table of Y values:
    * `key` is point number \(zero based\)
    * `value` is y value
  * `x` \(table\) **only included for custom curve type**:
    * `key` is point number \(zero based\)
    * `value` is x value

