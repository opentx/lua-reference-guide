# popupInput\(title, event, input, min, max\)

Raises a pop-up on screen that allows uses input

@status current Introduced in 2.0.0

## Parameters

* `title` \(string\) text to display
* `event` \(number\) the event variable that is passed in from the run function \(key pressed\)
* `input` \(number\) value that can be adjusted by the +/­- keys
* `min` \(number\) min value that input can reach \(by pressing the -­ key\)
* `max` \(number\) max value that input can reach

## Return value

* `number` result of the input adjustment
* `"OK"` user pushed ENT key
* `"CANCEL"` user pushed EXIT key

### Notice

Use only from stand-alone and telemetry scripts.

