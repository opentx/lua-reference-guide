local function run(e)
  local fieldinfo = getFieldInfo('rs')
  lcd.clear()
  lcd.drawText(1,1,"getFieldInfo() example",0)
  if fieldinfo then 
    lcd.drawText(1,11,"id: ", 0)
    lcd.drawText(lcd.getLastPos()+2,11,fieldinfo['id'],0)
    lcd.drawText(1,21,"name: ", 0)
    lcd.drawText(lcd.getLastPos()+2,21,fieldinfo['name'],0)
    lcd.drawText(1,31,"desc: ", 0)
    lcd.drawText(lcd.getLastPos()+2,31,fieldinfo['desc'],0)
  else
    lcd.drawText(1,11,"Requested field not available!", 0)    
  end
end

return{run=run}
