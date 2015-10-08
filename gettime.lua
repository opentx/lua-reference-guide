local function run(e)
  lcd.clear()
  
  lcd.drawText(1,1,"getTime() example",0)
  
  lcd.drawText(1,11,"10ms ticks since startup:", 0)
  lcd.drawText(lcd.getLastPos()+2,11,getTime(),0)
end

return{run=run}

