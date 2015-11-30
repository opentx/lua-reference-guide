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
