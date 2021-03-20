# model.setLogicalSwitch\(switch, value\)

Set Logical Switch parameters

@status current Introduced in 2.0.0

## Parameters

* `switch` \(unsigned number\) logical switch number \(use 0 for LS1\)
* `value` \(table\) see model.getLogicalSwitch\(\) for table format

## Return value

none

### Notice

If a parameter is missing from the value, then that parameter remains unchanged.

To set the `and` member \(which is Lua keyword\) use the following syntax: `model.setLogicalSwitch(30, {func=4,v1=1,v2=-99, ["and"]=24})`

