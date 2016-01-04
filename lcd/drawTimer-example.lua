local upTime

local function background()
  upTime = getTime() / 100
end

local function run(event)
  background()
  lcd.clear()
  lcd.drawText(1, 1,"drawTimer() example", 0)
  lcd.drawTimer(1, 10, upTime, TIMEHOUR)
end

return{run=run}