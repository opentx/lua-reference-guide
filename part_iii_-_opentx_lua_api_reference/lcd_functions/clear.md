# lcd.clear\(\[color\]\)

Clear the LCD screen

@status current Introduced in 2.0.0, `color` parameter introduced in 2.2.0 RC12

### Parameters

* `color` \(optional, only on color screens\)

### Return value

none

#### Notice

This function only works in stand-alone and telemetry scripts.

## Examples

[lcd/clear-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/lcd/clear-example.lua)

```lua
--
--
-- This example demonstrates the lcd.clear() function
--
-- NOTE: Compare the output of the images below
--       lcd.clear() is NOT CALLED automatically in OpenTX 2.1
--

local startTicks
local nowTicks

local function init()
  startTicks = getTime() / 100.0
end

local function background()
  nowTicks = getTime() / 100.0
end

local function run(e)
  background()
  local interval = 10 - math.floor(nowTicks % 10)
  lcd.drawText(1, 1, "clear() example",0)
  lcd.drawText((10 * interval) + 1, 10 , interval, 0)
  if interval == 10 then
    lcd.clear()
  end
end

return{run=run, background=background}
```

## clear-example.lua running under OpenTX 2.1

![](../../.gitbook/assets/clear-example1.png)

## clear-example.lua running under OpenTX 2.0

![](../../.gitbook/assets/clear-example2.png)

