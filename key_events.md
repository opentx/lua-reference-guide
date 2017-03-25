# Key Events

This page describes the value that is passed to scripts in the `event` parameter. It is used in [Telemetry](telemetry.md) and [One-Time](one-time_scripts.md) scripts.

## The key event mechanism

Each time a key is pressed, held and released a number of events get generated.  Here is a typical flow:
 * when a key is pressed a `FIRST` event is generated
 * if the key continues to be pressed, then after a while a `LONG` event is generated
 * if the key continues to be pressed, then a `REPEAT` events are being generated
 * when the key is released a `BREAK` event is generated

Couple of examples:
 * a short press on key would generate: `FIRST`, `BREAK`
 * a longer pres on key would generate: `FIRST`, `LONG`, `BREAK`
 * even longer press: `FIRST`, `LONG`, `REPEAT, `REPEAT, ..., `BREAK`

This normal key event sequence can be altered with the [killEvents(key)](general/killEvents.md) function. Any time this function is called (after the `FIRST` event) all further key events for this key will be suppressed until the next key press of this key. Examples:
 * kill immediately after the key press would generate: `FIRST`
 * kill after the long key press would generate: `FIRST`, `LONG`


## Constants

The `event` parameter in the [Telemetry](telemetry.md) and [One-Time](one-time_scripts.md) scripts run function actually carries two pieces of information:
 * key number
 * type of event

The two fields are combined into one single number. Some of these combinations are defined as constants and are available to Lua scripts:

|Key Event Name|Comments|
|:--------:|:-------:|
|EVT_MENU_BREAK| **MENU** key release |
|EVT_PAGE_BREAK| **PAGE** key release |
|EVT_PAGE_LONG| **MENU** key long press |
|EVT_ENTER_BREAK| **ENT** key release |
|EVT_ENTER_LONG| **ENT** key long press|
|EVT_EXIT_BREAK| **EXIT** key release |
|EVT_PLUS_BREAK| **+** key release |
|EVT_MINUS_BREAK| **-** key release |
|EVT_PLUS_FIRST| **+** key press |
|EVT_MINUS_FIRST| **-** key press |
|EVT_PLUS_RPT| **+** key repeat |
|EVT_MINUS_RPT|**-** key repeat|

Radios with rotary encoder (X7 and Horus) have also:

|Key Event Name|Comments|
|:--------:|:-------:|
|EVT_ROT_BREAK| rotary encoder release |
|EVT_ROT_LONG| rotary encoder long press |
|EVT_ROT_LEFT| rotary encoder rotated left |
|EVT_ROT_RIGHT| rotary encoder rotated right |
