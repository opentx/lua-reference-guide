# getVersion\(\)

Return OpenTX version

@status current Introduced in 2.0.0, expanded in 2.1.7, radio type strings changed in 2.2.0

## Example

This example also runs in OpenTX versions where the function returned only one value:

```lua
local function run(event)
  local ver, radio, maj, minor, rev = getVersion()
  print("version: "..ver)
  if radio then print ("radio: "..radio) end
  if maj then print ("maj: "..maj) end
  if minor then print ("minor: "..minor) end
  if rev then print ("rev: "..rev) end
  return 1
end

return {  run=run }
```

Output of the above script in simulator:

```text
version: 2.1.7
radio: taranis-simu
maj: 2
minor: 1
rev: 7
```

### Parameters

none

### Return value

* `string` OpenTX version \(ie "2.1.5"\)
* `multiple` \(available since 2.1.7\) returns 5 values:
  * \(string\) OpenTX version \(ie "2.1.5"\)
  * \(string\) radio type: `x12s`, `x10`, `x9e`, `x9d+`, `x9d` or `x7`.

    If running in simulator the "-simu" is added

  * \(number\) major version \(ie 2 if version 2.1.5\)
  * \(number\) minor version \(ie 1 if version 2.1.5\)
  * \(number\) revision number \(ie 5 if version 2.1.5\)

