# Key Event Constants

This page describes the value that is passed to scripts in the `event` parameter. It is used in [Telemetry](../../part_i_-_script_type_overview/telemetry.md) and [One-Time](../../part_i_-_script_type_overview/one-time_scripts.md) scripts.

## The key event mechanism

Each time a key is pressed, held and released a number of events get generated. Here is a typical flow:

* when a key is pressed a `FIRST` event is generated
* if the key continues to be pressed, then after a while a `LONG` event is generated
* if the key continues to be pressed, then a `REPEAT` events are being generated
* when the key is released a `BREAK` event is generated

Couple of examples:

* a short press on key would generate: `FIRST`, `BREAK`
* a longer pres on key would generate: `FIRST`, `LONG`, `BREAK`
* even longer press: `FIRST`, `LONG`, `REPEAT,`REPEAT, ..., `BREAK`

This normal key event sequence can be altered with the [killEvents\(key\)](../general_functions/killevents.md) function. Any time this function is called \(after the `FIRST` event\) all further key events for this key will be suppressed until the next key press of this key. Examples:

* kill immediately after the key press would generate: `FIRST`
* kill after the long key press would generate: `FIRST`, `LONG`

## Constants

The `event` parameter in the [Telemetry](../../part_i_-_script_type_overview/telemetry.md) and [One-Time](../../part_i_-_script_type_overview/one-time_scripts.md) scripts run function actually carries two pieces of information:

* key number
* type of event

The two fields are combined into one single number. Some of these combinations are defined as constants and are available to Lua scripts:

| Key Event Name | Comments |
| :---: | :---: |
| EVT\_MENU\_BREAK | **MENU** key release |
| EVT\_PAGE\_BREAK | **PAGE** key release |
| EVT\_PAGE\_LONG | **MENU** key long press |
| EVT\_ENTER\_BREAK | **ENT** key release |
| EVT\_ENTER\_LONG | **ENT** key long press |
| EVT\_EXIT\_BREAK | **EXIT** key release |
| EVT\_PLUS\_BREAK | **+** key release |
| EVT\_MINUS\_BREAK | **-** key release |
| EVT\_PLUS\_FIRST | **+** key press |
| EVT\_MINUS\_FIRST | **-** key press |
| EVT\_PLUS\_REPT | **+** key repeat |
| EVT\_MINUS\_REPT | **-** key repeat |

Radios with rotary encoder \(X7 and Horus\) have also:

| Key Event Name | Comments |
| :---: | :---: |
| EVT\_ROT\_BREAK | rotary encoder release |
| EVT\_ROT\_LONG | rotary encoder long press |
| EVT\_ROT\_LEFT | rotary encoder rotated left |
| EVT\_ROT\_RIGHT | rotary encoder rotated right |

