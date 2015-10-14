# getGeneralSettings()

#####Overview
Returns current radio settings values via a Lua table

 - Parameters: none
 - Returns: settings values (as a Lua string) containing members:
   - battMin
   - battMax
   - imperial
 - Status: current Introduced in 2.1

#####Example telemetry script

```lua
local function run(e)
  local settings = getGeneralSettings()
  lcd.clear()
  lcd.drawText(1,1,"getGeneralSettings() example",0)
  lcd.drawText(1,11,"Result: ", 0)
  if 
  lcd.drawText(lcd.getLastPos()+2,11,getVersion(),0)
end

return{run=run}
```

#####Example output
![getGeneralSettings() example output](getver.png)