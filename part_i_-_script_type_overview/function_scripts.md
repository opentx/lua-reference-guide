# Function Scripts

## Overview

Function scripts are invoked via the **'Lua Script'** option of Special Functions configuration page.

![Companion Special Functions Window](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/CompanionSpecialFunctions.png)

![Taranis Special Functions Display](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/RadioSpecialFunctions.png)

## Typical uses

* specialized handling in response to switch position changes
* customized announcements

## Limitations

* should not exceed allowed run-time/ number of instructions.
* all function scripts are stopped while one-time script is running \(see Lua One-time scripts\)
* Function scripts **DO NOT HAVE ACCESS TO LCD DISPLAY**

## Location

Place them on SD card in folder /SCRIPTS/FUNCTIONS/

## Lifetime

* script _init_ function is called once when model is loaded
* script _run_ function is periodically called as long as switch condition is true
* script is stopped and disabled if it misbehaves \(too long runtime, error in code, low memory\)

## Script interface definition

Every script must include a _return_ statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:

* script _init_ function \(optional, see [Init Function Syntax](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/init_function_syntax.md)\)
* script _run_ function \(see [Run Function Syntax](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/run_function_syntax.md)\)

## Example \(interface only\):

```lua
local function init_func()
end

local function run_func()
end

return { run=run_func, init=init_func }
```

## Notes:

* local variables retain their values for as long as the model is loaded regardless of switch condition value

## Advanced example \(save as /SCRIPTS/FUNCTIONS/cntdwn.lua\)

The script below is an example of customized countdown announcements. Note that the init function determines which version of OpenTX is running and sets the unit parameter for playNumber\(\) accordingly.

```lua
local lstannounce
local target

local running = false

local duration = 120 -- two minute countdown
local announcements = { 120, 105, 90, 75, 60, 55, 50, 45, 40, 35, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
local annIndex

local minUnit

local function init()
  local version = getVersion()
  if version < "2.1" then
    minUnit = 16  -- unit for minutes in OpenTX 2.0
  elseif version < "2.2" then
    minUnit = 23  -- unit for minutes in OpenTX 2.1
  else
    minUnit = 25  -- unit for minutes in OpenTX 2.2
  end
end

local function run()

  local timenow = getTime() -- 10ms tick count
  local remaining
  local minutes
  local seconds

  if not running then
    running = true
    target = timenow + (duration * 100)
    annIndex = 1
  end

  remaining = math.floor(((target - timenow) / 100) + .7) --  +.7 adjust for announcement lag

  if remaining < 0 then
    running = false -- we were 'paused' and missed zero
    return
  end

  while remaining < announcements[annIndex] do
    annIndex = annIndex + 1 -- catch up in case we were paused
  end

  if remaining == announcements[annIndex] then
    minutes = math.floor(remaining / 60)
    seconds = remaining % 60
    if minutes > 0 then
      playNumber(minutes, minUnit, 0)
    end
    if seconds > 0 then
      playNumber(seconds, 0, 0)
    end
    annIndex = annIndex + 1
  end

  if remaining <= 0 then
    playNumber(0,0,0)
    running = false
  end

end

return { init=init, run=run }
```

