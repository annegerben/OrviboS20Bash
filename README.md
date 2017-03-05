# OrviboS20Bash

integrate Orvibo S20 in domoticz
copy script to folder script/bash

Create switch and add action:   
On Action: script://bash/s20Command.sh on abcdef123456 xxx.xxx.xxx.xxx    
Off Action: script://bash/s20Command.sh off abcdef123456 xxx.xxx.xxx.xxx

to check if switch turned on or off run:
s20Command.sh get abcdef123456 xxx.xxx.xxx.xxx 
