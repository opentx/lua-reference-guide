# Lua data sharing across scripts

## Overview:

OpenTX considers all function, mix, and telemetry scripts to be 'permanent' scripts that share the same runtime environment. They are typically loaded at power up or when a new model is selected. However, they are also reinitialized when a script is added or removed during model editing.

## Lua scoping rules:

Any variable or function not declared local is implicitly global. Care must be taken to avoid unintentional global declarations, and ensure that the globals you intentionally declare have unique names to avoid conflicts with scripts written by others.

## Example:

This example consists of three scripts

* **count-dn.lua** - this is a mix script than can be run stand alone to announce time remaining based on a user-defined switch and duration.  It updates two global variables \(gCountUp and gCountDown\).  It also creates output values \(ctup and ctdn\) which are for demonstration purposes only.
* **count-up.lua** - this is an optional function script which will do count up announcements based on harded coded values.
* **shocount.lua** - this is an optional telemetry script which simply shows the current values of the gCountUp and gCountDown variables.

## Installation:

* count-dn.lua
  * copy to /SCRIPTS/MIXES
  * configure on the transmitter CUSTOM SCRIPT page
    * suggested switch = "SA"
    * suggested mins = 3
    * suggested sw\_high = 0
  * screen image:

    ![count-dn.lua mix script](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/count-dn.png)
* count-up.lua
  * copy to /SCRIPTS/FUNCTIONS
  * configure on the transmitter SPECIAL FUNCTIONS page
    * suggested switch SA\(down\)
  * screen image:

    ![count-up.lua function script](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/count-up.png)
* shocount.lua
  * copy to /SCRIPTS/TELEMETRY
  * configure on the transmitter TELEMETRY page
  * screen image:

    ![shocount.lua function script](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/shocount.png)

## Script sources:

### count-dn.lua

```lua
-- these globals can be referenced in function and telemetry scripts
gCountUp = 0
gCountDown = 0

local target
local running = false
local complete = false
local announcements = { 720, 660, 600, 540, 480, 420, 360, 300, 240, 180, 120, 105, 90, 75, 60, 55, 50, 45, 40, 35, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
local annIndex -- index into the announcements table (1 based)
local minUnit -- used by playNumber() for unit announcement

local input =
    {
        { "switch", SOURCE},        -- switch used to activate count down
        { "mins", VALUE, 1, 12, 2 },    -- minutes to count down
        { "sw_high", VALUE, 0, 1, 1 } -- 0 = active when low, otherwise active when high
    }

local output = {"ctup", "ctdn" }     

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

local function countdownIsRunning(switch, sw_high)
  -- evaluate switch - return true if we should be counting down
  if (sw_high > 0) then
    return (switch > -1000)
  else
    return (switch < 1000)
  end
end

local function run(switch, mins, sw_high)
  local timenow = getTime() -- 10ms tick count
  local minutes
  local seconds

  if (not countdownIsRunning(switch, sw_high)) then
      running = false
      complete = false
      return 0, 0 -- ***** NOTE: early exit *****
  end

  if (complete) then
    return 0, 0 -- must reset the switch before we go again
  end

  if (not running) then
    running = true
    target = timenow + ((mins * 60) * 100)
    annIndex = 1
  end

  gCountDown = math.floor(((target - timenow) / 100) + .7) --  + is adj. to for announcement lag
  gCountUp = (mins * 60) - gCountDown

  while gCountDown < announcements[annIndex] do
    annIndex = annIndex + 1 -- catch up
  end

  if gCountDown == announcements[annIndex] then
    minutes = math.floor(gCountDown / 60)
    seconds = gCountDown % 60
    if minutes > 0 then
      playNumber(minutes, minUnit, 0)
    end
    if seconds > 0 then
      playNumber(seconds, 0, 0)
    end
    annIndex = annIndex + 1
  end

  if gCountDown <= 0 then
    playNumber(0,0,0)
    running = false
    gCountDown = 0
    complete = true
  end

  return gCountUp * 10.24, gCountDown * 10.24
end

return { input=input, output=output, init=init, run=run }
```

### count-up.lua

```lua
gCountUp = 0

local min = 5
local max = 30
local last = 0
local announcements = { 5, 10, 15, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29 }
local annIndex = 1

local function run(e)
  if not (gCountUp == last) then
    last = gCountUp
    for key, value in pairs(announcements) do
        if value == last then
          playNumber(last, 0, 0)
        end
    end    
  end
end

return{run=run}
```

### shocount.lua

```lua
-- these globals can be referenced in mix, function, and telemetry scripts
gCountUp = 0
gCountDown = 0

local function run(e)
  lcd.clear()
  lcd.drawText(1,1,"OpenTx Lua Data Sharing",0)

  lcd.drawText(1,11,"gCountUp:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,gCountUp,0)
  lcd.drawText(1, 21, "gCountDown:", 0)
  lcd.drawText(lcd.getLastPos()+2,21,gCountDown,0)
end

return{run=run}
```

