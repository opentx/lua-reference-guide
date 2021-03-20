# getValue\(source\)

Returns the value of a source.

The list of fixed sources:

| OpenTX Version | Radio |
| :--- | :--- |
| 2.0 | [all](http://downloads-20.open-tx.org/firmware/lua_fields.txt) |
| 2.1 | [X9D and X9D+](http://downloads-21.open-tx.org/firmware/lua_fields_taranis.txt), [X9E](http://downloads-21.open-tx.org/firmware/lua_fields_taranis_x9e.txt) |
| 2.2 | [X9D and X9D+](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x9d.txt), [X9E](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x9e.txt), [Horus](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x12s.txt) |
| 2.3 | [X9D and X9D+](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x9d.txt), [X9E](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x9e.txt), [X7](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x7.txt), [Horus](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x12s.txt) |

In OpenTX 2.1.x the telemetry sources no longer have a predefined name. To get a telemetry value simply use it's sensor name. For example:

* Altitude sensor has a name "Alt"
* to get the current altitude use the source "Alt"
* to get the minimum altitude use the source "Alt-", to get the maximum use "Alt+"

@status current Introduced in 2.0.0, changed in 2.1.0, `Cels+` and `Cels-` added in 2.1.9

## Parameters

* `source`  can be an identifier \(number\) \(which was obtained by the getFieldInfo\(\)\)

  or a name \(string\) of the source.

## Return value

* `value` current source value \(number\). Zero is returned for:
  * non-existing sources
  * for all telemetry source when the telemetry stream is not received
  * far all non allowed sensors while FAI MODE is active
* `table` GPS position is returned in a table:
  * `lat` \(number\) latitude, positive is North
  * `lon` \(number\) longitude, positive is East
  * `pilot-lat` \(number\) pilot latitude, positive is North
  * `pilot-lon` \(number\) pilot longitude, positive is East
* `table` GPS date/time, see getDateTime\(\)
* `table` Cells are returned in a table \(except where no cells were detected in which case the returned value is 0\):
  * table has one item for each detected cell:
  * key \(number\) cell number \(1 to number of cells\)
  * value \(number\) current cell voltage

### Notice

Getting a value by its numerical identifier is faster then by its name. While `Cels` sensor returns current values of all cells in a table, a `Cels+` or `Cels-` will return a single value - the maximum or minimum Cels value.

