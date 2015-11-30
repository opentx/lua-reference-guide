Example mix script

```Lua
local nbr = 0
local unit = 0
local prec = 0
local lastnbr = 0
local lastunit = 0
local lastprec = 0
local lasttime = 0

local input =
    {
        { "innbr", SOURCE},
        { "inprec", SOURCE},
        { "toggle", SOURCE}
    }

local output = {"nbr", "prec", "unit"}

local function run(innbr, inprec, toggle)
  local change = false
  local advance = false
  local timenow = getTime()
  
  nbr = innbr -- will range from - 1024 thru + 1024
  prec = math.floor((inprec + 1024) * (2 / 2014)) -- force range to 0 thru 2
  
  if (toggle > 0) then
    change = true
    advance = true
  end
  
  if math.abs(lastnbr - nbr) > 10 then
    change = true
  end
  
  if not (lastprec == prec) then
    change = true
  end
  
  if change and ((timenow - lasttime) > 200) then
    lasttime = timenow
    lastnbr = nbr
    if advance then
      lastunit = (lastunit + 1) % 31
    end
    lastprec = prec
    if (lastprec == 0) then
      playNumber(lastnbr, lastunit, 0)
    elseif (lastprec == 1) then
      playNumber(lastnbr, lastunit, PREC1)
    else
      playNumber(lastnbr, lastunit, PREC2)
    end
  end
  return lastnbr * 10.24, lastprec * 10.24, lastunit * 10.24
end

return {run=run, input=input, output=output}

```