# Lcd Functions Overview

### Description

Lcd functions allow scripts to interact with the transmitter display. This access is limited to the 'run' function of One-Time and Telemetry scripts, and the 'refresh' function of Widget scripts on radios with color display.

### Notes:

The run function is periodically called when the screen is visible. In OpenTX 2.0 each invocation starts with a blank screen. Under OpenTX 2.1 screen state is always persisted across calls to the run function. **Many scripts originally written for OpenTX 2.0 require a call to lcd.clear\(\) at the beginning of their run function in order to display properly under 2.1 and 2.2.** 

For Widget scripts, lcd.clear\(\) is not needed, as each invocation starts with a blank screen showing the theme background. But it can be used to overwrite the theme background with another color by calling lcd.clear\(color\).

Many of the lcd functions accept parameters named _flags_ and _patterns_. The names and their meanings are described below.

## Flags Constants

| Name | Description | Version | Notes |
| :--- | :--- | :--- | :--- |
| 0 | normal font, default precision for numeric |  |  |
| XXLSIZE | jumbo font | 2.0.6 |  |
| DBLSIZE | double size font |  |  |
| MIDSIZE | mid sized font |  |  |
| SMLSIZE | small font |  |  |
| BOLD | bold font |  | Only color displays |
| INVERS | inverted display |  |  |
| BLINK | blinking text |  |  |
| LEFT | left justify | 2.0.6 | Default for most functions not related to bitmaps |
| RIGHT | right justify |  |  |
| CENTER | center justify |  | Only color displays |
| VCENTER | center vertically | 2.5.0 | Only color displays |
| PREC1 | single decimal place |  |  |
| PREC2 | two decimal places |  |  |
| GREY\_DEFAULT | grey fill |  |  |
| TIMEHOUR | dislay hours |  | Only for drawTimer |

## Color constants

On radios with color display, a color may be added to the above screen drawing flags. There are two types of color constants: one that is an index into a table holding a palette of theme colors, and one that is just a color.

### Indexed colors

These are the theme colors plus CUSTOM\_COLOR, and they can be changed with the function lcd.setRGB\(color\_index, color\). **Please note: if an indexed color is changed, then it changes everywhere that it is used. For the theme colors, this is not only in other widgets, but everywhere throughout the radio's user interface!**

* COLOR\_THEME\_PRIMARY1
* COLOR\_THEME\_PRIMARY2
* COLOR\_THEME\_PRIMARY3
* COLOR\_THEME\_SECONDARY1
* COLOR\_THEME\_SECONDARY2
* COLOR\_THEME\_SECONDARY3
* COLOR\_THEME\_FOCUS
* COLOR\_THEME\_EDIT
* COLOR\_THEME\_ACTIVE
* COLOR\_THEME\_WARNING
* COLOR\_THEME\_DISABLED
* CUSTOM\_COLOR

### Literal colors

These color constants cannot be changed:

* BLACK
* WHITE
* LIGHTWHITE
* YELLOW
* BLUE
* DARKBLUE
* GREY
* DARKGREY
* LIGHTGREY
* RED
* DARKRED
* GREEN
* DARKGREEN
* LIGHTBROWN
* DARKBROWN
* BRIGHTGREEN
* ORANGE

### Deprecated color constants

These should no longer be used, but they are included for backwards compatibility. The old OpenTX API had a large number of indexed theme colors, and these have been mapped to the new theme colors as follows:

* ALARM\_COLOR -&gt; COLOR\_THEME\_WARNING
* BARGRAPH\_BGCOLOR -&gt; COLOR\_THEME\_SECONDARY3
* BARGRAPH1\_COLOR -&gt; COLOR\_THEME\_SECONDARY1
* BARGRAPH2\_COLOR -&gt; COLOR\_THEME\_SECONDARY2
* CURVE\_AXIS\_COLOR -&gt; COLOR\_THEME\_SECONDARY2
* CURVE\_COLOR -&gt; COLOR\_THEME\_SECONDARY1
* CURVE\_CURSOR\_COLOR -&gt; COLOR\_THEME\_WARNING
* HEADER\_BGCOLOR -&gt; COLOR\_THEME\_FOCUS
* HEADER\_COLOR -&gt; COLOR\_THEME\_SECONDARY1
* HEADER\_CURRENT\_BGCOLOR -&gt; COLOR\_THEME\_FOCUS
* HEADER\_ICON\_BGCOLOR -&gt; COLOR\_THEME\_SECONDARY1
* LINE\_COLOR -&gt; COLOR\_THEME\_PRIMARY3
* MAINVIEW\_GRAPHICS\_COLOR -&gt; COLOR\_THEME\_SECONDARY1
* MAINVIEW\_PANES\_COLOR -&gt; COLOR\_THEME\_PRIMARY2
* MENU\_TITLE\_BGCOLOR -&gt; COLOR\_THEME\_SECONDARY1
* MENU\_TITLE\_COLOR -&gt; COLOR\_THEME\_PRIMARY2
* MENU\_TITLE\_DISABLE\_COLOR -&gt; COLOR\_THEME\_PRIMARY3
* OVERLAY\_COLOR -&gt; COLOR\_THEME\_PRIMARY1
* SCROLLBOX\_COLOR -&gt; COLOR\_THEME\_SECONDARY3
* TEXT\_BGCOLOR -&gt; COLOR\_THEME\_SECONDARY3
* TEXT\_COLOR -&gt; COLOR\_THEME\_SECONDARY1
* TEXT\_DISABLE\_COLOR -&gt; COLOR\_THEME\_DISABLED
* TEXT\_INVERTED\_BGCOLOR -&gt; COLOR\_THEME\_FOCUS
* TEXT\_INVERTED\_COLOR -&gt; COLOR\_THEME\_PRIMARY2
* TITLE\_BGCOLOR -&gt; COLOR\_THEME\_SECONDARY1
* TRIM\_BGCOLOR -&gt; COLOR\_THEME\_FOCUS
* TRIM\_SHADOW\_COLOR -&gt; COLOR\_THEME\_PRIMARY1
* WARNING\_COLOR -&gt; COLOR\_THEME\_WARNING

## Pattern Constants

| Name | Description |
| :--- | :--- |
| FORCE | pixels will be black |
| ERASE | pixels will be white |
| DOTTED | lines will appear dotted |

## Screen Constants

| Name | Description |
| :--- | :--- |
| LCD\_W | width in pixels |
| LCD\_H | height in pixels |

## Screen Information

| Radio | LCD\_W | LCD\_H | Colours |
| :--- | :--- | :--- | :--- |
| X7 | 128 | 64 | 1 bit |
| X9D | 212 | 64 | 4 bit |
| X9D+ | 212 | 64 | 4 bit |
| X9E | 212 | 64 | 4 bit |
| X10 | 480 | 272 | RGB565 |
| X12S | 480 | 272 | RGB565 |

