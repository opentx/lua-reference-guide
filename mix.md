# Mix Scripts

**WARNING
Do not use Lua mix scripts for controlling any aspect of your model that could cause a crash if script stops executing.
**

## General description

Each model can have several mix scripts associated with it. These scripts are run periodically for entire time that model is selected/active. These scripts behave similar to standard OpenTX mixers but at the same time provide much more flexible and powerful tool.

Typically mix scripts take several values as inputs, do some calculation or logic processing based on them and output one or more values. Each run of scripts should be as short as possible. Exceeding certain script execution runtime will result in script being forcefully stopped and disabled.


## Typical use

* replacement for complex mixes that are not critical to model function
* complex processing of inputs and reaction to their current state and/or their history
* filtering of telemetry values
* automatic detection of number of battery cells and setting of low battery threshold
* automatic announcment of maximum altitude for each DLG throw

## Limitations

* should not display anything on LCD screen.
* can't wait for user input via dialog.
* should not exceed maximum allowed runtime/ number of instructions.
* standard OpenTX mixes are run every XX milliseconds in a very deterministic way (guaranteed execution) while model scripts are run from another thread with less priority. Their execution period is around 30ms and is not guaranteed!
* a script could be disabled/killed anytime due to several causes like (error in script, not enough free memory, etc...)

### Anatomy

#### Location

Place them on SD card in folder /SCRIPTS/MIXES/

#### Lifetime

* script is loaded from SD card when model is selected
* script *init* function is called
* script *run* function is periodically called (inside GUI thread, period cca 30ms)
* script is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all model scripts are stopped while one-time script is running (see Lua One-time scripts)

#### Script interface definition

Every script must include a *return* statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* script *inputs* (optional)
* script *outputs* (optional)
* script *init* function (optional)
* script *run* function

For example:
```lua
-- script body would be here

return { input=inputs, output=outputs, run=run_func, init=init_func }
```

This example defines:
* inputs table (array) as input values to model script
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



