#!/bin/bash
action=$1
mac=$2
ip=$3
port=10000
20=202020202020
reversedMac=${mac:10:1}${mac:11:1}${mac:8:1}${mac:9:1}${mac:6:1}${mac:7:1}${mac:4:1}${mac:5:1}${mac:2:1}${mac:3:1}${mac:0:1}${mac:1:1}

# Subscribe to the device:
echo '6864001e636c'$mac$20$reversedMac$20 | xxd -r -p | nc -u -w1 -p10000 $ip $port | xxd -p

case $action in
off)
        # Switch Off
        echo '686400176463'$mac$20'0000000000' | xxd -r -p | nc -u -w1 -p10000 $ip $port | xxd -p
        ;;
on)
        # Switch On
        echo '686400176463'$mac$20'0000000001' | xxd -r -p | nc -u -w1 -p10000 $ip $port | xxd -p
        ;;
get)
        # Switch status
        echo '686400176463'$mac$20'0000000001' | xxd -r -p | nc -u -w1 -p10000 $ip $port | xxd -p
        ;;
esac

exit;
