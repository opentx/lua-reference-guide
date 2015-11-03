# playFile(name)

#####Overview
Plays a file from the SD card

 - Parameters:
   - name - the file name of the audio to be played
     - Version 2.0: fully qualified path to file (i.e. “/SOUNDS/en/system/tada.wav”)
     - Version 2.1: non-qualified path will prepend current language to the path (i.e. "tada.wav")
 - Returns: none
 - Status: current Introduced in 2.0.0

#####Notes:
  - Audio files names must meet the 8.3 naming convention
  - WAV files must be mono, 16bits, uncompressed, with sample rates of 8, 16 or 32kHz.

#####Example telemetry script

```lua
local eleid

local function init()
  local fieldinfo = getFieldInfo('ele')
  if fieldinfo then 
    eleid = fieldinfo.id
  else
    eleid = -1
  end
end

local function run(e)
  lcd.clear()
  lcd.drawText(1,1,"playFile() example",0)
  local eleVal = getValue(eleid)
  if eleVal > 900 then 
    lcd.drawText(1,11,"Whoa - easy there cowboy", 0)
    playFile("horn.wav")
  else
    lcd.drawText(1,11,"eleVal: " .. eleVal, 0)    
  end
end

return {init=init, run=run}
```
