### Mix Scripts

***WARNING - ***
**Do not use Lua mix scripts for controlling any aspect of your model that could cause a crash if script stops executing.**

##### Description

Each model can have several mix scripts associated with it. These scripts are run periodically for entire time that model is selected. These scripts behave similar to standard OpenTX mixers but at the same time provide much more flexible and powerful tool.

Mix scripts take one or more values as inputs, do some calculation or logic processing based on them and output one or more values. Each run of a script should be as short as possible. Exceeding the script execution runtime limit will result in the script being forcefully stopped and disabled.


##### Typical uses

* replacement for complex mixes that are not critical to model function
* complex processing of inputs and reaction to their current state and/or their history
* filtering of telemetry values

##### Limitations

* cannot update LCD screen or perform user input.
* should not exceed allowed run-time/ number of instructions.
* mix scripts are run with less priority than built-in mixes. Their execution period is around 30ms and is not guaranteed!
* can be disabled/killed anytime due to logic errors in script, not enough free memory, etc...)

##### Location

Place them on SD card in folder /SCRIPTS/MIXES/

##### Lifetime

* script is loaded from SD card when model is selected
* script *init* function is called
* script *run* function is periodically called (inside GUI thread, period cca 30ms)
* script is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all model scripts are stopped while one-time script is running (see Lua One-time scripts)

##### Script interface definition

Every mix script must include a *return* statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* script *input* table (optional)
* script *output* table (optional)
* script *init* function (optional)
* script *run* function

#####Example (interface only):
```lua
local input {}

local output {}

local function init_func()
end

local function run_func()
end

return { input=input, output=output, run=run_func, init=init_func }
```

#####Notes:
* inputs table defines input parameters (name and source) to run function ([see Input Table Syntax](input_table_syntax.md))
* outputs table defines names for values returned by run function (see [Output Table Syntax](output_table_syntax.md))
* init_func() function is called once when script is loaded.
* run_func() function is called periodically








