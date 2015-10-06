# getValue() Function

#####Overview

The getValue() function is used to retrieve the current value of an OpenTX field.  OpenTX fields transmitter based data (sticks, switches, sliders, swr) as well as values for telemetry based data.

The getValue() function will accept a string argument, but the preferred practice is to use the getFieldInfo() function to retrieve an numeric field identifier during initialization (see Init Function Syntax).


```lua
local value=getValue(<fieldId>)
```