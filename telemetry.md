### Telemetry Scripts

#### General description

These scripts are used for building customized telemetry screens.

#### Anatomy of telemetry script

##### Location of telemetry scripts

Place them on SD card in the folder /SCRIPTS/TELEMETRY/<name>.lua (name must be in 8.3 format).

##### Lifetime of telemetry script

Telemetry scripts are loaded from SD card and executed when the model is loaded.

* script init function is called
* script background function is periodically called when custom telemetry screen is not visible
* script run function is periodically called when custom telemetry screen is visible
* script is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all telemetry scripts are stopped while one-time script is running (see Lua One-time scripts)

### Script interface definition

Every script must include a return statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* script init function (optional)
* script background function
* script run function

For example:

```
-- this empty template can be used for telemetry scripts

local function init_func()
  -- init_func is called once when model is loaded
end

local function bg_func()
  -- bg_func is called periodically when screen is not visible
end

local function run_func()
  -- run_func is called periodically when screen is visible
  bg_func() -- run typically calls bg_func to start
end

return { run=run_func, background=bg_func, init=init_func  }
```

This example defines:
bckgrnd_func() function as periodic execution function that is periodically called when custom telemetry screen is not visible
run_func() function as periodic execution function that is periodically called when custom telemetry screen is visible
init_func() function as function that is called one time when script is loaded and begins execution.
Parameter init is optional.
Script initialization

see script initialization
Script execution

The run or background function is the function that is periodically called for the entire lifetime of script. Which one is called depends on the visibility of custom telemetry screen:
not visible - the background function is called. Script should not draw to screen. Usually used to store/process telemetry data.
visible - run function is called. Script should draw its screen.
local <background_function_name>()
Parameters:
none
Returns:
none
local <run_function_name>(event)
Parameters:
event
number that contains currently active key press code. If no key is pressed, the value is 0
Event contains two distinct fields:
  * what happened (key up, key down, long key press, etc).
  * which key is/was pressed.
Returns:
none
Examples
Telemetry Screen #1
Telemetry Screen #2