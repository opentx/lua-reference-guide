# Input Table Syntax

#####Overview

The input table defines what values are available as input to [mix scripts](mix.md). There are two forms of input table entries.

* #####SOURCE input definition
```lua
{ "<name>", SOURCE }
```
SOURCE inputs provide the current value of a selected OpenTX variable (stick position, slider, channel). User assigns actual source for this input in Custom script user interface. Source can be any value OpenTX knows about (inputs, channels, telemetry values, switches, custom functions,...).<br/>
*Note:* see getValue() function for proper interpretation of input values.


* #####Value input definition

#####Source input example

#####Value input example

