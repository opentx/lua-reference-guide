# Debugging techniques

## Debugging your code before testing

### A good editor is key

It is always good practice to check your code on syntax before even testing it. There are several good LUA editors on the market, some of them for free. The ZeroBrane \([https://studio.zerobrane.com/](https://studio.zerobrane.com/)\) suite is quite powerful, and very simple to use. In the rest of this article we will assume you use ZeroBrane, but the same techniques can be used in any powerful code editor.

You can set ZeroBrane to use the Scripts directory of your simulated transmitter SDCard image as a default directory, and it will show you all the files in a nice navigation tree.

If you open a LUA file, you will already have some markup in your screen, indicating errors or important info. In ZeroBrane for instance, a not declared variable will always get underlined, so that you are made aware you forgot to declare it, or you redeclared it by accident afterwards again.

### Checking if the code can be compiled

The editor will have an "execute code" option, that will try to run the code on it's own interpreter \(code processing engine\). If there are any syntax errors, it will not be able to execute the code, and inform you about the errors. A common error in LUA is using a single equal sign \(=\) in a condition in an 'if' statement, whereas in LUA that should be a double equal sign \(==\). The interpreter will inform you about such an error ocurring, and mention the line where you made the error.

Since the OpenTX LUA environment has some own functions, like lcd.drawText\(\), the interpreter will 'complain' it cannot call an unspecified function, but it will check the entire syntax nonetheless.

### Ready to run the code

In zerobrane, if you tried to run the code, it will first save it if it could be interpreted correctly. A common workflow would be:

* do some code corrections / additions
* try to run the code in the editor
* if the code gets compiled, the edited LUA file gets saved automatically
* run the code in the transmitter simulator
* check for the desired functionality
* restart this cycle

## The lua debug viewer

In the later versions of the companion software, a LUA debug screen is available. So once you start your just syntaxically verified and saved LUA script, you can follow some of it's output and actions in the debug screen. It will tell you where and in what line an eventual crash occured.

## Using a script loader

If you made some code changes, chances are that you have to do a whole sequence of key-clicks and actions on the transmitter simulator in order to retest the same script after those changes.

You can substatially reduce the effort of all this by using a script loader in your transmitter. This is nothing more then a function that will load and run your code. If you press the enter button, it will unload the current code, and ask if you want to run the code again. So, with just two clicks, you can unload the running code and reload your updated code. On the Taranis simulator, you can also reload the LUA scripts environment with just a buttonclick.

An example of such a script is found under the notes. You can adapt it for other types of scripts of course.

## Notes

### Script Loader

This script loader will load the file /SCRIPTS/TELEM/telem1.lua, run it, and wait for an Enter Break event. Once received, it will unload the code and wait for a next Enter Break event.

```lua
local fileToLoad="/SCRIPTS/TELEM/telem1.lua"
local active = true
　
local thisPage={}
local page={}
　
local function clearTable(t)
  if type(t)=="table" then
    for i,v in pairs(t) do
      if type(v) == "table" then
        clearTable(v)
      end
      t[i] = nil
    end
  end
  collectgarbage()
  return t 
end

thisPage.init=function(...)
  if active then
    page=dofile(fileToLoad)
    page.init(...)
  end
  return true
end
　
thisPage.background=function(...)
  if active then
    page.background(...)
  end
  return true
end
　
thisPage.run=function(...)
  if active then
    page.run(...)
    active= not (...==EVT_ENTER_BREAK)
  else
    lcd.drawText( 15, 2, fileToLoad, 0 )
    lcd.drawText( 15, 20, "disabled", 0 )
    lcd.drawText( 15, 40,"press enter-button to activate",0)
    clearTable(page)
    active= (...==EVT_ENTER_BREAK)
    thisPage.init()
  end
  return not (...==EVT_MENU_BREAK)  
end
　
return thisPage
```

