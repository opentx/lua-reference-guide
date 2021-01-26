# lcd.drawPixmap\(x, y, name\)

Draw a bitmap at \(x,y\)

@status current Introduced in 2.0.0

### Parameters

* `x,y` \(positive numbers\) starting coordinates
* `name` \(string\) full path to the bitmap on SD card \(i.e. “/IMAGES/test.bmp”\)

### Return value

none

#### Notice

Only available on Taranis X9 series. Maximum image size if 106 x 64 pixels \(width x height\).

## Examples

[lcd/drawPixmap-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/lcd/drawPixmap-example.lua)

```lua
local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawPixmap() example", 0)
  lcd.drawPixmap(96, 0, "/bmp/lua.bmp")
end

return{run=run}
```

![](../../.gitbook/assets/drawPixmap-example.png)

