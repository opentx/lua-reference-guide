# Replacement for getValue('latitude') and getValue("longitude")

#####Overview

With OpenTx 2.1 it is possible to multiple GPS sensors, each with their own user-assigned name.  This example demonstrates getting latitude and longitude from a sensor with the default name of 'GPS'

```lua
local gpsValue = "unknown"

local function rnd(v,d)
	if d then
	 return math.floor((v*10^d)+0.5)/(10^d)
	else
	 return math.floor(v+0.5)
	end
end

local function getTelemetryId(name)
	field = getFieldInfo(name)
	if field then
	  return field.id
	else
	  return -1
	end
end

local function init()
  gpsId = getTelemetryId("GPS")
end

local function background()
  gpsLatLon = getValue(gpsId)
  if (type(gpsLatLon) == "table") then
    gpsValue = rnd(gpsLatLon["lat"],4) .. ", " .. rnd(gpsLatLon["lon"],4)
  else
    gpsValue = "not currently available"
  end
end

local function run(e)
  lcd.clear()
  background() -- update current GPS position
  lcd.drawText(1,1,"OpenTx 2.1 GPS example",0)
  lcd.drawText(1,11,"GPS:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,gpsValue,0)
end

return{init=init,run=run,background=background}
```
