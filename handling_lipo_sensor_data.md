# Handling Lipo Sensor Data

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
  lcd.clear()
  lcd.drawText(1,1,"OpenTx 2.1.x testing",0)
  lcd.drawText(1,11,"Cels:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,cellValue,0)
end

return{init=init,run=run,background=background}
```
