--
--
-- This example demonstrates the lcd.clear() function
--
-- NOTE: Compare the output of the images below
--       lcd.clear() is NOT CALLED automatically in OpenTX 2.1
--

local startTicks
local nowTicks

local function init()
  startTicks = getTime() / 100.0
end

local function background()
  nowTicks = getTime() / 100.0
end

local function run(e)
  background()
  local interval = 10 - math.floor(nowTicks % 10)
  lcd.drawText(1, 1, "clear() example",0)
  lcd.drawText((10 * interval) + 1, 10 , interval, 0)
  if interval == 10 then
    lcd.clear()
  end
end

return{run=run, background=background}