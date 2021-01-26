# model.getModule\(index\)

Get RF module parameters

`Type` values:

* 0 NONE
* 1 PPM
* 2 XJT\_PXX1
* 3 ISRM\_PXX2
* 4 DSM2
* 5 CROSSFIRE
* 6 MULTIMODULE
* 7 R9M\_PXX1
* 8 R9M\_PXX2
* 9 R9M\_LITE\_PXX1
* 10 R9M\_LITE\_PXX2
* 11 R9M\_LITE\_PRO\_PXX1
* 12 R9M\_LITE\_PRO\_PXX2
* 13 SBUS
* 14 XJT\_LITE\_PXX2

`subType` values for XJT\_PXX1:

* -1 OFF
* 0 D16
* 1 D8
* 2 LR12

@status current Introduced in TODO

## Parameters

* `index` \(number\) module index \(0 for internal, 1 for external\)

## Return value

* `nil` requested module does not exist
* `table` module parameters:
  * `subType` \(number\) protocol index
  * `modelId` \(number\) receiver number
  * `firstChannel` \(number\) start channel \(0 is CH1\)
  * `channelsCount` \(number\) number of channels sent to module
  * `Type` \(number\) module type
  * if the module type is Multi additional information are available
  * `protocol` \(number\) protocol number
  * `subProtocol` \(number\) sub-protocol number
  * `channelsOrder` \(number\) first 4 channels expected order

