# Return Statement Syntax

The return statment is the last statement in an OpenTX Lua script.  It defines the input/output table values and functions used to run the script.

Parameters *init*, *input* and *output* are optional. If a script doesn't use them, they can be omitted from return statement.

Example without *init* and *output*:

```lua
local inputs = { { "Aileron", SOURCE }, { "Ail. ratio", VALUE, -100, 100, 0 } }

local function run_func(ail, ratio)
    -- do some stuff
    if (ail > 50) and ( ratio < 40) then
        playFile("foo.wav")    
    end
end

-- script that only uses input and run
return { run=run_func, input=inputs }
```