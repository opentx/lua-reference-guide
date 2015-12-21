local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawPixmap() example", 0)
  lcd.drawPixmap(96, 0, "/bmp/lua.bmp")
end

return{run=run}