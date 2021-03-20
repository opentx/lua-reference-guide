# model.setOutput\(index, value\)

Set servo parameters

@status current Introduced in 2.0.0

## Parameters

* `index` \(unsigned number\) channel number \(use 0 for CH1\)
* `value` \(table\) servo parameters, see model.getOutput\(\) for table format

## Return value

none

### Notice

If a parameter is missing from the value, then that parameter remains unchanged.

