local function circle(xCenter, yCenter, radius)
  local y, x
  for y=-radius, radius do
    for x=-radius, radius do
        if(x*x+y*y <= radius*radius) then
            lcd.drawPoint(xCenter+x, yCenter+y)
        end
    end
  end
end


local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawPoint() example", 0)
  circle(50, 25, 10)
  circle(65, 25, 10)
end

return{run=run}