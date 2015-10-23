# Function Scripts

#####Overview

Function scripts are invoked via the **'Lua Script'** option of Special Functions configuration page.

<div class=todo>
TODO: review all content on this page for accuracy.  Documentation for 2.0.x was non-existent, scripts to not appear to get invoked on 2.1.x
</div>

##### Typical uses

* specialized handling in response to switch position changes
* customized announcement of telemetry values

##### Limitations

* should not exceed allowed run-time/ number of instructions.

##### Location

Place them on SD card in folder /SCRIPTS/FUNCTIONS/

##### Lifetime

* script *init* function is called
* script *run* function is periodically called (inside GUI thread, period cca 30ms) until it returns a non-zero result
* script is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all mix scripts are stopped while function script is running 

##### Script interface definition

Every mix script must include a *return* statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* script *init* function (optional, see [Init Function Syntax](init_function_syntax.md))
* script *run* function (see [Run Function Syntax](run_function_syntax.md))

#####Example (interface only):
```lua
local function init_func()
end

local function run_func()
end

return { input=input, output=output, run=run_func, init=init_func }
```

#####Notes:
* init_func() function is called once when script is loaded.
* run_func() function is called periodically until it returns a non-zero result

