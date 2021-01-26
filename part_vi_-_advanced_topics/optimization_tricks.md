# Speed/memory optimizaton tricks

## Faster getValue\(\)

Normally one uses [getValue\(\)](../part_iii_-_opentx_lua_api_reference/general_functions/getvalue.md) function with the source/filed name like so:

```lua
local foo = getValue("bar")
```

This works and is recommended method for portability. But if a particular script needs to get the value of certain field a lot, then it is faster to use this syntax:

```lua
local my_id = getFiledInfo("bar").id    -- here we get the numerical id of the filed "bar"

local function run_a_lot()
  local my_value = getValue(my_id)      -- exactly the same effect as local my_value = getValue("bar"), but faster
end
```

Why is this method faster? With the function [getFieldInfo\(name\)](../part_iii_-_opentx_lua_api_reference/general_functions/getfieldinfo.md) we get the `numerical id` of the wanted filed. The function has to find the requested value by its name in the table of all available sources. That search takes some time.

When we use this syntax the search is only done once. In comparison in the first example the search must be performed every time `getValue("bar")` is called.

So when the `getValue(my_id)` is called the search can be skipped and the requested value if fetched directly.

Of course there is a trade-of, the second example uses little more memory \(for variable `my_id`\).

