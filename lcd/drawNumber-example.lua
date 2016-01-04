function round(num, decimals)
  local mult = 10^(decimals or 0)
  return math.floor(num * mult + 0.5) / mult
end

local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawNumber() example", 0)
  local myNumber = 123.456789
  lcd.drawNumber(75, 11, myNumber, 0)
  lcd.drawNumber(75, 21, myNumber, PREC1)
  lcd.drawNumber(75, 31, myNumber, PREC2)
  lcd.drawText(1, 41, "Compare to drawText: " .. myNumber, 0)
  lcd.drawText(1, 51, "Or custom rounding: " .. round(myNumber, 4), 0)
end

return{run=run}