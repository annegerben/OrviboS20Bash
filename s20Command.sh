#!/bin/bash
action=$1
mac=$2
ip=$3
idx=$4
port="10000"
twenties="202020202020"
reversedMac=${mac:10:1}${mac:11:1}${mac:8:1}${mac:9:1}${mac:6:1}${mac:7:1}${mac:4:1}${mac:5:1}${mac:2:1}${mac:3:1}${mac:0:1}${mac:1:1}

# Subscribe to the device:
status=$(echo '6864001e636c'$mac$twenties$reversedMac$twenties | xxd -r -p | nc -u -w1 -p$port $ip $port | xxd -p)

case $action in
off)
        # Switch Off
        echo '686400176463'$mac$twenties'0000000000' | xxd -r -p | nc -u -w1 -p$port $ip $port | xxd -p
        ;;
on)
        # Switch On
        echo '686400176463'$mac$twenties'0000000001' | xxd -r -p | nc -u -w1 -p$port $ip $port | xxd -p
        ;;
get)
        # Switch status
	#echo "${status:47}"
	if [ ${status:47} = 0 ]; then
		echo "switch is off";
	elif [ ${status:47} = 1 ]; then
		echo "switch is on";
	else
		echo "ERROR";
	fi
poll)
        # get status of vswitch
	vstatus = curl -s 'http://127.0.0.1:8080/json.htm?type=devices&rid='$idx | jq -r '.result[].Data'
	if [ $vstatus = 'Off' ]; then
		vstatus = 0;
	elif if [ $vstatus = 'On' ]; then
		vstatus = 1;
	else
		echo "ERROR";
	fi
	# Switch status
	if [ ${status:47} = $vstatus ]; then
		echo "ok";
	else
		curl -s 'http://127.0.0.1:8080/json.htm?type=command&param=switchlight&idx='$idx'&switchcmd=Toggle';
	fi
esac

exit;
