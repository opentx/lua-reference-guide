# getDateTime\(\)

Return current system date and time that is kept by the RTC unit

### Parameters

none

### Return value

* `table` current date and time, table elements:
  * `year` \(number\) year
  * `mon` \(number\) month
  * `day` \(number\) day of month
  * `hour` \(number\) hours
  * `hour12` \(number\) hours in US format
  * `min` \(number\) minutes
  * `sec` \(number\) seconds
  * `suffix` \(text\) am or pm

## Examples

[general/getDateTime-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/general/getDateTime-example.lua)

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

![](../../.gitbook/assets/getDateTime-example.png)

