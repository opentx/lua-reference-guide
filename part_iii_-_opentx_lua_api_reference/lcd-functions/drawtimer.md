# lcd.drawTimer\(x, y, value \[, flags\]\)

Display a value formatted as time at \(x,y\)

@status current Introduced in 2.0.0, `SHADOWED` introduced in 2.2.1

## Parameters

* `x,y` \(positive numbers\) starting coordinate
* `value` \(number\) time in seconds
* `flags` \(unsigned number\) drawing flags:
  * `0 or not specified` normal representation \(minutes and seconds\)
  * `TIMEHOUR` display hours
  * other general LCD flag also apply
  * `SHADOWED` Horus only, apply a shadow effect

## Return value

none

