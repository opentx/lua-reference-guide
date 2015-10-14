# Replacement for getValue('latitude') and getValue("longitude")

```lua
   gpsLatLon = getValue("GPS")
   if (type(gpsLatLon) == "table") then
      LocationLat = gpsLatLon["lat"]
      LocationLon = gpsLatLon["lon"]
    end
```
