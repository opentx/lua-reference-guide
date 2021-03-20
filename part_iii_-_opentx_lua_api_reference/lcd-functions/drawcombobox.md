# lcd.drawCombobox\(x, y, w, list, idx \[, flags\]\)

Draw a combo box

@status current Introduced in 2.0.0

## Parameters

* `x,y` \(positive numbers\) top left corner position
* `w` \(number\) width of combo box in pixels
* `list` \(table\) combo box elements, each element is a string
* `idx` \(integer\) index of entry to highlight
* `flags` \(unsigned number\) drawing flags, the flags can not be combined:
  * `BLINK` combo box is expanded
  * `INVERS` combo box collapsed, text inversed
  * `0 or not present` combo box collapsed, text normal

## Return value

none

### Notice

Only available on Taranis

