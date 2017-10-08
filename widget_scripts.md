
# Widget scripts

### Widgets (HORUS ONLY) Scripts

##### General description

Widgets are small scripts that show some info in a 'zone' in one of the model specific user defined (telemetry) screens. You can define those screens within the telemetry menu on the HORUS. 

Each model can have up to five custom screens, with up to 8 widgets per screen, depending on their size and layout. Each instance of a widget has his own custom settings.

##### File Location

Widgets are located on the SD card, each in their specific folder /WIDGETS/&lt;*name*&gt;/main.lua (*name* must be in 8 characters or less).

##### Lifetime of telemetry script

Widgets need to be registered through the telemetry setup menu.

* widget create function is called
* widget update function is called upon registration and at change of settings in the telemetry setup menu.
* widget background function is periodically called when custom telemetry screen is **not visible**. *Notice*:
  * This is different from the way telemetry scripts are handled
* widget refresh function is periodically called when custom telemetry screen is **visible**
* widget is stopped and disabled if it misbehaves (too long runtime, error in code, low memory)
* all widgets are stopped while one-time script is running (see Lua One-time scripts)

Once registered, widgets are started when the model is loaded.

#####Script interface definition

Every widget must include a return statement at the end, that defines its interface to the rest of OpenTX code. This statement defines:
* widget **name** (*name* must be a string of 10 characters or less)
* widget **options** array (maximum five options are allowed, 10 character names max, no spaces!)
* widget **create** function
* widget **update** function
* script **background** function
* script **refresh** function

#####Example (draws a moving counter that counts only when not visible):

```lua
local defaultOptions = {
  { "ControlX", SOURCE, 1 },
  { "ScrollZ", BOOL, 0 }, -- BOOL is actually not a boolean, but toggles between 0 and 1
  { "StepZ", VALUE, 1, 0, 10},
  { "COLOR", COLOR, RED },
}

local function createWidget(zone, options)
  lcd.setColor( CUSTOM_COLOR, options.Text_Color )
  --  the CUSTOM_COLOR is foreseen to have one color that is not radio template related, but it can be used by other widgets as well!
  local someVariable = 0
  local anotherVariable = {xWidget=0, yWidget = 0}
  return { zone=zone, options=options , someVariable = someVariable, anotherVariable=anotherVariable }
end

local function updateWidget(widgetToUpdate, newOptions)
  widgetToUpdate.options = newOptions
  lcd.setColor( CUSTOM_COLOR, widget.options.Text_Color )
  --  the CUSTOM_COLOR is foreseen to have one color that is not radio template related, but it can be used by other widgets as well!
end

local function backgroundProcessWidget(widgetToProcessInBackground)
  local function process(...)
          return ... + 1
        end
  widgetToProcessInBackground.someVariable = process (widgetToProcessInBackground.someVariable)
end

local function refreshWidget(widgetToRefresh)
  local counterLength = 50
  local counterHeight = 30
  
  --backgroundProcessWidget(widgetToRefresh) 
  --background is not called automatically in display mode, so do it here if you need it.
  
  local function anotherProcess(parameter,step,maxParameter)
          return (parameter + step) % maxParameter
        end
  
  widgetToRefresh.anotherVariable.xWidget 
    = anotherProcess ( widgetToRefresh.anotherVariable.xWidget
      ,getValue(widgetToRefresh.options.ControlX)/10.24/20 
      ,widgetToRefresh.zone.w-counterLength)
    
  widgetToRefresh.anotherVariable.yWidget 
    = anotherProcess ( widgetToRefresh.anotherVariable.yWidget
      ,(widgetToRefresh.options.ScrollZ==1) and widgetToRefresh.options.StepZ or 0
      ,widgetToRefresh.zone.h-counterHeight)
    
  lcd.drawNumber(widgetToRefresh.anotherVariable.xWidget + widgetToRefresh.zone.x
    , widgetToRefresh.anotherVariable.yWidget + widgetToRefresh.zone.y
    , widgetToRefresh.someVariable
    , LEFT + DBLSIZE + CUSTOM_COLOR);
end

return { name="MovingCntr", options=defaultOptions, create=createWidget, update=updateWidget
  , refresh=refreshWidget, background=backgroundProcessWidget }
```

#####Notes:

* *options* are only passed through to OpenTX to be used on widget creation. Don't change them during operation, this has no effect.
* *create()* function is called once when widget is loaded and begins execution.
* *update()* function is called once when widget is loaded and begins execution.
* *background()* is called periodically when custom telemetry screen containing widget is not visible.
* *refresh()* function is called periodically when custom telemetry screen containing wodget is visible.

* in the example given, you can see that no global variables or functions are needed to operate the widget.
* variables that are used throughout the widget, can best be declared *inside* the create function as local variables
* those local variablkes can then be passed through to the other functions as an element of the widget array that is returned
