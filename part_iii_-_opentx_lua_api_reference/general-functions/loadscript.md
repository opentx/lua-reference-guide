# loadScript\(file \[, mode\], \[,env\]\)

Load a Lua script file. This is similar to Lua's own [loadfile\(\)](https://www.lua.org/manual/5.2/manual.html#pdf-loadfile) API method, but it uses OpenTx's optional pre-compilation feature to save memory and time during load.

Return values are same as from Lua API loadfile\(\) method: If the script was loaded w/out errors then the loaded script \(or "chunk"\) is returned as a function. Otherwise, returns nil plus the error message.

@status current Introduced in 2.2.0

## Example

```lua
  fun, err = loadScript("/SCRIPTS/FUNCTIONS/print.lua")
  if (fun ~= nil) then
     fun("Hello from loadScript()")
  else
     print(err)
  end
```

### Parameters

* `file` \(string\) Full path and file name of script. The file extension is optional and ignored \(see `mode` param to control which extension will be used\). However, if an extension is specified, it should be ".lua" \(or ".luac"\), otherwise it is treated as part of the file name and the .lua/.luac will be appended to that.
* `mode` \(string\) \(optional\) Controls whether to force loading the text \(.lua\) or pre-compiled binary \(.luac\) version of the script. By default OTx will load the newest version and compile a new binary if necessary \(overwriting any existing .luac version of the same script, and stripping some debug info like line numbers\). You can use `mode` to control the loading behavior more specifically. Possible values are:
  * `b` only binary.
  * `t` only text.
  * `T` \(default on simulator\) prefer text but load binary if that is the only version available.
  * `bt` \(default on radio\) either binary or text, whichever is newer \(binary preferred when timestamps are equal\).
  * Add `x` to avoid automatic compilation of source file to .luac version.

      Eg: "tx", "bx", or "btx".

  * Add `c` to force compilation of source file to .luac version \(even if existing version is newer than source file\).

      Eg: "tc" or "btc" \(forces "t", overrides "x"\).

  * Add `d` to keep extra debug info in the compiled binary.

      Eg: "td", "btd", or "tcd" \(no effect with just "b" or with "x"\).
* `env` \(integer\) See documentation for Lua function loadfile\(\).

### Return value

* `function` The loaded script, or `nil` if there was an error \(e.g. file not found or syntax error\).
* `string` Error message\(s\), if any. Blank if no error occurred.

#### Notice

Note that you will get an error if you specify `mode` as "b" or "t" and that specific version of the file does not exist \(eg. no .luac file when "b" is used\). Also note that `mode` is NOT passed on to Lua's loader function, so unlike with loadfile\(\) the actual file content is not checked \(as if no mode or "bt" were passed to loadfile\(\)\).

