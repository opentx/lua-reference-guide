# playFile\(name\)

Play a file from the SD card

@status current Introduced in 2.0.0, changed in 2.1.0

### Parameters

* `path` \(string\) full path to wav file \(i.e. “/SOUNDS/en/system/tada.wav”\)

  Introduced in 2.1.0: If you use a relative path, the current language is appended

  to the path \(example: for English language: `/SOUNDS/en` is appended\)

### Return value

none

## Examples

Example telemetry script

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

