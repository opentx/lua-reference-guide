local function run()
lcd.clear()
lcd.drawText(10,22,"drawRectangle()",DBLSIZE)
lcd.drawRectangle(5, 5, 150, 50, SOLID)
lcd.drawRectangle(6, 6, 150, 50, GREY_DEFAULT)
lcd.drawRectangle(7, 7, 150, 50, SOLID)
lcd.drawRectangle(8, 8, 150, 50, GREY_DEFAULT)
end

return{run=run}