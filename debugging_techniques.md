# Debugging techniques

## Debugging your code before testing

### A good editor is key
It is always good practice to check your code on syntax before even testing it. There are several good LUA editors on the market, some of the for free. The ZeroBrane (https://studio.zerobrane.com/) suite is quite powerful, and very simple to use. In the rest of this article we will assume you use ZeroBrane, but the same techniques can be used in any powerful code editor.

You can set ZeroBrane to use the Scripts directory of your simulated transmitter SDCard image as a default directory, and it will show you all the files in a nice navigation tree.

If you open a LUA file, you will already have some markup in your screen, indicating errors or important info. In ZeroBrane for instance, a not declared variable will always get underlined, so that you are made aware you forgot to declare it, or you redeclared it afterwards again.

### Checking if the code can be compiled
The editor will have an "ececute code" option, that will try to run the code on it's own interpreter (code processing engine). If there are any syntax errors, it will not be able to execute the code, and inform you about the errors. A common error in LUA is using a single equal sign (=) in a condition in an 'if' statement, whereas in LUA that shoul be a double equal sign (==). The interpreter will inform you about some error ocurring in the vincinity an don the line that you made the error.

Since the OpenTX LUA environment has some own functions, like lcd.drawText(), the interpreter will 'complain' it cannot call an unspecified function, but it will check the entire syntax nonetheless.

### Ready to run the code
In zerobrane, if you tried to run the code, it will first save it if it could be interpreted correctly. A common workflow would be:
* do some code corrections
* try to run the code in the editor
* if the code gets compiled, the edited LUA file gets saved automatically
* you are ready to run the code in the transmitter simulator.

## The lua debug viewer
In the latest version of the companion software, a LUA debug screen is available. So once you start your just syntaxically verified and saved LUA script, you can follow some of it's output and actions in the debug screen. It will tell you where and in what line an eventual crash occured.

## Using a script loader
If your script crashes, chances are that you have to do a whole sequence of key-klicks and actions on the transmitter simulator in order to retest the same file after some change. 

You can substatially reduce the effort of all this by using a script loader in your transmitter. This is nothing more then a protected function that will run, and load your code. If it goes into error, it will catch the error, and ask if you want to run the code again.
Also, you can exit the script under test, and restart it again, just with two clicks, unloading the running code and reloading your updated code.

An example of such a script is found under the notes.

## Notes


