### Known Issues in converting scripts written for OpenTX 2.0

#### Deprecated Functions

**lcd.Lock()** is deprecated, will be obsolete in 2.2. Lua scripts must now explicitly call lcd.Clear() and re-draw the whole display if necessary.

<div class="todo">
TODO: research killEvents() and use of keys in telemetry scripts
</div>

#### Obsolete Telemetry Field Names

OpenTx 2.1 now provides more flexibility in the number and type of supported remote sensors. As a result, several field name constants are obsolete and need to be modified in scripts originally written for OpenTx 2.0.

GPS field names are covered in [Handling GPS Sensor Data](handling_gps_sensor_data.md)