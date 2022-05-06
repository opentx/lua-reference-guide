# model.setModule(index, value)



Set RF module parameters

@status current Introduced in 2.2.0, modified in 2.3.12 (proto/subproto)


## Parameters

* `index` (number) module index (0 for internal, 1 for external)

* `value` module parameters, see model.getModule()



## Return value

none

### Notice
If a parameter is missing from the value, then
that parameter remains unchanged.


