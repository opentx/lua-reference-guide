# getValue() Function

#####Overview

The getValue() function is used to retrieve the current value of an OpenTX field.  OpenTX fields include transmitter based data (sticks, switches, sliders, etc.) as well as telemetry based data (gps, rssi, etc.).

```lua
local value=getValue(<fieldId>)
```

* #####Input parameters
The getValue() function will accept a string argument, but the preferred practice is to use the [getFieldInfo()](getfieldinfo_function.md) function to retrieve an numeric field identifier during script initialization.

####Return Values
The format of the returned value can vary based on the field requested.

#####Analog return values
 - Analog values (sticks, switches) typically need to be divided by 10.24 to determine their actual range value.

|getValue() result|actual range|
|---|---|
|-1024|-100%|
|0|0%|
|1024|100%|

#####Simple return values
 - Simple return values may be lua numbers or a string

#####Table return values
 - Some fields return complex data via lua tables.
