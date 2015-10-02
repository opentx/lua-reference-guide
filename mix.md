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
* script *inputs* table (optional)
* script *outputs* table (optional)
* script *init* function (optional)
* script *run* function

#####Example (interface only):
```
local inputs {}

local outputs {}

local function init_func()
end

local function run_func()
end

return { input=inputs, output=outputs, run=run_func, init=init_func }
```

This example defines:
* inputs table as input values to model script
* outputs table as output of model script
* run_func() function as periodic execution function that takes inputs as parameters and returns outputs table
* init_func() function as function that is called one time when script is loaded and begins execution.

Parameters *init*, *input* and *output* are optional. If model script doesn't use them, they can be omitted from return statement. Example without *init* and *output*:

```
local inputs = { { "Aileron", SOURCE }, { "Ail. ratio", VALUE, -100, 100, 0 } }

local function run_func(ail, ratio)
    -- do some stuff
    if (ail > 50) and ( ratio < 40) then
        playFile("foo.wav")    
    end
end

-- script that only uses input and run
return { run=run_func, input=inputs }
```

#### Script initialization

If defined, *init* function is called right after the script is loaded from SD card and begins execution. Init is called only once before the run function is called for the first time.

local <init_function_name>()

called once before first call to run function

Parameters: none

Returns: none


#### Script execution

The run function is the function that is periodically called for the entire lifetime of script. Syntax of run function is different between model scripts and one-time scripts.
local <run_function_name>([first input, [second input], …])


Parameters:
<>
zero or more input values, their names are arbitrary, their meaning and order is defined by the input table

Returns:
none
if output table is empty (i.e. script has no output)


values
(comma separated list of values) list of output values,                         their order and meaning is defined by the output table



