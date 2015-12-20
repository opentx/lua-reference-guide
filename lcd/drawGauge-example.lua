
local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawGauge() example", 0)
  lcd.drawGauge(1, 11, 120, 25, 250, 1000)
end

return{run=run}