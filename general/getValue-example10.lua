local function run(e)
  --
  -- NOTE: analog values (e.g. sticks and sliders) typically range from -1024 to +1024
  --       divide by 10.24 to scale into -100% thru +100%
  --       or add 1024 and divide by 20.48 to scale into 0% thru 100%
  --
  local rsValue = getValue('rs')
  local thrValue = getValue('thr')
  lcd.clear()
  lcd.drawText(1, 1, "getvalue() example",0)
  lcd.drawText(1, 11, "rsValue: ", 0)
  lcd.drawText(lcd.getLastPos() + 2, 11, rsValue, 0)
  lcd.drawText(120, 11, "percent: ", 0)
  lcd.drawNumber(lcd.getLastPos() + 32, 11, rsValue / 10.24, PREC2)
  lcd.drawText(1, 21, "thrValue: ", 0)
  lcd.drawText(lcd.getLastPos() + 2, 21, thrValue, 0)
  lcd.drawText(120, 21, "percent: ", 0)
  lcd.drawNumber(lcd.getLastPos() + 32, 21, (thrValue + 1024) / 20.48, PREC2)
end

return{run=run}