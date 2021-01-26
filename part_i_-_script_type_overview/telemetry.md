# Telemetry Scripts

## Telemetry Scripts

## General description

Telemetry scripts are used for building customized screens. Each model can have up to three active scripts as configured on the model's telemetry configuration page. The same script can be assigned to multiple models.

## File Location

Scripts are located on the SD card in the folder /SCRIPTS/TELEMETRY/&lt;_name_&gt;.lua. File name length \(without extension\) **must be 6 characters or less** \(this limit was 8 characters in OpenTX 2.1\).

## Lifetime of telemetry script

Telemetry scripts are started when the model is loaded.

* script init function is called
* script background function is periodically called when custom telemetry screen is **not visible**. _Notice_:
  * In OpenTX 2.0 this function is **not called** when the custom telemetry screen is visible.
  * Starting from OpenTX 2.1 this function is **always called** no matter if the custom screen is visible or not.
* script run function is periodically called when custom telemetry screen is **visible**
* script is stopped and disabled if it misbehaves \(too long runtime, error in code, low memory\)
* all telemetry scripts are stopped while one-time script is running \(see Lua One-time scripts\)

## Script interface definition

Every script must include a return statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:

* script **init** function _\(optional\)_
* script **background** function
* script **run** function

### Example \(interface only\):

```lua
local function init_func()
  -- init_func is called once when model is loaded
end

local function bg_func()
  -- bg_func is called periodically (always, the screen visibility does not matter)
end

local function run_func(event)
  -- run_func is called periodically only when screen is visible
end

return { run=run_func, background=bg_func, init=init_func  }
```

### Notes:

* `init_func()` function is called once when script is loaded and begins execution.
* `bg_func()` is called periodically, the screen visibility does not matter.
* `run_func(event)` function is called periodically when custom telemetry screen is visible. The `event` parameter indicates which transmitter button has been pressed \(see [Key Events](../part_iii_-_opentx_lua_api_reference/constants/key_events.md)\). This is the time when the script has full control of the LCD screen and keys and should draw something on the screen.

