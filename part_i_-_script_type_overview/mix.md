# Mix Scripts

_**WARNING -**_  **Do not use Lua mix scripts for controlling any aspect of your model that could cause a crash if script stops executing.**

## Description

Each model can have several mix scripts associated with it. These scripts are run periodically for entire time that model is selected. These scripts behave similar to standard OpenTX mixers but at the same time provide much more flexible and powerful tool.

Mix scripts take one or more values as inputs, do some calculation or logic processing based on them and output one or more values. Each run of a script should be as short as possible. Exceeding the script execution runtime limit will result in the script being forcefully stopped and disabled.

## Typical uses

* replacement for complex mixes that are not critical to model function
* complex processing of inputs and reaction to their current state and/or their history
* filtering of telemetry values

## Limitations

* cannot update LCD screen or perform user input.
* should not exceed allowed run-time/ number of instructions.
* mix scripts are run with less priority than built-in mixes. Their execution period is around 30ms and is not guaranteed!
* can be disabled/killed anytime due to logic errors in script, not enough free memory, etc...\)

## Location

Place them on SD card in folder /SCRIPTS/MIXES/. File name length \(without extension\) **must be 6 characters or less** \(this limit was 8 characters in OpenTX 2.1\).

## Lifetime

* script is loaded from SD card when model is selected
* script _init_ function is called
* script _run_ function is periodically called \(inside GUI thread, period cca 30ms\)
* script is killed \(stopped and disabled\) if it misbehaves \(too long runtime, error in code, low memory\)
* all mix scripts are stopped while one-time script is running \(see Lua One-time scripts\)

### Disabled script

If as script output is used as a `mixer source` and the script is killed for what ever reason, then `the whole mixer line is disabled`! This can be used for example to provide a fall-back in case Lua mixer script gets killed.

Example where Lua mix script is used to drive ailerons in some clever way, but control falls back to the standard aileron mix if script is killed. Second mixer line replaces the first one when the script is alive:

```text
CH1  [I4]Ail Weight(+100%)
  := LUA4b Weight(+100%)
```

## Script interface definition

Every script must include a _return_ statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:

* script _input_ table \(optional, see [Input Table Syntax](../part_ii_-_opentx_lua_api_programming_guide/input_table_syntax.md)\)
* script _output_ table \(optional, see [Output Table Syntax](../part_ii_-_opentx_lua_api_programming_guide/output_table_syntax.md)\)
* script _init_ function \(optional, see [Init Function Syntax](../part_ii_-_opentx_lua_api_programming_guide/init_function_syntax.md)\)
* script _run_ function \(see [Run Function Syntax](../part_ii_-_opentx_lua_api_programming_guide/run_function_syntax.md)\)

### Example \(interface only\):

```lua
local input {}

local output {}

local function init_func()
end

local function run_func()
end

return { input=input, output=output, run=run_func, init=init_func }
```

### Notes:

* inputs table defines input parameters \(name and source\) to run function \([see Input Table Syntax](../part_ii_-_opentx_lua_api_programming_guide/input_table_syntax.md)\)
* outputs table defines names for values returned by run function \(see [Output Table Syntax](../part_ii_-_opentx_lua_api_programming_guide/output_table_syntax.md)\)
* init\_func\(\) function is called once when script is loaded.
* run\_func\(\) function is called periodically

