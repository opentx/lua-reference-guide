# model.setCurve\(curve, params\)

Set Curve parameters

The first and last x value must -100 and 100 and x values must be monotonically increasing

@status current Introduced in 2.2.0

Example setting a 4-point custom curve:

```lua
  params = {}
  params["x"] =  {-100, -34, 77, 100}
  params["y"] = {-70, 20, -89, -100}
  params["smooth"] = true
  params["type"] = 1
  val =  model.setCurve(2, params)
```

setting a 6-point standard smoothed curve

```lua
 val = model.setCurve(3, {smooth=true, y={-100, -50, 0, 50, 100, 80}})
```

## Parameters

* `curve` \(unsigned number\) curve number \(use 0 for Curve1\)
* `params` see model.getCurve return format for table format. setCurve uses standard lua array indexing and arrays start at index 1

## Return value

* \`\` 0 - Everything okay

  ```text
     1 - Wrong number of points
     2 - Invalid Curve number
     3 - Cuve does not fit anymore
     4 - point of out of index
     5 - x value not monotonically increasing
     6 - y value not in range [-100;100]
     7 - extra values for y are set
     8 - extra values for x are set
  ```

