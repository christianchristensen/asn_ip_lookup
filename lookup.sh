#!/bin/sh

IP=$1
IPD=$(echo $IP | awk '{split($1,octets,".");for(i=1;i<=4;i++){dec+=octets[i]*256**(4-i)};printf("%i\n",dec)}')
sqlite3 -header asn_ip.db "SELECT ipv4.registry,ipv4.cc,ipv4.start AS ip,ipv4.value as range,ipv4.date,asn.start AS asn,asn_names.name FROM ipv4 JOIN asn ON ipv4.reg_id=asn.reg_id JOIN asn_names ON asn_names.asn=asn.start WHERE ${IPD}>=dec_start AND ${IPD}<=dec_end LIMIT 10;"
