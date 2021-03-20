# model.getOutput\(index\)

Get servo parameters

@status current Introduced in 2.0.0

## Parameters

* `index` \(unsigned number\) output number \(use 0 for CH1\)

## Return value

* `nil` requested output does not exist
* `table` output parameters:
  * `name` \(string\) name
  * `min` \(number\) Minimum % \* 10
  * `max` \(number\) Maximum % \* 10
  * `offset` \(number\) Subtrim \* 10
  * `ppmCenter` \(number\) offset from PPM Center. 0 = 1500
  * `symetrical` \(number\) linear Subtrim 0 = Off, 1 = On
  * `revert` \(number\) irection 0 = ­­­---, 1 = INV
  * `curve`
    * \(number\) Curve number \(0 for Curve1\)
    * or `nil` if no curve set

