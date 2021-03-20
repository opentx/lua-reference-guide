# lcd.drawBitmap\(bitmap, x, y \[, scale\]\)

Displays a bitmap at \(x,y\)

@status current Introduced in 2.2.0

## Parameters

* `bitmap` \(pointer\) point to a bitmap previously opened with Bitmap.open\(\)
* `x,y` \(positive numbers\) starting coordinates
* `scale` \(positive numbers\) scale in %, 50 divides size by two, 100 is unchanged, 200 doubles size. Omitting scale draws image in 1:1 scale and is faster than specifying 100 for scale.

## Return value

none

### Notice

Only available on Horus

