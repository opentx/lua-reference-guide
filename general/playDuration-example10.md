The one time script below will announce "zero hours 1 minute and 1 second"

```lua
local function run()
  playDuration(61, 1) -- announce "zero hours 1 minute and 1 second
  return 1
end

return { run=run }
```
