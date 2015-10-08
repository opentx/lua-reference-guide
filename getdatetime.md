# getDateTime()

#####Overview
Returns the date and time from the transmitter realtime clock

 - Parameters: none
 - Returns: a Lua table with the following named elements
 - - year
 - - mon
 - - day
 - - hour
 - - min
 - - sec
 - Status: current Introduced in 2.0.0

#####Example telemetry script

```lua
local function run(e)
  local datenow = getDateTime()
  lcd.clear()
  lcd.drawText(1,1,"getDateTime() example",0)
  lcd.drawText(1,11,"year, mon, day: ", 0)
  lcd.drawText(lcd.getLastPos()+2,11,datenow.year..", "..datenow.mon..", "..datenow.day,0)
  lcd.drawText(1,21,"hour, min, sec: ", 0)
  lcd.drawText(lcd.getLastPos()+2,21,datenow.hour..", "..datenow.min..", "..datenow.sec,0)
end

return{run=run}
```


#####Example output
![getDateTime() example output](getdttim.png)