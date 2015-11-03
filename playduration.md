# playDuration(seconds, forceHours)

#####Parameters:
  *  seconds - total number of seconds to announce (integer)
  *  forceHours - force announcement of hours (if > 0)

#####Returns:
  *  none

#####Status: 
  *  Implemented in 2.1.0

Example:

The one time script below will announce "zero hours 1 minute and 1 second"

```lua
local function run()
  playDuration(61, 1) -- announce "zero hours 1 minute and 1 second
  return 1
end

return { run=run }
```