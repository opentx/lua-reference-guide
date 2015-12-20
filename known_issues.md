### General Issues in converting scripts written for OpenTX 2.0

#### Deprecated Functions

**lcd.Lock()** is deprecated, will be obsolete in 2.2. Lua scripts must now explicitly call lcd.Clear() and re-draw the whole display if necessary.

<div class="todo">
TODO: research killEvents() and use of keys in telemetry scripts
</div>

#### Obsolete Telemetry Field Names

OpenTX 2.1 now provides more flexibility in the number and type of supported remote sensors. As a result, several field name constants are obsolete and need to be modified in scripts originally written for OpenTX 2.0.

**GPS field names** are covered in [Handling GPS Sensor Data](handling_gps_sensor_data.md)

**Lipo voltage field names (LVSS)** are covered in [Handling Lipo Sensor Data](handling_lipo_sensor_data.md)

#### Maintaining compatibility with OpenTX 2.0

**Automatic invocation of the background function** - Beginning in OpenTX 2.1 the background() function is called automatically prior to each invocation of the run() function.  Under 2.0 you must explicitly call your background function within your run function. 