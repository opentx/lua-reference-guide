# Run Function Syntax

The run function is the function that is periodically called for the entire lifetime of script. Syntax of run function is different between mix scripts and telemetry scripts.

##### Mix Script Syntax
```lua
local <run_function_name>([first input, [second input], …])
```

Input Parameters:
<>
zero or more input values, their names are arbitrary, their meaning and order is defined by the input table

Return Values:
none
if output table is empty (i.e. script has no output)


values
(comma separated list of values) list of output values,                         their order and meaning is defined by the output table