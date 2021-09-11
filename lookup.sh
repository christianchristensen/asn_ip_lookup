#!/bin/sh

IP=$1
IPD=$(echo $IP | awk '{split($1,octets,".");for(i=1;i<=4;i++){dec+=octets[i]*256**(4-i)};printf("%i\n",dec)}')

# Routeviews lookup (more specific and actual announcement subnet to ASN)
sqlite3 -header asn_ip.db "SELECT r.cidr,r.asN AS asn,r.dec_width AS ip_width,a.name,r.aspath FROM routeviews_ipv4 r JOIN asn_names a ON r.asN=a.asn WHERE ${IPD}>=r.dec_start AND ${IPD}<=r.dec_end GROUP BY r.asN,r.dec_width ORDER BY r.dec_width ASC LIMIT 10;"

# RIR dataset lookup
sqlite3 -header asn_ip.db "SELECT ipv4.registry,ipv4.cc,ipv4.start AS ip,ipv4.value as range,ipv4.date,asn.start AS asn,asn_names.name FROM ipv4 JOIN asn ON ipv4.reg_id=asn.reg_id JOIN asn_names ON asn_names.asn=asn.start WHERE ${IPD}>=dec_start AND ${IPD}<=dec_end LIMIT 10000;"
