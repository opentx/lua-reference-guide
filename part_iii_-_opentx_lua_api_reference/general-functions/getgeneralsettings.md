# getGeneralSettings\(\)

Returns \(some of\) the general radio settings

@status current Introduced in 2.0.6, `imperial` added in TODO, `language` and `voice` added in 2.2.0, gtimer added in 2.2.2.

## Parameters

none

## Return value

* `table` with elements:
  * `battWarn` \(number\) radio battery range - warning value
  * `battMin` \(number\) radio battery range - minimum value
  * `battMax` \(number\) radio battery range - maximum value
  * `imperial` \(number\) set to a value different from 0 if the radio is set to the

    IMPERIAL units

  * `language` \(string\) radio language \(used for menus\)
  * `voice` \(string\) voice language \(used for speech\)
  * `gtimer` \(number\) radio global timer in seconds \(does not include current session\)

