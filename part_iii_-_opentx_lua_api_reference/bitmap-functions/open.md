# Bitmap.open\(name\)

Loads a bitmap in memory, for later use with lcd.drawBitmap\(\). Bitmaps should be loaded only once, returned object should be stored and used for drawing. If loading fails for whatever reason the resulting bitmap object will have width and height set to zero.

Bitmap loading can fail if:

* File is not found or contains invalid image
* System is low on memory
* Combined memory usage of all Lua script bitmaps exceeds certain value

@status current Introduced in 2.2.0

## Parameters

* `name` \(string\) full path to the bitmap on SD card \(i.e. “/IMAGES/test.bmp”\)

## Return value

* `bitmap` \(object\) a bitmap object that can be used with other bitmap functions

### Notice

Only available on Horus

