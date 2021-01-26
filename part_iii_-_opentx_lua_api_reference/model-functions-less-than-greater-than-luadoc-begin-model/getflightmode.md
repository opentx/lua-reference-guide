# model.getFlightMode\(index\)

Return input data for given input and line number

@status current Introduced in 2.3.10

## Parameters

* `index` \(unsigned number\) flight mode number \(use 0 for FM0\)

## Return value

* `nil` requested input or line does not exist
* `table` input data:
  * `name` \(string\) input line name
  * `switch` \(number\) input switch index
  * `fadeIn` \(number\) fade in value \(in 0.1s\)
  * `fadeOut` \(number\) fade out value \(in 0.1s\)
  * `trimsValues` \(table\) table of trim values:
    * `key` is trim number \(zero based\)
    * `value` is trim value
  * `trimsModes` \(table\) table of trim mode:
    * `key` is trim number \(zero based\)
    * `value` is trim mode

