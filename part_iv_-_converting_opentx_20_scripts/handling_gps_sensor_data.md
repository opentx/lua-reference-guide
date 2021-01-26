# Handling GPS Sensor data

## Overview

With OpenTx 2.2 it is possible to have multiple GPS sensors, each with their own set of telemetry values which may have user-assigned names.

Value names are case sensitive and may include some or all of the following:

* GPS \(latitude and longitude as a lua table containing \[lat\] and \[lng\]\)
* GSpd \(speed in knots\)
* GAlt \(altitude in meters\)
* Date \(gps date converted to local time as a lua table containing \[year\] \[mon\] \[day\] \[hour\] \[min\] \[sec\]\)
* Hdg \(heading in degrees true\)

This example demonstrates getting latitude and longitude from a sensor with the default name of 'GPS'

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
  lcd.drawText(1,1,"OpenTX 2.2 GPS example",0)
  lcd.drawText(1,11,"GPS:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,gpsValue,0)
end

return{init=init,run=run,background=background}
```

