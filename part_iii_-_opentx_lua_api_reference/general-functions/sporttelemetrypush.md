# sportTelemetryPush\(\)

This functions allows for sending SPORT telemetry data toward the receiver, and more generally, to anything connected SPORT bus on the receiver or transmitter.

When called without parameters, it will only return the status of the output buffer without sending anything.

@status current Introduced in 2.2.0, retval nil added in 2.3.4

## Parameters

* `sensorId` physical sensor ID
* `frameId` frame ID
* `dataId` data ID
* `value` value

## Return value

* `boolean` data queued in output buffer or not.
* `nil` incorrect telemetry protocol.

