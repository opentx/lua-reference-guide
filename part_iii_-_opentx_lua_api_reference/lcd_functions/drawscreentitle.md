# lcd.drawScreenTitle\(title, page, pages\)

Draw a title bar

@status current Introduced in 2.0.0

### Parameters

* `title` \(string\) text for the title
* `page` \(number\) page number
* `pages` \(number\) total number of pages. Only used as indicator on the right side of title bar. \(i.e. idx=2, cnt=5, display `2/5`\)

### Return value

none

#### Notice

Only available on Taranis

## Examples

[lcd/drawScreenTitle-example](https://raw.githubusercontent.com/opentx/lua-reference-guide/opentx_2.2/lcd/drawScreenTitle-example.lua)

```lua
local function run(event)
  lcd.clear()
  lcd.drawText(20, 20,"drawScreenTitle", DBLSIZE + BLINK)
  lcd.drawScreenTitle("This screen has one page", 1, 1)
end

return{run=run}
```

![](../../.gitbook/assets/drawScreenTitle-example.png)

