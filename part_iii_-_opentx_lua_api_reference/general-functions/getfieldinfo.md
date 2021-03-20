# getFieldInfo\(name\)

Return detailed information about field \(source\)

The list of valid sources is available:

| OpenTX Version | Radio |
| :--- | :--- |
| 2.0 | [all](http://downloads-20.open-tx.org/firmware/lua_fields.txt) |
| 2.1 | [X9D and X9D+](http://downloads-21.open-tx.org/firmware/lua_fields_taranis.txt), [X9E](http://downloads-21.open-tx.org/firmware/lua_fields_taranis_x9e.txt) |
| 2.2 | [X9D and X9D+](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x9d.txt), [X9E](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x9e.txt), [Horus](http://downloads.open-tx.org/2.2/release/firmware/lua_fields_x12s.txt) |
| 2.3 | [X9D and X9D+](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x9d.txt), [X9E](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x9e.txt), [X7](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x7.txt), [Horus](http://downloads.open-tx.org/2.3/release/firmware/lua_fields_x12s.txt) |

@status current Introduced in 2.0.8, 'unit' field added in 2.2.0

## Parameters

* `name` \(string\) name of the field

## Return value

* `table` information about requested field, table elements:
  * `id`   \(number\) field identifier
  * `name` \(string\) field name
  * `desc` \(string\) field description
  * 'unit' \(number\) unit identifier [Full list](https://github.com/opentx/opentx-2-3-lua-reference-guide/tree/0d355d19f1961b689994cf78b84005864d33f9b5/appendix/units.html)
* `nil` the requested field was not found

