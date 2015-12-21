local function run(event)
  lcd.clear()
  lcd.drawText(20, 20,"drawScreenTitle", DBLSIZE + BLINK)
  lcd.drawScreenTitle("This screen has one page", 1, 1)
end

return{run=run}