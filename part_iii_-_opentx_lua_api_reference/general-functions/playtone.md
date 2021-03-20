# playTone\(frequency, duration, pause \[, flags \[, freqIncr\]\]\)

Play a tone

@status current Introduced in 2.1.0

## Parameters

* `frequency` \(number\) tone frequency in Hz \(from 150 to 15000\)
* `duration` \(number\) length of the tone in milliseconds
* `pause` \(number\) length of the silence after the tone in milliseconds
* `flags` \(number\):
  * `0 or not present` play with normal priority.
  * `PLAY_BACKGROUND` play in background \(built in vario function uses this context\)
  * `PLAY_NOW` play immediately
* `freqIncr` \(number\) positive number increases the tone pitch \(frequency with time\), negative number decreases it. The frequency changes every 10 milliseconds, the change is `freqIncr * 10Hz`. The valid range is from -127 to 127.

## Return value

none

