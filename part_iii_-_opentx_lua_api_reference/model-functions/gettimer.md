# model.getTimer\(timer\)

Get model timer parameters

@status current Introduced in 2.0.0, name added in 2.3.6

## Parameters

* `timer` \(number\) timer index \(0 for Timer 1\)

## Return value

* `nil` requested timer does not exist
* `table` timer parameters:
  * `mode` \(number\) timer trigger source: off, abs, stk,  stk%, sw/!sw, !m\_sw/!m\_sw
  * `start` \(number\) start value \[seconds\], 0 for up timer, 0&gt; down timer
  * `value` \(number\) current value \[seconds\]
  * `countdownBeep` \(number\) countdown beep \(0­ = silent, 1 =­ beeps, 2­ = voice\)
  * `minuteBeep` \(boolean\) minute beep
  * `persistent` \(number\) persistent timer
  * `name` \(string\) timer name

