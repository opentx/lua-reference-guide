# Handling Lipo Sensor Data
With OpenTx 2.1 it is possible to have multiple Lipo sensors, each with a user-assigned name. The call to getValue() returns a table with the current voltage of each of the cells it is monitoring.

This example demonstrates getting Lipo cell voltage from a sensor with the default name of 'Cels'

#####Example:

```lua
local cellValue = "unknown"
local cellResult = nil
local cellID = nil

local function getTelemetryId(name)
	field = getFieldInfo(name)
	if field then
	  return field.id
	else
	  return -1
	end
end

local function init()
  cellId = getTelemetryId("Cels")
end

local function background()
  cellResult = getValue(cellId)
  if (type(cellResult) == "table") then
    cellValue = ""
    for i, v in ipairs(cellResult) do
      cellValue = cellValue .. i .. ": " .. v .. " "
    end
  else
    cellValue = "telemetry not available"
  end
end

local function run(e)
  background()
  lcd.clear()
  lcd.drawText(1,1,"OpenTX 2.1 cell voltage example",0)
  lcd.drawText(1,11,"Cels:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,cellValue,0)
end

return{init=init,run=run,background=background}
```
