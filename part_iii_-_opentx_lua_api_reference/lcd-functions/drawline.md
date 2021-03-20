# lcd.drawLine\(x1, y1, x2, y2, pattern, flags\)

Draw a straight line on LCD

@status current Introduced in 2.0.0, flags introduced in 2.3.6

## Parameters

* `x1,y1` \(positive numbers\) starting coordinate
* `x2,y2` \(positive numbers\) end coordinate
* `pattern` SOLID or DOTTED
* `flags` lcdflags

## Return value

none

### Notice

If the start or the end of the line is outside the LCD dimensions, then the whole line will not be drawn \(starting from OpenTX 2.1.5\)

