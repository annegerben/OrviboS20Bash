# OrviboS20Bash

integrate Orvibo S20 in domoticz
copy script to folder script/bash

Create switch and add action:   
On Action: script://bash/s20Command.sh on abcdef123456 xxx.xxx.xxx.xxx    
Off Action: script://bash/s20Command.sh off abcdef123456 xxx.xxx.xxx.xxx

to check if switch turned on or off run:
s20Command.sh get abcdef123456 xxx.xxx.xxx.xxx 

Prepare before you begin (pre-requirements)
The documentation below is for Linux on Raspberry PI. The script has not been tested on other platforms.
you must install jq: http://stedolan.github.io/jq/

Install jq
The easiest way to install jq is using a package manager like apt-get for Debian and Raspbian. If that does not work you can build jq from source.
apt-get
apt-get update
apt-get install jq
