# model.getGlobalVariable\(index, flight\_mode\)

Return current global variable value

Example:

```lua
  -- get GV3 (index = 2) from Flight mode 0 (FM0)
  val = model.getGlobalVariable(2, 0)
```

## Parameters

* `index` zero based global variable index, use 0 for GV1, 8 for GV9
* `flight_mode` Flight mode number \(0 = FM0, 8 = FM8\)

## Return value

* `nil` requested global variable does not exist
* `number` current value of global variable

### Notice

a simple warning or notice

