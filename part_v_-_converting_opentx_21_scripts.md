# Part V - Converting OpenTX 2.1 Scripts

This section also covers some of the requirements for scripts that are necessary for them to function properly under both OpenTX 2.2.

## New features

* LUA Widgets \(Horus only\)
* LUA Themes \(Horus only\)

## Changes

* Lua Themes and Widgets run in a separate Lua environment. They are isolated from the other Lua environment which runs other scripts. This means they can not share variables, etc... \(Horus only\)
* Function scripts can have a `background()` function defined \(similar to the Telemetry scripts\). It will be called periodically when the switch that activates it is FALSE.
* Horus doesn't support Telemetry scripts.
* Telemetry and Mix scripts maximum file name length \(without extension\) was reduced from 8 to 6 characters.
* Telemetry and Mix scripts maximum number of inputs reduced from 8 to 6

### LCD Functions

* Function `lcd.lock()` was removed.
* New function `lcd.refresh()`.
* Default number alignment changed from RIGHT to LEFT.
* `lcd.getLastPos()` is not available on Horus
* Functions only available on Horus:
  * `lcd.drawBitmap()`
  * `lcd.setColor()`
  * `lcd.RGB()`
* Functions only available on Taranis:
  * `lcd.drawPixmap`
  * `lcd.drawScreenTitle`
  * `lcd.drawCombobox`

### General Functions

* `RIGHT` added
* Rotary encoder events added:
  * `EVT_ROT_BREAK`
  * `EVT_ROT_LONG`
  * `EVT_ROT_LEFT`
  * `EVT_ROT_RIGHT`

