# lcd.drawRectangle\(x, y, w, h \[, flags \[, t\]\]\)

Draw a rectangle from top left corner \(x,y\) of specified width and height

@status current Introduced in 2.0.0, changed in 2.2.0

### Parameters

* `x,y` \(positive numbers\) top left corner position
* `w` \(number\) width in pixels
* `h` \(number\) height in pixels
* `flags` \(unsigned number\) drawing flags
* `t` \(number\) thickness in pixels, defaults to 1 \(only on Horus\)

### Return value

none

## Examples

[lcd/drawRectangle-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/lcd/drawRectangle-example.lua)

```lua
local function run()
lcd.clear()
lcd.drawText(10,22,"drawRectangle()",DBLSIZE)
lcd.drawRectangle(5, 5, 150, 50, SOLID)
lcd.drawRectangle(6, 6, 150, 50, GREY_DEFAULT)
lcd.drawRectangle(7, 7, 150, 50, SOLID)
lcd.drawRectangle(8, 8, 150, 50, GREY_DEFAULT)
end

return{run=run}
```

![](../../.gitbook/assets/drawRectangle-example.png)

