
### Getting Started


#### Downloading OpenTX Companion

OpenTX Companion 2.1 is available for download at http://www.open-tx.org/downloads.html

This is major version with completely new telemetry handling. Please read [this thread](http://www.openrcforums.com/forum/viewtopic.php?f=45&t=7239) before upgrading from a previous version, and carefully check the changelogs on each upgrade. This branch is the first to support the FrSky Taranis X9E (tray version).


#### Updating firmware with Lua option selected

If you intend to use mixer scripts, when updating the firmware on your transmitter you need to make sure the lua option is checked in the settings for your radio profile (Main menu -> Settings ->Settings...) as shown below. This is not required if you only intend to run telemetry, one-time and function scripts, support for those is included by default.

Also note that the SD Structure path should contain a valid path to a copy of your transmitter's SD card contents, although that's not specific to Lua.

![Edit Settings dialog from OpenTX Companion](companion-settings.png)