# Run Function Syntax

The run function is the function that is periodically called for the entire lifetime of script. Syntax of run function is different between [mix scripts](#mix-script-syntax) and [telemetry scripts](#telemetry-script-syntax).

<a name="mix-script-syntax"></a>
##### Mix Script Syntax
```lua
local function <run_function_name>([first input, [second input], …])
end
```

Input Parameters:
<>
zero or more input values, their names are arbitrary, their meaning and order is defined by the input table. (see [Inputs Table Syntax](inputs_table__syntax.md))

Return Values:
none
if output table is empty (i.e. script has no output)


values
(comma separated list of values) list of output values,                         their order and meaning is defined by the output table

<a name="telemetry-script-syntax"></a>
#####Telemetry Script Syntax
```lua
local function <run_function_name>(key-event)
  return 0 -- values other than zero will halt the script
end
```
The *key-event* parameter indicates which transmitter button has been pressed (see [Key Events](key_events.md))