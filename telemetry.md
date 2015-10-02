### Telemetry Scripts

##### General description

Telemetry scripts are used for building customized screens. Each model can have up to three active scripts as configured on the model's telemetry configuration page. The same script can be assigned to multiple models.

##### File Location

Scripts are located on the SD card in the folder /SCRIPTS/TELEMETRY/&lt;name&gt;.lua (name must be in 8 characters or less).

##### Lifetime of telemetry script

Telemetry scripts are started when the model is loaded.

* script init function is called
* script background function is periodically called when custom telemetry screen is **not visible**
* script run function is periodically called when custom telemetry screen is **visible**
* script is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all telemetry scripts are stopped while one-time script is running (see Lua One-time scripts)

### Script interface definition

Every script must include a return statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* script **init** function *(optional)*
* script **background** function
* script **run** function

For example:

```
local function init_func()
  -- init_func is called once when model is loaded
end

local function bg_func()
  -- bg_func is called periodically when screen is not visible
end

local function run_func(event)
  -- run_func is called periodically when screen is visible
  bg_func() -- run typically calls bg_func to start
end

return { run=run_func, background=bg_func, init=init_func  }
```

Note:

* *init_func()* function is called once when script is loaded and begins execution.
* *bg_func()* is called periodically when custom telemetry screen is not visible.
* *run_func(key-event)* function is called periodically when custom telemetry screen is visible. The *key-event* parameter indicates which transmitter button has been pressed (see [Key Events](key_events.md))


