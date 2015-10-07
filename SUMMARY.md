# Summary

* [OpenTX 2.1 Lua Reference Guide](README.md)
* Introduction
   * [Acknowledgments](acknowledgments.md)
   * [Getting Started](getting_started.md)
* Part I - Script Type Overview
   * [Mix Scripts](mix.md)
   * [Telemetry Scripts](telemetry.md)
   * [Wizard Script](wizard.md)
* Part II - OpenTX Lua API Programming Guide
   * [Included Lua Libraries](included_lua_libraries.md)
   * [Input Table Syntax](input_table_syntax.md)
   * [Output Table Syntax](output_table_syntax.md)
   * [Run Function Syntax](run_function_syntax.md)
   * [Init Function Syntax](init_function_syntax.md)
   * [Return Statement Syntax](return_statement_syntax.md)
* Part III - OpenTX Lua API Reference
   * Constants
       * [Key Event Constants](key_events.md)
   * General Functions
       * [getTime()](gettime.md)
       * [getDateTime()](getdatetime.md)
       * [getVersion()](getversion.md)
       * [getGeneralSettings()](getgeneralsettings.md)
       * [getValue()](getvalue_function.md)
       * [getFieldInfo()](getfieldinfo_function.md)
       * [playFile()](playfile.md)
       * [playNumber()](playnumber.md)
       * [playDuration()](playduration.md)
       * [playTone()](playtone.md)
       * [popupInput()](popupinput.md)
       * [defaultStick()](defaultstick.md)
       * [defaultChannel()](defaultchannel.md)
       * [killEvents()](killevents.md)
       * [GREY()](grey.md)
   * Model Functions
       * model.getInfo()
       * model.setInfo()
       * model.getModule()
       * model.setModule()
       * module.getTimer()
       * model.setTimer()
       * model.resetTimer()
       * model.getInputsCount()
       * model.getInput()
       * model.insertInput()
       * model.deleteInput()
       * model.deleteInputs()
       * model.getMixesCount()
       * model.getMix()
       * model.insertMix()
       * model.deleteMix()
   * Display Functions
* Part IV - Converting OpenTX 2.0 Scripts
   * [Known Issues](known_issues.md)

