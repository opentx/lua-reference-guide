local function run(event)
  local source
  lcd.clear()
  lcd.drawText(1, 1,"drawSwitch() example", 0)
  for source = 1, 5 do
   lcd.drawSwitch(1, source * 10, source, 0)
   lcd.drawText(20, source * 10, " is switch source number " .. source)
  end
end

return{run=run}