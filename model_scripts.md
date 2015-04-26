# Model Scripts

**WARNING
Do not use Lua model scripts for controlling any aspect of your model that could cause a crash if script stops executing.
**

## General description

Each model can have several model scripts associated with it. These scripts are run periodically for entire time that model is selected/active. These scripts behave similar to standard OpenTX mixers but at the same time provide much more flexible and powerful tool.

Typically model scripts take several values as inputs, do some calculation or logic processing based on them and output one or more values. Each run of scripts should be as short as possible. Exceeding certain script execution runtime will result in script being forcefully stopped and disabled.

See also:
* Lua One-time Scripts describes one-time running general scripts
* Lua Function Scripts
* Lua Telemetry Scripts
* Lua Script Reference detailed reference of OpenTX Lua implementation and interface
* Lua Script Examples some example scripts with comments

## Examples of typical use of model scripts

* replacement for complex mixes that are not critical to model function
* complex processing of inputs and reaction to their current state and/or their history
* filtering of telemetry values
* automatic detection of number of battery cells and setting of low battery threshold
* automatic announcing of maximum altitude for each DLG throw
* see also Lua Script Examples

## Limitations of model scripts

* should not display anything on LCD screen.
* can't wait for user input via dialog.
* should not exceed maximum allowed runtime/ number of instructions.
* standard OpenTX mixes are run every XX milliseconds in a very deterministic way (guaranteed execution) while model scripts are run from another thread with less priority. Their execution period is around 30ms and is not guaranteed!
* a script could be disabled/killed anytime due to several causes like (error in script, not enough free memory, etc...)
