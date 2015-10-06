# Output Table Syntax

#####Overview

Outputs are only used in mix scripts. The output table defines only name(s), the actual values are determined by the script's [run function](run_function_syntax.md).

```lua
{ name1, name2 }
```


Example:
```lua
{ "Calc", "Out" }
```

#####Notes:

>Output name is limited to four characters.

&nbsp;
>Number Format
Outputs are 16 bit signed integers when they leave Lua script and are then divided by 10.24 to produce
output value in percent:

|Script Return Value|Mix Value in OpenTX|
|-----|----|
|0| 0%|
|996| 97.2%|
|1024| 100%|
|-1024|-100%|
