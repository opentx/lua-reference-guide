# Input Table Syntax

## Overview

The input table defines what values are available as input\(s\) to [mix scripts](../part_i_-_script_type_overview/mix.md). There are two forms of input table entries.

* **SOURCE syntax**

  ```lua
  { "<name>", SOURCE }
  ```

  SOURCE inputs provide the current value of a selected OpenTX variable. The source must set by the user when the mix script is configured. Source can be any value OpenTX knows about \(inputs, channels, telemetry values, switches, custom functions,...\).  
  _Note:_ typical range is -1024 thru +1024. Simply divide the input value by 10.24 to interpret as a percentage from -100% to +100%.

* **VALUE syntax**

  ```lua
  { "<name>", VALUE, <min>, <max>, <default> }
  ```

  VALUE inputs provide a constant value that is set by the user when the mix script is configured.

  * _name_ - maximum length of 8 characters
  * _min_ - minimum value of -128
  * _max_ - maximum value of 127
  * _default_ - must be within the valid range specified

* **Maximum of 6 inputs per script \(warning : was 8 in 2.1\)**

## Example using a SOURCE and a VALUE

```lua
local input =
    {
        { "Strength", SOURCE},                -- user selects source (typically slider or knob)
        { "Interval", VALUE, 0, 100, 0 }    -- interval value, default = 0.
    }

local function run(strength, interval)
    -- variable strength will contain the current slider value
    -- variable interval is set by the user and constant through script lifetime

    -- this script has no return value but may use playFile() to alert user

    return
end

return {input=input, run=run}
```

