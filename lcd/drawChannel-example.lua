local function run(e)
  lcd.clear()
  lcd.drawText(1, 1, "drawChannel('Alt') example",0)
  lcd.drawText(1, 16, "using drawChannel(): ", 0)
  lcd.drawChannel(lcd.getLastPos()+20, 16 , "Alt", 0)
  lcd.drawText(1, 31, "using getValue(): ", 0)
  lcd.drawText(lcd.getLastPos() + 22, 31, getValue("Alt"), 0)
end

return{run=run}