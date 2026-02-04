#!/bin/bash

api1_log=/var/iplogs/api1_iplog.log
api2_log=/var/iplogs/api2_iplog.log

api1_ipv4=$(curl 'https://api.ipify.org')
api1_ipv6=$(curl 'https://api64.ipify.org')

api2_ipv4=$(curl 'http://v4.ipv6-test.com/api/myip.php')
api2_ipv6=$(curl 'http://v6.ipv6-test.com/api/myip.php')

datenow=$(date +"%d.%m.%Y  %T")

echo $datenow : IPv4: $api1_ipv4 , IPv6: $api1_ipv6 | tee -a $api1_log
echo $datenow : IPv4: $api2_ipv4 , IPv6: $api2_ipv6 | tee -a $api2_log