
local function run()
  lcd.clear()
  lcd.drawText(10,22,"drawFilledRectangle()",DBLSIZE)
  lcd.drawFilledRectangle(5, 5, 103, 50, GREY_DEFAULT)
  lcd.drawFilledRectangle(152, 33, 50, 25, SOLID)
end

return{run=run}