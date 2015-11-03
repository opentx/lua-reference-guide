# playNumber(value, unit, prec)

#####Overview
Used for numeric announcements

 - Parameters:
   - value - numeric value to be announced
   - unit - will be appended to the value
   - prec - precision attribute used to interpret decimal place (values 0, PREC1, PREC2)
 - Returns: none
 - Status: current Introduced in 2.0.0

#####Notes:
 - 2.0 Only - note automatic conversion of units for distance, speed, and temperature

#####Example mix script
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
####OpenTX 2.0
|	Unit	|	Sound	|	File (.wav)	|	Automatic conversion rules	|
|	---	|	---	|	---	|	---	|
|	0	|		|		|		|
|	1	|	Volts	|	116	|		|
|	2	|	Amps	|	118	|		|
|	3	|	Meters per Second	|	120	|		|
|	4	|	*missing file*	|	122	|		|
|	5	|	Kilometers per Hour / Miles per Hour	|	124 / 142	|	Input value is KPH	|
|	6	|	Meters / Feet	|	126 / 140	|	Input value is meters	|
|	7	|	Degrees	|	128	|	Input value is celsius, converted to Fahrenheit for Imperial	|
|	8	|	Percent	|	130	|		|
|	9	|	Milliamps	|	132	|		|
|	10	|	Milliamp Hours	|	134	|		|
|	11	|	Watts	|	136	|		|
|	12	|	DB	|	138	|		|
|	13	|	Feet	|	140	|		|
|	14	|	Kilometers per Hour / Miles per Hour	|	124 / 142	|	Input value is in Knots, converted to KPH or MPH	|
|	15	|	Hours	|	144	|		|
|	16	|	Minutes	|	146	|		|
|	17	|	Seconds	|	148	|		|
|	18	|	RPM	|	150	|		|
|	19	|	Gee	|	152	|		|
|	20	|	Degrees	|	128	|		|

								
								
####OpenTX 2.1
|	2.1 Unit	|	Sound	|	Sound File (.wav)	|		
|	---	|	---	|	---	|		
|	1	|	Volts	|	116	|		
|	2	|	Amps	|	118	|		
|	3	|	Milliamps	|	120	|		
|	4	|	Knots	|	122	|		
|	5	|	Meters per Second	|	124	|		
|	6	|	Feet per Second	|	126	|		
|	7	|	Kilometers per Hour	|	128	|		
|	8	|	Miles per Hour	|	130	|		
|	9	|	Meters	|	132	|		
|	10	|	Feet	|	134	|		
|	11	|	Degrees Celsius	|	136	|		
|	12	|	Degrees Fahrenheit	|	138	|		
|	13	|	Percent	|	140	|		
|	14	|	Milliamp Hours	|	142	|		
|	15	|	Watts	|	144	|		
|	16	|	DB	|	146	|		
|	17	|	RPM	|	148	|		
|	18	|	Gee	|	150	|		
|	19	|	Degrees	|	152	|		
|	20	|	Milliliters	|	154	|		
|	21	|	Fluid Ounces	|	156	|		
|	22	|	Hours	|	158	|		
|	23	|	Minutes	|	160	|		
|	24	|	Seconds	|	162	|		
