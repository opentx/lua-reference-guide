# Introduction

OpenTX 2.0 added support for Lua (current version 5.2.2) user scripts.
Lua is a lightweight multi-paradigm programming language designed as a scripting language. More at Wikipedia
There are several types of Lua scripts used in openTX. More general information about Lua scripts can be found on page http://www.open-tx.org/lua-instructions.html
Lua scripts must be placed on SD card in correct folders and have an extension .lua. Maximum Lua script file name length is TODO characters. The script folders have been reorganized in OpenTX 2.0.3. The folder structure looks like this:
/SCRIPTS/WIZARD/ - For the Wizard script
/SCRIPTS/MIXES/ - For model scripts
/SCRIPTS/FUNCTIONS/ - For function scripts
/SCRIPTS/«modelname»/telemXX.lua - For telemetry scripts
/SCRIPTS/TEMPLATES/ - For template scripts

| Lua Standard Libraries | Included |
| -- | -- |
| package | no |
| coroutine | no |
| table | no |
| io | no |
| os | no |
| string | no |
| bit | 2.1.0 |
| math | 2.0.0 |
| debug | no |


