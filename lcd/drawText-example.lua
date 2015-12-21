local function run(event)
  lcd.clear()
  lcd.drawText(1, 1,"drawText() example", 0)
  lcd.drawText(1, 11,"0 - default", 0)
  lcd.drawText(1, 21,"BLINK", BLINK)
  lcd.drawText(1, 31,"INVERS + BLINK", INVERS + BLINK)
  lcd.drawText(120, 1,"XXLSIZE", DBLSIZE)
  lcd.drawText(120, 21,"MIDSIZE", MIDSIZE)
  lcd.drawText(120, 36,"SMLSIZE", SMLSIZE)
end

return{run=run}