Widgets (HORUS ONLY) Scripts

#####Overview

Widgets are small scripts that show some info in a 'zone' in one of the model specific user defined (telemetry) screens through the telemetry menu on the HORUS.
Once registered, they will run automatically at model activation.

File Location

The widget script itself needs to be named 'main.lua'.
Place them on the SD card in the folder /WIDGETS/yourWidget. Name the 'yourWidget' subfolder with a name that is convienient to you.

Lifetime of Widgets

Widgets are executed when registered for a screen on the active model.

Widget executes until:

a one-time script is run
it is deregistered from the screen
is forcefully closed by system if if it misbehaves (too long runtime, error in code, low memory)
