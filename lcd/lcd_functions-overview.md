# Lcd Functions Overview

##### Description

Lcd functions allow scripts to interact with the transmitter display. This access is limited to the 'run' functions of One-Time and Telemetry scripts. Widget scripts on the Horus (X10 and X12S) can make use of the lcd functions as well. 

##### Notes:

The run function is periodically called when the screen is visible. In OpenTX 2.0 each invocation starts with a blank screen (unless lcd.lock() is used). Under OpenTX 2.1 screen state is always persisted across calls to the run function. **Many scripts originally written for OpenTX 2.0 require a call to lcd.clear() at the beginning of their run function in order to display properly under 2.1 and 2.2.**

Many of the lcd functions accept parameters named *flags* and *patterns*.  The names and their meanings are described below.

#### Flags Constants

|Name|Description|Version|Notes|
|---|---|---|---|
|0|normal font, default precision for numeric|||
|DBLSIZE|double size font|||
|MIDSIZE|mid sized font|||
|SMLSIZE|small font|||
|INVERS|inverted display|||
|BLINK|blinking text|||
|XXLSIZE|jumbo font|2.0.6||
|LEFT|left justify|2.0.6| Default for most functions not related to bitmaps|
|RIGHT|right justify|||
|PREC1|single decimal place|||
|PREC2|two decimal places|||
|GREY_DEFAULT|grey fill|||
|TIMEHOUR|dislay hours||Only for drawTimer|

#### Patterns Constants

|Name|Description|
|---|---|
|FORCE|pixels will be black|
|ERASE|pixels will be white|
|DOTTED|lines will appear dotted|

#### Screen Constants

|Name|Description|
|---|---|
|LCD_W|width in pixels|
|LCD_H|height in pixels|

#### Screen Information

| Radio | LCD_W | LCD_H | Colours |
| --- | --- | --- | --- |
| X7 | 128 | 64 | 1 bit |
| X9D | 212 | 64 | 4 bit |
| X9D+ | 212 | 64 | 4 bit |
| X9E | 212 | 64 | 4 bit |
| X10 | 480 | 272 | RGB565 |
| X12S | 480 | 272 | RGB565 |


