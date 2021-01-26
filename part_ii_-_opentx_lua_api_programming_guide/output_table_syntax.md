# Output Table Syntax

## Overview

Outputs are only used in mix scripts. The output table defines only name\(s\), the actual values are determined by the script's [run function](run_function_syntax.md).

```lua
{ "<name1>", "<name2>" }
```

Example:

```lua
local output { "Val1", "Val2" }

local function run()
    return 0, -1024 -- these values will be available in OpenTX as Val1 and Val2
end

return {output=output, run=run}
```

## Notes:

* Output name is limited to four characters.
* A maximum of 6 outputs are supported
* Number Format Outputs are 16 bit signed integers when they leave Lua script and are then divided by 10.24 to produce output value in percent:

| Script Return Value | Mix Value in OpenTX |
| :--- | :--- |
| 0 | 0% |
| 996 | 97.2% |
| 1024 | 100% |
| -1024 | -100% |

