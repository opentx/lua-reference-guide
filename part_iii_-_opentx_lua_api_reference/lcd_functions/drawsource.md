# lcd.drawSource\(x, y, source \[, flags\]\)

Displays the name of the corresponding input as defined by the source at \(x,y\)

@status current Introduced in 2.0.0

### Parameters

* `x,y` \(positive numbers\) starting coordinate
* `source` \(number\) source index
* `flags` \(unsigned number\) drawing flags

### Return value

none

## Examples

[lcd/drawSource-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/lcd/drawSource-example.lua)

```lua
local function run(event)
  local source
  lcd.clear()
  lcd.drawText(1, 1,"drawSource() example", 0)
  for source = 1, 5 do
   lcd.drawSource(1, source * 10, source, 0)
   lcd.drawText(lcd.getLastPos(), source * 10, " is input source number " .. source)
  end
end

return{run=run}
```

![](../../.gitbook/assets/drawSource-example.png)

