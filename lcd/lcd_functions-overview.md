# Lcd Functions Overview

##### Description

Lcd functions allow scripts to interact with the transmitter display. This access is limited to the 'run' functions of One-Time and Telemetry scripts. 

##### Notes:

The run function is periodically called when the screen is visible. In OpenTX 2.1 each invocation starts with a blank screen, whereas 2.0 scripts screen images persisted across calls.

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
|LEFT|left justify|2.0.6|Only for drawNumber|
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
