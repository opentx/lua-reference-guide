# playNumber\(value, unit \[, attributes\]\)

Play a numerical value \(text to speech\)

@status current Introduced in 2.0.0

## Parameters

* `value` \(number\) number to play. Value is interpreted as integer.
* `unit` \(number\) unit identifier \[Full list\]\(\(../appendix/units.html\)\)
* `attributes` \(unsigned number\) possible values:
  * `0 or not present` plays integral part of the number \(for a number 123 it plays 123\)
  * `PREC1` plays a number with one decimal place \(for a number 123 it plays 12.3\)
  * `PREC2` plays a number with two decimal places \(for a number 123 it plays 1.23\)

## Return value

none

