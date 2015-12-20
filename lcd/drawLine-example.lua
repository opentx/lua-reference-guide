local alpha = (2 * math.pi) / 10

local function getPoint(centerX, centerY, radius, point)
  local omega = alpha * point
  local r = radius*(point % 2 + 1)/2
  local X = (r * math.sin(omega)) + centerX
  local Y = (r * math.cos(omega)) + centerY
  return X, Y
end

local function drawStar(centerX, centerY, radius, pattern, flags)
  local point = 10
  local startX, startY = getPoint(centerX, centerY, radius, point)
  for point = 1, 10 do
    local nextX, nextY = getPoint(centerX, centerY, radius, point)
    lcd.drawLine(startX, startY, nextX, nextY, pattern, flags)
    startX = nextX
    startY = nextY
  end
end

local function run(event)
  lcd.clear()
  lcd.drawText(1,1,"drawLine() example", 0)
  drawStar(30, 35, 25, SOLID, FORCE)
  drawStar(30, 35, 20, DOTTED, FORCE)
  drawStar(30, 35, 15, SOLID, FORCE)
end

return{run=run}